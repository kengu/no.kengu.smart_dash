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
    return _cache.getOrFetch(
      'where',
      () => ref.read(deviceRepositoryProvider).where(compare),
      ttl: ttl,
    );
  }

  Optional<List<Device>> whereCached(Function(Device e) compare) {
    return _cache.get('where');
  }
}

@Riverpod(keepAlive: true)
DeviceService deviceService(DeviceServiceRef ref) => DeviceService(ref);
