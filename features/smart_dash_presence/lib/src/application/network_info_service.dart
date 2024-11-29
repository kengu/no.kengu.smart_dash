import 'dart:async';

import 'package:collection/collection.dart';
import 'package:logging/logging.dart';
import 'package:network_tools/network_tools.dart';
import 'package:optional/optional.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_presence/smart_dash_presence.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:strings/strings.dart';
import 'package:universal_io/io.dart' as io;

part 'network_info_service.g.dart';

class NetworkInfoService {
  NetworkInfoService(
    this.ref, {
    this.debug = false,
    required bool enabled,
  }) : _enabled = enabled {
    ref.onDispose(() {
      stop();
      _events.close();
      _states.close();
      _progress.close();
    });
  }

  final Ref ref;
  final bool debug;

  final _log = Logger('$NetworkInfoService');

  static bool get _isDesktop =>
      io.Platform.isWindows || io.Platform.isLinux || io.Platform.isMacOS;

  // TODO: Make configurable
  final liveCheck = Duration(minutes: _isDesktop ? 1 : 5);
  final fullCheck = Duration(minutes: _isDesktop ? 5 : 10);

  final _cache = FutureCache(prefix: '$NetworkInfoService');

  final _devices = <String, NetworkDeviceInfo>{};
  final _events = StreamController<NetworkDeviceEvent>.broadcast();
  final _states = StreamController<List<NetworkDeviceInfo>>.broadcast();
  final _progress = StreamController<NetworkScanProgress>.broadcast();

  StreamSubscription<DateTime>? _timing;

  /// Check if service is started
  bool get isStarted => _timing != null;

  /// Check if service is enabled
  bool get isEnabled => _enabled;
  bool _enabled;

  bool enable(bool value, [bool check = true]) {
    final old = _enabled;
    _enabled = value;
    if (old != value && check) {
      _onCheck(DateTime.now());
    }
    return old != value;
  }

  /// Get
  List<NetworkDeviceInfo> get devices => [..._devices.values];

  Stream<NetworkDeviceEvent> get events => _events.stream;
  Stream<NetworkScanProgress> get progress => _progress.stream;
  Stream<List<NetworkDeviceInfo>> get states => _states.stream;

  bool get isIdle => !inProgress;
  bool get inProgress => _lastProgress.inProgress;

  NetworkScanProgress getProgress() => _lastProgress;
  NetworkScanProgress _lastProgress = NetworkScanProgress.none();

  Optional<DateTime> get lastUpdated => Optional.ofNullable(_lastFullScan);
  DateTime? _lastFullScan;

  /// Start listing to timing events for periodic discovery
  Future<void> start() async {
    assert(
      !isStarted,
      '$NetworkInfoService is already started',
    );

    final repo = ref.read(networkDeviceInfoRepositoryProvider);
    final items = await repo.load();
    _devices.addAll(items);

    _timing = ref
        .read(timingServiceProvider)
        .events
        .throttle(liveCheck)
        .listen(_onCheck, cancelOnError: false);

    if (debug) {
      _events.stream.listen(
        (e) => _log.fine(
          '${e.runtimeType}::${e.data.ipAddress}',
        ),
        cancelOnError: false,
      );
    }

    _log.info(
      'Service is ${isEnabled ? 'ENABLED' : 'DISABLED'}',
    );
  }

  void _onCheck(DateTime tic) {
    if (isEnabled && isIdle) {
      _discover(_needFullScan(tic, fullCheck));
    }
  }

  /// Stop listing to timing events.
  void stop() {
    _timing?.cancel();
    _timing = null;
  }

  Future<Optional<NetworkInfo>> getNetworkInfo({
    bool fullScan = true,
    Duration ttl = const Duration(seconds: 10),
  }) {
    return _cache.getOrFetch('info', () async {
      final local = await getLocalDevice();
      if (local.isPresent) {
        final hosts = await getAllDevices(
          fullScan: fullScan,
          ttl: ttl,
        );
        return Optional.of(NetworkInfo(
          devices: hosts,
          local: local.value,
        ));
      }
      return const Optional.empty();
    }, ttl: ttl);
  }

  Future<Optional<NetworkDeviceInfo>> getLocalDevice({
    Duration ttl = Duration.zero,
  }) {
    return _cache.getOrFetch('device', () async {
      final interface = await NetInterface.localInterface();
      if (interface == null) {
        return const Optional.empty();
      }
      final device = NetworkDeviceInfo(
        isAvailable: true,
        ipAddress: interface.ipAddress,
        deviceName: interface.ipAddress,
        hostId: interface.hostId.toString(),
      );
      return Optional.ofNullable(device);
    }, ttl: ttl);
  }

  Future<List<NetworkDeviceInfo>> getAllDevices({
    bool fullScan = true,
    Duration ttl = Duration.zero,
  }) {
    return _cache.getOrFetch('all', () async {
      final interface = await NetInterface.localInterface();
      final repo = ref.read(networkDeviceInfoRepositoryProvider);
      final items = await repo.load();
      if (interface == null) {
        return items.values.toList();
      }
      final address = interface.ipAddress;
      final subnet = address.substring(0, address.lastIndexOf('.'));
      final result = HostScannerService.instance.getAllPingableDevicesAsync(
        subnet,
        hostIds: _toHostIds(fullScan, items),
      );
      return _update(fullScan, result);
    }, ttl: ttl);
  }

  bool _needFullScan(DateTime e, Duration max) {
    if (_lastFullScan == null) return true;
    return e.difference(_lastFullScan!) > max;
  }

  List<int> _toHostIds(bool fullScan, NetworkDeviceInfoMap items) {
    if (fullScan || _lastFullScan == null) _lastFullScan = DateTime.now();
    final hostIds = fullScan
        ? <int>[]
        : items.values
            .map((e) => e.hostId)
            .where((e) => e.isNumeric())
            .map(int.parse)
            .toList();
    return hostIds;
  }

  /// Scan for devices on local network.
  ///
  /// If a scan is [inProgress] already,
  /// this method returns [devices] discovered
  /// so far imitatively.
  FutureOr<List<NetworkDeviceInfo>> scan({
    bool fullScan = true,
  }) async {
    if (isIdle) {
      return _discover(fullScan);
    }
    return devices;
  }

  /// Get a new stream of network device discoveries
  Stream<List<NetworkDeviceInfo>> discover({
    bool fullScan = true,
  }) async* {
    if (isIdle) {
      _discover(fullScan);
    }
    await for (final states in _states.stream) {
      yield states;
    }
  }

  Future<List<NetworkDeviceInfo>> _discover(bool fullScan) {
    _lastProgress = NetworkScanProgress(fullScan, 0.0);
    return guard(
      () async {
        final interface = await NetInterface.localInterface();
        if (interface == null) {
          return [];
        }
        final address = interface.ipAddress;
        final repo = ref.read(networkDeviceInfoRepositoryProvider);
        final items = await repo.load();
        final hostIds = _toHostIds(fullScan, items);
        String subnet = address.substring(0, address.lastIndexOf('.'));
        if (debug) {
          final left = (fullCheck -
              DateTime.now().difference(
                _lastFullScan ?? DateTime.now(),
              ));
          _log.fine(fullScan
              ? 'Full Scan'
              : 'Live Scan: [${hostIds.join(',')}]. '
                  'Full Scan in ${left.inMinutes} min');
        }

        _progress.add(
          _lastProgress = NetworkScanProgress(fullScan, 0.0),
        );

        final result = HostScannerService.instance.getAllPingableDevicesAsync(
          subnet,
          hostIds: hostIds,
          progressCallback: (e) {
            if (_timing == null || !isEnabled) {
              return;
            }

            _log.fine(
              '${fullScan ? 'Full Scan' : 'Live Scan'} '
              'PROGRESS: ${e.toStringAsFixed(1)} %',
            );
            _progress.add(
              _lastProgress = NetworkScanProgress(fullScan, e),
            );
          },
        );
        return _update(
          fullScan,
          result,
        );
      },
      task: '_discover',
      name: '$NetworkDeviceInfo',
    );
  }

  Future<List<NetworkDeviceInfo>> _update(
      bool fullScan, Stream<ActiveHost>? result) async {
    final pingable = <NetworkDeviceInfo>[];
    final repo = ref.read(networkDeviceInfoRepositoryProvider);
    if (result != null) {
      final oldState = await repo.load();
      final newState = Map.of(oldState);

      // Wait for discovery progress
      await for (final it in result) {
        if (_timing == null || !isEnabled) {
          _log.fine(
            '${fullScan ? 'Full Scan' : 'Live Scan'} STOPPED',
          );
          _progress.add(
            _lastProgress = NetworkScanProgress.done(fullScan),
          );
          return pingable;
        }

        _cache.setTTL('all', DateTime.now());
        NetworkDeviceInfo next = await _toDevice(it);

        pingable.add(next);

        final prev = newState[next.hostId];
        final isNew = prev == null;
        _devices[next.hostId] = next;
        newState[next.hostId] = next;

        if (isNew) {
          _events.add(NetworkDeviceAdded(next));
        } else if (next.isAvailable && !prev.isAvailable) {
          _events.add(NetworkDeviceOnline(next));
        } else if (!next.isAvailable && prev.isAvailable) {
          _events.add(NetworkDeviceOffline(next));
        }

        _states.add(_devices.values.toList());
      }

      // Cleanup
      final ids = pingable.map((e) => e.hostId).toSet();
      final missing = oldState.keys.where((e) => !ids.contains(e));
      for (final it in missing) {
        newState.remove(it);
        _devices.remove(it);
      }

      await repo.save(newState.values);

      // Notify if devices are missing
      if (missing.isNotEmpty) {
        _events.addStream(
          Stream.fromIterable(
            missing
                .map((e) => _devices[e])
                .whereNotNull()
                .map((NetworkDeviceRemoved.new)),
          ),
        );
      }

      _states.add(newState.values.toList());

      _log.fine(
        '${fullScan ? 'Full Scan' : 'Live Scan'} PROGRESS: 100 %',
      );
      _progress.add(
        _lastProgress = NetworkScanProgress.done(fullScan),
      );
    }
    return pingable;
  }

  Future<NetworkDeviceInfo> _toDevice(ActiveHost it) async {
    final vendor = await it.vendor;
    final arpData = await it.arpData;
    final hostName = await it.hostName;
    final deviceName = await it.deviceName;
    final isAvailable = it.pingData.response != null;
    return NetworkDeviceInfo(
      hostId: it.hostId,
      hostName: hostName,
      ipAddress: it.address,
      deviceName: deviceName,
      isAvailable: isAvailable,
      vendorName: vendor?.vendorName,
      macAddress: arpData?.macAddress,
      aliveWhen: isAvailable ? DateTime.now() : _devices[it.hostId]?.aliveWhen,
    );
  }
}

class NetworkScanProgress {
  const NetworkScanProgress(this.fullScan, this.value);
  final bool fullScan;
  final double value;

  bool get isNone => value < 0;
  bool get isDone => value >= 100;
  bool get inProgress => !(isNone || isDone);

  static NetworkScanProgress none([bool fullScan = true]) =>
      NetworkScanProgress(fullScan, -1);

  static NetworkScanProgress done([bool fullScan = true]) =>
      NetworkScanProgress(fullScan, 100);
}

abstract class NetworkDeviceEvent {
  const NetworkDeviceEvent(this.data);
  final NetworkDeviceInfo data;
}

class NetworkDeviceAdded extends NetworkDeviceEvent {
  const NetworkDeviceAdded(super.data);
}

class NetworkDeviceOnline extends NetworkDeviceEvent {
  const NetworkDeviceOnline(super.data);
}

class NetworkDeviceOffline extends NetworkDeviceEvent {
  const NetworkDeviceOffline(super.data);
}

class NetworkDeviceRemoved extends NetworkDeviceEvent {
  const NetworkDeviceRemoved(super.data);
}

extension NetworkDeviceEventList on List<NetworkDeviceInfo> {
  Iterable<NetworkDeviceEvent> get asEvents => map(
      (e) => e.isAvailable ? NetworkDeviceOnline(e) : NetworkDeviceOffline(e));
}

@Riverpod(keepAlive: true)
NetworkInfoService networkInfoService(NetworkInfoServiceRef ref) =>
    NetworkInfoService(ref, debug: true, enabled: false);
