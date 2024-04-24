import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/device/application/device_driver.dart';
import 'package:smart_dash/feature/device/application/device_driver_manager.dart';
import 'package:smart_dash/feature/device/data/device_repository.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

part 'device_service.g.dart';

class DeviceService {
  static const String key = 'device';

  DeviceService(this.ref) {
    ref.onDispose(() {
      _deviceController.close();
      for (final e in _subscriptions) {
        e.cancel();
      }
    });
    final manager = ref.read(deviceDriverManagerProvider);
    _subscriptions.add(
      manager.events.listen(_handle, cancelOnError: false),
    );
  }

  final Ref ref;

  final _cache = FutureCache(prefix: '$DeviceService');

  final List<StreamSubscription> _subscriptions = [];

  // TODO Make delay configurable
  final Duration delay = const Duration(milliseconds: 50);

  final _deviceController = StreamController<DeviceEvent>.broadcast();

  final _driverController = StreamController<DriverEvent>.broadcast();

  void _handle(DriverEvent event) async {
    if (event is DriverDevicesEvent) {
      final stream = Stream.fromIterable(event.devices);
      // NOTE: We should not add events too fast to stream for
      // overall performance reasons. And StreamProviders only
      // sees last event when events are added more frequently
      // than 60 fps (less than 17 milliseconds between each event).
      await for (final device in stream.delayed(delay)) {
        // Process list of flow events in order of completion
        final emit = switch (event.runtimeType) {
          const (DevicesPairedEvent) => DevicePaired(device),
          const (DevicesUpdatedEvent) => DeviceUpdated(device),
          const (DevicesUnpairedEvent) => DeviceUnpaired(device),
          const (ThrottledDriverUpdatedEvent) => DeviceUpdated(device),
          Type() => throw UnimplementedError('Event $event not handled'),
        };
        _deviceController.add(emit);
      }
      _driverController.add(event);
    }
  }

  /// Get stream of device events
  Stream<DeviceEvent> get devices => _deviceController.stream.distinct();

  /// Get stream of device events
  Stream<DriverEvent> get drivers => _driverController.stream.distinct();

  /// Get [Device] with given [id] stored locally
  Future<Optional<Device>> get(Identity id,
      {Duration? ttl = const Duration(seconds: 5)}) {
    return _cache.getOrFetch(
      'get:$id',
      () => ref.read(deviceRepositoryProvider).get(id),
      onResult: (data) {
        if (data.isPresent) {
          _deviceController.add(
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
    final key = 'set:$id';
    return _cache.getOrFetch(
      key,
      () async {
        final service =
            ref.read(deviceDriverManagerProvider).getDriver(device.service);
        final success = await service.updateDevice(device);
        if (success) {
          _deviceController.add(
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
          _deviceController.add(
            DeviceUpdateCompleted(device),
          );
          return _cache.set(
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
    return _cache.get('get:$id');
  }

  /// Get all [Device]s stored locally
  Future<List<Device>> getAll({Duration? ttl = const Duration(seconds: 5)}) {
    return _cache.getOrFetch(
      'all',
      () => ref.read(deviceRepositoryProvider).getAll(),
      onResult: (devices) {
        for (final it in devices.map(DeviceUpdated.new)) {
          _deviceController.add(it);
        }
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

  Optional<List<Token>> getCachedTokens() {
    return _cache.get('tokens');
  }

  Future<List<Token>> getTokens([
    Duration? ttl = const Duration(seconds: 5),
  ]) async {
    return _cache.getOrFetch('tokens', () async {
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
DeviceService deviceService(DeviceServiceRef ref) => DeviceService(ref);

abstract class DeviceEvent {
  DeviceEvent(this.device);
  final Device device;

  bool isDevice(Device device) =>
      Identity.of(device) == Identity.of(this.device);
}

class DevicePaired extends DeviceEvent {
  DevicePaired(super.device);
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

class DeviceUnpaired extends DeviceEvent {
  DeviceUnpaired(super.device);
}
