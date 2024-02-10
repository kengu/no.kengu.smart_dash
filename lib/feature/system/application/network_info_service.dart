import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/system/application/timing_service.dart';
import 'package:smart_dash/feature/system/data/network_device_info_repository.dart';
import 'package:smart_dash/feature/system/domain/network_info.dart';
import 'package:network_tools_flutter/network_tools_flutter.dart';
import 'package:smart_dash/util/future.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:strings/strings.dart';

part 'network_info_service.g.dart';

class NetworkInfoService {
  NetworkInfoService(this.ref) {
    ref.onDispose(() {
      _events.close();
      _states.close();
    });
  }

  final Ref ref;

  // TODO: Make configurable
  final liveCheck = const Duration(minutes: 1);
  final fullCheck = const Duration(minutes: 5);

  final _cache = FutureCache(prefix: '$NetworkInfoService');

  final _devices = <String, NetworkDeviceInfo>{};
  final _events = StreamController<NetworkDeviceEvent>.broadcast();
  final _states = StreamController<List<NetworkDeviceInfo>>.broadcast();

  StreamSubscription<DateTime>? _timing;

  List<NetworkDeviceInfo> get devicesCached => [..._devices.values];

  Stream<NetworkDeviceEvent> get events => _events.stream;

  Stream<List<NetworkDeviceInfo>> get states => _states.stream;

  Optional<DateTime> get lastUpdated => _cache.lastCached('discover');

  /// Start listing to timing events for periodic discovery
  void bind() async {
    assert(
      _timing == null,
      'DeviceDriverManager is already bound to timing service',
    );

    _timing = ref
        .read(timingServiceProvider)
        .events
        .throttle(liveCheck)
        .listen((e) => _discover(_needFullScan(e, fullCheck)));

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

  void init() async {
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
        final hosts = await getAvailableDevices(
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

  Future<List<NetworkDeviceInfo>> getAvailableDevices({
    bool fullScan = true,
    Duration ttl = Duration.zero,
  }) {
    return _cache.getOrFetch('available', () async {
      final interface = await NetInterface.localInterface();
      final state = ref.read(networkDeviceInfoRepositoryProvider);
      if (interface == null) {
        return state.valueOrNull?.values.toList() ?? [];
      }
      final address = interface.ipAddress;
      final subnet = address.substring(0, address.lastIndexOf('.'));
      final result = HostScanner.getAllPingableDevicesAsync(
        subnet,
        hostIds: _toHostIds(fullScan, state),
      );
      return _update(result);
    }, ttl: ttl);
  }

  DateTime? _lastFullScan;

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
    Duration ttl = Duration.zero,
  }) async* {
    await _discover(fullScan, ttl);
    await for (final states in _states.stream) {
      yield states;
    }
  }

  Future<void> _discover(bool fullScan, [Duration ttl = Duration.zero]) {
    return _cache.getOrFetch('_discover', () async {
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
                DateTime.now().difference(_lastFullScan ?? DateTime.now()))
            .inMinutes;
        debugPrint(
          '----------------------------\n'
          '$NetworkInfoService >> Scan ${fullScan ? 'All' : 'IsAlive: [${hostIds.join(',')}], full scan in $left min'}\n'
          '----------------------------',
        );
      }
      final result = HostScanner.getAllPingableDevicesAsync(
        subnet,
        hostIds: hostIds,
      );
      unawaited(_update(result));
      return;
    }, ttl: ttl);
  }

  Future<List<NetworkDeviceInfo>> _update(Stream<ActiveHost>? result) async {
    final pingable = <NetworkDeviceInfo>[];
    if (result != null) {
      final oldState = ref.read(networkDeviceInfoRepositoryProvider).value ??
          NetworkDeviceInfoMap();
      final newState = Map.of(oldState);

      // Wait for discovery progress
      await for (final it in result) {
        _cache.setTTL('devices', DateTime.now());
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

        _states.add(newState.values.toList());
      }
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

abstract class NetworkDeviceEvent {
  NetworkDeviceEvent(this.data);
  final NetworkDeviceInfo data;
}

class NetworkDeviceAdded extends NetworkDeviceEvent {
  NetworkDeviceAdded(super.data);
}

class NetworkDeviceOnline extends NetworkDeviceEvent {
  NetworkDeviceOnline(super.data);
}

class NetworkDeviceOffline extends NetworkDeviceEvent {
  NetworkDeviceOffline(super.data);
}

class NetworkDeviceRemoved extends NetworkDeviceEvent {
  NetworkDeviceRemoved(super.data);
}

@Riverpod(keepAlive: true)
NetworkInfoService networkInfoService(NetworkInfoServiceRef ref) =>
    NetworkInfoService(ref);
