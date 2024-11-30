import 'dart:async';

import 'package:async/async.dart';
import 'package:optional/optional.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_device/smart_dash_device.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';
import 'package:stream_transform/stream_transform.dart';

part 'device_service.g.dart';

/// Service for managing [Device]s
class DeviceService extends DriverService<Device, DriverDataEvent<Device>,
    DeviceDriver, DeviceManager> {
  DeviceService(Ref ref) : super(ref, FutureCache(prefix: '$DeviceService')) {
    ref.onDispose(() {
      _controller.close();
      for (final e in _subscriptions) {
        e.cancel();
      }
    });
  }

  final List<StreamSubscription> _subscriptions = [];

  final _controller = StreamController<DriverEvent>.broadcast();

  @override
  DeviceManager get manager => ref.read(deviceManagerProvider);

  @override
  Stream<DriverEvent> get events {
    return StreamGroup.merge([super.events, _controller.stream]);
  }

  /// Get stream of [DeviceEvent]s. This is a helper equivalent to
  /// ```dart
  /// events.whereType<DeviceEvent>()
  /// ```
  Stream<DeviceEvent> get changes {
    return events.whereType<DeviceEvent>();
  }

  /// Get stream of [DriverDevicesEvent]s. This is a helper equivalent to
  /// ```dart
  /// events
  ///   .whereType<DriverDevicesEvent>()
  ///   .where(DeviceDriverManager.shouldProcess)
  /// ```
  /// Get changes in batches
  Stream<DriverDevicesEvent> get batches {
    return events
        .whereType<DriverDevicesEvent>()
        .where(DeviceManager.shouldProcess);
  }

  /// Get [Device] with given [id] stored locally
  Future<Optional<Device>> get(
    Identity id, {
    bool notify = true,
    Duration? ttl = const Duration(seconds: 5),
  }) {
    return cache.getOrFetch(
      'get:$id',
      () => ref.read(deviceRepositoryProvider).get(id),
      onResult: (data) {
        if (notify && data.isPresent) {
          _controller.add(
            DeviceUpdated.now(data.value),
          );
        }
      },
      ttl: ttl,
    );
  }

  /// Set [Device] properties and store
  /// changes locally if successfully applied
  Future<Optional<Device>> update(
    Device device, {
    Duration? ttl = const Duration(seconds: 5),
  }) async {
    final id = Identity.of(device);
    final key = 'set:$id';
    return cache.getOrFetch(
      key,
      () async {
        final driver = manager.getDriver(device.service);
        final success = await driver.updateDevice(device);
        if (success) {
          _controller.add(
            DeviceUpdatePending.now(device),
          );
          await ref.read(deviceRepositoryProvider).updateAll([device]);
          // Update caches
          cache.setIfExists<List<Device>>(
            'all',
            (all) => all
              ..removeWhere((e) => e.id == device.id)
              ..add(device),
          );
          _controller.add(
            DeviceUpdateCompleted.now(device),
          );
          return cache.set(
            key,
            Optional.of(device),
          );
        }
        return const Optional.empty();
      },
      ttl: ttl,
    );
  }

  /// Get [Device] with given [id] stored in cache
  Optional<Device> getCached(Identity id) {
    return cache.get('get:$id');
  }

  /// Get all [Device]s stored locally
  Future<List<Device>> getAll({
    Duration? ttl = const Duration(seconds: 5),
    bool notify = true,
  }) {
    return cache.getOrFetch(
      'all',
      () => ref.read(deviceRepositoryProvider).getAll(),
      onResult: (devices) {
        if (notify) {
          for (final it in devices.map(DeviceUpdated.now)) {
            _controller.add(it);
          }
        }
      },
      ttl: ttl,
    );
  }

  /// Get all [Device]s cached i memory
  Optional<List<Device>> getAllCached() {
    return cache.get('all');
  }

  Future<List<Device>> where(Function(Device e) compare,
      {Duration? ttl = const Duration(seconds: 5)}) async {
    final devices = <Device>[];
    for (final device in await getAll(ttl: ttl)) {
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

  Optional<List<Token>> getTokensCached() {
    return cache.get('tokens');
  }

  Future<List<Token>> getTokens([
    Duration? ttl = const Duration(seconds: 5),
  ]) async {
    return cache.getOrFetch('tokens', () async {
      final tokens = <Token>[];
      final repo = ref.read(deviceRepositoryProvider);
      for (final device in await repo.getAll()) {
        tokens.addAll(device.toTokens());
      }
      return tokens;
    }, ttl: ttl);
  }
}

@Riverpod(keepAlive: true)
DeviceService deviceService(DeviceServiceRef ref) {
  return DeviceService(ref);
}
