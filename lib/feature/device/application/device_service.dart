import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/device/application/device_driver.dart';
import 'package:smart_dash/feature/device/application/device_driver_manager.dart';
import 'package:smart_dash/feature/device/data/device_repository.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/util/future.dart';
import 'package:smart_dash/util/stream.dart';

part 'device_service.g.dart';

class DeviceService {
  DeviceService(this.ref) {
    ref.onDispose(() {
      _controller.close();
      _subscription.cancel();
    });
    _subscription = ref.read(deviceDriverManagerProvider).updated.listen(
          _handle,
          cancelOnError: false,
        );
  }

  final Ref ref;

  final _cache = FutureCache(prefix: '$DeviceService');

  final _controller = StreamController<DeviceEvent>.broadcast();

  late final StreamSubscription<DriverUpdatedEvent> _subscription;

  // TODO Make delay configurable
  final Duration delay = const Duration(milliseconds: 50);

  void _handle(DriverUpdatedEvent e) async {
    final stream = Stream.fromIterable(e.devices);
    // NOTE: We should not add events too fast to stream for
    // overall performance reasons. And StreamProviders only
    // sees last event when events are added more frequently
    // than 60 fps (less than 17 milliseconds between each event).
    await for (final device in stream.delayed(delay)) {
      // Process list of flow events in order of completion
      _controller.add(DeviceUpdated(device));
    }
  }

  /// Get stream of device events
  Stream<DeviceEvent> get stream => _controller.stream.distinct();

  /// Get [Device] with given [id] stored locally
  Future<Optional<Device>> get(Identity id,
      {Duration? ttl = const Duration(seconds: 5)}) {
    return _cache.getOrFetch(
      'get:$id',
      () => ref.read(deviceRepositoryProvider).get(id),
      onResult: (data) {
        if (data.isPresent) {
          _controller.add(
            DeviceUpdated(data.value),
          );
        }
      },
      ttl: ttl,
    );
  }

  /// Set [Device] properties and store
  /// changes locally if successfully applied
  Future<Optional<Device>> update(Device device,
      {Duration? ttl = const Duration(seconds: 5)}) async {
    final id = Identity.of(device);
    return _cache.getOrFetch(
      'set:$id',
      () async {
        final service =
            ref.read(deviceDriverManagerProvider).getDriver(device.service);
        final success = await service.updateDevice(device);
        if (success) {
          _controller.add(
            DeviceUpdatePending(device),
          );
          await ref.read(deviceRepositoryProvider).updateAll([device]);
          // Update caches
          _cache.setIfExists<List<Device>>(
            'all',
            (all) => all
              ..removeWhere((e) => e.id == device.id)
              ..add(device),
          );
          _controller.add(
            DeviceUpdateCompleted(device),
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
      onResult: (devices) {
        _controller.addStream(Stream.fromIterable(devices.map(
          DeviceUpdated.new,
        )));
      },
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

abstract class DeviceEvent {
  DeviceEvent(this.device);
  final Device device;

  bool isDevice(Device device) =>
      Identity.of(device) == Identity.of(this.device);
}

class DeviceUpdated extends DeviceEvent {
  DeviceUpdated(super.device);
}

class DeviceUpdatePending extends DeviceEvent {
  DeviceUpdatePending(super.device);
}

class DeviceUpdateCompleted extends DeviceEvent {
  DeviceUpdateCompleted(super.device);
}
