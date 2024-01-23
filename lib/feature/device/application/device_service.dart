import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/device/application/device_driver_manager.dart';
import 'package:smart_dash/feature/device/data/device_repository.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/util/future.dart';

part 'device_service.g.dart';

class DeviceService {
  DeviceService(this.ref);

  final Ref ref;

  final _cache = FutureCache(prefix: '$DeviceService');

  Stream<Device> get updated async* {
    await for (final e in ref.read(deviceDriverManagerProvider).updated) {
      for (final device in e.devices) {
        yield device;
      }
    }
  }

  /// Get [Device] with given [id] stored locally
  Future<Optional<Device>> get(Identity id,
      {Duration? ttl = const Duration(seconds: 5)}) {
    return _cache.getOrFetch(
      'get:$id',
      () => ref.read(deviceRepositoryProvider).get(id),
      ttl: ttl,
    );
  }

  /// Set [Device] properties and store
  /// changes locally if successfully applied
  Future<Optional<Device>> set(Device device,
      {Duration? ttl = const Duration(seconds: 5)}) async {
    final id = Identity.of(device);
    return _cache.getOrFetch(
      'set:$id',
      () async {
        final service =
            ref.read(deviceDriverManagerProvider).getDriver(device.service);
        final success = await service.setDevice(device);
        if (success) {
          await ref.read(deviceRepositoryProvider).setAll([device]);
          // Update caches
          _cache.setIfExists<List<Device>>(
            'all',
            (all) => all
              ..removeWhere((e) => e.id == device.id)
              ..add(device),
          );
          return _cache.set(
            'get:$id',
            Optional.of(device),
          );
        }
        return const Optional.empty();
      },
      ttl: ttl,
    );
  }

  /// Get [Device] with given [id] stored in cache
  Optional<Device> getCached(String id) {
    return _cache.get('get:$id');
  }

  /// Get all [Device]s stored locally
  Future<List<Device>> getAll({Duration? ttl = const Duration(seconds: 5)}) {
    return _cache.getOrFetch(
      'all',
      () => ref.read(deviceRepositoryProvider).getAll(),
      ttl: ttl,
    );
  }

  /// Get all [Device]s cached i memory
  Optional<List<Device>> getAllCached() {
    return _cache.get('all');
  }

  Future<List<Device>> where(Function(Device e) compare,
      {Duration? ttl = const Duration(seconds: 5)}) async {
    final devices = <Device>[];
    for (final device in await getAll()) {
      if (compare(device)) {
        devices.add(device);
      }
    }
    return devices;
  }

  Optional<List<Device>> whereCached(Function(Device e) compare) {
    final cached = getAllCached();
    if (cached.isPresent) {
      final devices = <Device>[];
      for (final device in cached.value) {
        if (compare(device)) {
          devices.add(device);
        }
      }
      return Optional.of(devices);
    }
    return const Optional.empty();
  }
}

@Riverpod(keepAlive: true)
DeviceService deviceService(DeviceServiceRef ref) => DeviceService(ref);
