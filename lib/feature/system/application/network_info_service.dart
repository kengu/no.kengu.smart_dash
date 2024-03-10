import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/setting/data/setting_repository.dart';
import 'package:smart_dash/feature/setting/domain/setting.dart';
import 'package:smart_dash/feature/system/application/timing_service.dart';
import 'package:smart_dash/feature/system/data/network_device_info_repository.dart';
import 'package:smart_dash/feature/system/domain/network_info.dart';
import 'package:network_tools/network_tools.dart';
import 'package:smart_dash/util/future.dart';
import 'package:smart_dash/util/guard.dart';
import 'package:smart_dash/util/platform.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:strings/strings.dart';

part 'network_info_service.g.dart';

class NetworkInfoService {
  NetworkInfoService(this.ref) {
    ref.onDispose(() {
      unbind();
      _events.close();
      _states.close();
      _progress.close();
    });
  }

  final Ref ref;

  // TODO: Make configurable
  final liveCheck = Duration(minutes: Platform.isDesktop ? 1 : 5);
  final fullCheck = Duration(minutes: Platform.isDesktop ? 5 : 10);

  final _cache = FutureCache(prefix: '$NetworkInfoService');

  final _devices = <String, NetworkDeviceInfo>{};
  final _events = StreamController<NetworkDeviceEvent>.broadcast();
  final _states = StreamController<List<NetworkDeviceInfo>>.broadcast();
  final _progress = StreamController<NetworkScanProgress>.broadcast();

  StreamSubscription<DateTime>? _timing;

  /// Controlled by SettingType.enablePresence
  bool get isEnabled => ref
      .read(settingRepositoryProvider.notifier)
      .getOrDefault(SettingType.enablePresence, false);

  List<NetworkDeviceInfo> get devices => [..._devices.values];

  Stream<NetworkDeviceEvent> get stream => _events.stream;
  Stream<NetworkScanProgress> get progress => _progress.stream;
  Stream<List<NetworkDeviceInfo>> get states => _states.stream;

  bool get isIdle => !inProgress;
  bool get inProgress => _lastProgress.inProgress;

  NetworkScanProgress getProgress() => _lastProgress;
  NetworkScanProgress _lastProgress = NetworkScanProgress.none();

  Optional<DateTime> get lastUpdated => Optional.ofNullable(_lastFullScan);
  DateTime? _lastFullScan;

  /// Start listing to timing events for periodic discovery
  void bind() {
    assert(
      _timing == null,
      'DeviceDriverManager is already bound to timing service',
    );

    _timing = ref.read(timingServiceProvider).events.throttle(liveCheck).listen(
      (e) {
        if (isEnabled && isIdle) {
          _discover(_needFullScan(e, fullCheck));
        }
      },
    );

    if (kDebugMode) {
      _events.stream.listen(
        (e) => debugPrint(
          '----------------------------\n'
          '$NetworkInfoService >> ${e.runtimeType}::${e.data.ipAddress}\n'
          '----------------------------',
        ),
      );
    }
  }

  /// Stop listing to timing events.
  void unbind() {
    _timing?.cancel();
    _timing = null;
  }

  Future<void> init() async {
    final state =
        await ref.read(networkDeviceInfoRepositoryProvider.notifier).load();
    _devices.addAll(state);
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
      final state = ref.read(networkDeviceInfoRepositoryProvider);
      if (interface == null) {
        return state.valueOrNull?.values.toList() ?? [];
      }
      final address = interface.ipAddress;
      final subnet = address.substring(0, address.lastIndexOf('.'));
      final result = HostScannerService.instance.getAllPingableDevicesAsync(
        subnet,
        hostIds: _toHostIds(fullScan, state),
      );
      return _update(fullScan, result);
    }, ttl: ttl);
  }

  bool _needFullScan(DateTime e, Duration max) {
    if (_lastFullScan == null) return true;
    return e.difference(_lastFullScan!) > max;
  }

  List<int> _toHostIds(bool fullScan, AsyncValue<NetworkDeviceInfoMap> state) {
    if (fullScan || _lastFullScan == null) _lastFullScan = DateTime.now();
    final hostIds = fullScan
        ? <int>[]
        : state.valueOrNull?.values
                .map((e) => e.hostId)
                .where((e) => e.isNumeric())
                .map(int.parse)
                .toList() ??
            <int>[];
    return hostIds;
  }

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

  Future<void> _discover(bool fullScan) {
    _lastProgress = NetworkScanProgress(fullScan, 0.0);
    return guard(
      () async {
        final interface = await NetInterface.localInterface();
        if (interface == null) {
          return;
        }
        final address = interface.ipAddress;
        final hostIds = _toHostIds(
          fullScan,
          ref.read(networkDeviceInfoRepositoryProvider),
        );
        String subnet = address.substring(0, address.lastIndexOf('.'));
        if (kDebugMode) {
          final left = (fullCheck -
              DateTime.now().difference(_lastFullScan ?? DateTime.now()));
          debugPrint(
            '----------------------------\n'
            '$NetworkInfoService >> ${fullScan ? 'Full Scan' : 'Live Scan: [${hostIds.join(',')}]. Full Scan in ${left.inMinutes} min'}\n'
            '----------------------------',
          );
        }

        _progress.add(
          _lastProgress = NetworkScanProgress(fullScan, 0.0),
        );

        final result = HostScannerService.instance.getAllPingableDevicesAsync(
          subnet,
          hostIds: hostIds,
          progressCallback: (e) {
            debugPrint(
              '----------------------------\n'
              '$NetworkInfoService >> ${fullScan ? 'Full Scan' : 'Live Scan'} PROGRESS: ${e.toStringAsFixed(1)} %\n'
              '----------------------------',
            );
            _progress.add(
              _lastProgress = NetworkScanProgress(fullScan, e),
            );
          },
        );
        unawaited(_update(fullScan, result));
        return;
      },
      task: '_discover',
      name: '$NetworkDeviceInfo',
    );
  }

  Future<List<NetworkDeviceInfo>> _update(
      bool fullScan, Stream<ActiveHost>? result) async {
    final pingable = <NetworkDeviceInfo>[];
    if (result != null) {
      final oldState = ref.read(networkDeviceInfoRepositoryProvider).value ??
          NetworkDeviceInfoMap();
      final newState = Map.of(oldState);

      // Wait for discovery progress
      await for (final it in result) {
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

      await ref
          .read(networkDeviceInfoRepositoryProvider.notifier)
          .save(newState.values);

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

      debugPrint(
        '----------------------------\n'
        '$NetworkInfoService >> ${fullScan ? 'Full Scan' : 'Live Scan'} PROGRESS: 100 %\n'
        '----------------------------',
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
    NetworkInfoService(ref);
