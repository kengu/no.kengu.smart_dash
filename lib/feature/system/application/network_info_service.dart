import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/system/data/network_device_info_repository.dart';
import 'package:smart_dash/feature/system/domain/network_info.dart';
import 'package:network_tools_flutter/network_tools_flutter.dart';
import 'package:smart_dash/util/future.dart';

part 'network_info_service.g.dart';

class NetworkInfoService {
  NetworkInfoService(this.ref) {
    ref.onDispose(() {
      _events.close();
      _states.close();
    });
  }

  final Ref ref;

  final _cache = FutureCache(prefix: '$NetworkInfoService');

  final _devices = <NetworkDeviceInfo>{};
  final _events = StreamController<NetworkDeviceEvent>.broadcast();
  final _states = StreamController<List<NetworkDeviceInfo>>.broadcast();

  List<NetworkDeviceInfo> get devicesCached => _devices.toList();

  Stream<NetworkDeviceEvent> get events => _events.stream;

  Stream<List<NetworkDeviceInfo>> get states => _states.stream;

  Optional<DateTime> get lastUpdated => _cache.lastCached('discover');

  Future<List<NetworkDeviceInfo>> init() async {
    final state =
        await ref.read(networkDeviceInfoRepositoryProvider.notifier).load();
    _devices.addAll(state.values);
    return _devices.toList();
  }

  Future<Optional<NetworkInfo>> getNetworkInfo({
    Duration ttl = const Duration(seconds: 10),
  }) {
    return _cache.getOrFetch('info', () async {
      final local = await getLocalDevice();
      if (local.isPresent) {
        final hosts = await getAvailableDevices();
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
        ipAddress: interface.ipAddress,
        deviceName: interface.ipAddress,
        hostId: interface.hostId.toString(),
      );
      return Optional.ofNullable(device);
    }, ttl: ttl);
  }

  Future<List<NetworkDeviceInfo>> getAvailableDevices({
    Duration ttl = Duration.zero,
  }) async {
    return await _cache.getOrFetch('available', () async {
      final interface = await NetInterface.localInterface();
      if (interface == null) {
        final state = ref.read(networkDeviceInfoRepositoryProvider);
        return state.valueOrNull?.values.toList() ?? [];
      }
      final address = interface.ipAddress;
      String subnet = address.substring(0, address.lastIndexOf('.'));
      final result = HostScanner.getAllPingableDevicesAsync(subnet);
      return _update(result);
    }, ttl: ttl);
  }

  Stream<List<NetworkDeviceInfo>> discover({
    Duration ttl = Duration.zero,
  }) async* {
    await _cache.getOrFetch('discover', () async {
      final interface = await NetInterface.localInterface();
      if (interface == null) {
        return null;
      }
      final address = interface.ipAddress;
      String subnet = address.substring(0, address.lastIndexOf('.'));
      final result = HostScanner.getAllPingableDevicesAsync(subnet);
      unawaited(_update(result));
      return result;
    }, ttl: ttl);

    await for (final states in _states.stream) {
      yield states;
    }
  }

  Future<List<NetworkDeviceInfo>> _update(Stream<ActiveHost>? result) async {
    final available = <NetworkDeviceInfo>[];
    if (result != null) {
      final state = Map.of(
        ref.read(networkDeviceInfoRepositoryProvider).value ??
            NetworkDeviceInfoMap(),
      );
      await for (final it in result) {
        _cache.setTTL('devices', DateTime.now());
        NetworkDeviceInfo device = await _toDevice(it);
        available.add(device);

        final added = _devices.add(device);
        if (!state.containsKey(device.hostId)) {
          _events.add(NetworkDeviceAdded(device));
        }

        state[device.hostId] = device;
        if (added) {
          _states.add(_devices.toList());
        }
      }

      // Cleanup
      final missing = state.values.where((e) => !available.contains(e));
      for (final it in missing) {
        _devices.remove(it);
        state.remove(it.hostId);
      }

      await ref
          .read(networkDeviceInfoRepositoryProvider.notifier)
          .save(state.values);

      _events.addStream(Stream.fromIterable(missing.map(
        NetworkDeviceRemoved.new,
      )));

      _states.add(state.values.toList());
    }
    return available;
  }

  Future<NetworkDeviceInfo> _toDevice(ActiveHost it) async {
    final vendor = await it.vendor;
    final hostName = await it.hostName;
    final arpData = await it.arpData;
    final deviceName = await it.deviceName;
    return NetworkDeviceInfo(
      hostId: it.hostId,
      hostName: hostName,
      ipAddress: it.address,
      deviceName: deviceName,
      vendorName: vendor?.vendorName,
      macAddress: arpData?.macAddress,
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

class NetworkDeviceRemoved extends NetworkDeviceEvent {
  NetworkDeviceRemoved(super.data);
}

@Riverpod(keepAlive: true)
NetworkInfoService networkInfoService(NetworkInfoServiceRef ref) =>
    NetworkInfoService(ref);
