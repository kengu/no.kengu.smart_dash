import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional_internal.dart';
import 'package:smart_dash/feature/camera/data/camera_client.dart';
import 'package:smart_dash/feature/camera/domain/camera.dart';
import 'package:smart_dash/feature/system/application/timing_service.dart';
import 'package:smart_dash_account/smart_dash_account.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:stream_transform/stream_transform.dart';

abstract class CameraService {
  CameraService({required this.key, required this.ref}) {
    ref.onDispose(
      () => _controller.close(),
    );
  }

  static const Duration period = Duration(seconds: 3);

  final Ref ref;

  final String key;

  final _cache = FutureCache(prefix: '$CameraService');

  final StreamController<CameraEvent> _controller =
      StreamController.broadcast();

  Stream<CameraEvent> get events => _controller.stream;

  Optional<List<ServiceConfig>> getCachedConfigs() {
    return _cache.get<List<ServiceConfig>>('configs');
  }

  Future<List<ServiceConfig>> getConfigs({Duration? ttl}) async {
    return _cache.getOrFetch('configs', () async {
      final home = await ref.read(homeServiceProvider).getCurrentHome();
      if (!home.isPresent) return const [];
      return home.value.serviceWhere(key);
    }, ttl: ttl);
  }

  Optional<List<Camera>> getCachedCameras() {
    final cameras = <Camera>[];
    final cached = getCachedConfigs();
    if (cached.isPresent) {
      for (var service in cached.value) {
        final camera = getCachedCamera(service.device!);
        if (camera.isPresent) cameras.add(camera.value);
      }
    }
    return Optional.of(cameras);
  }

  Future<List<Camera>> getCameras({Duration? ttl}) async {
    return _cache.getOrFetch('cameras', () async {
      final cameras = <Camera>[];
      for (var service in await getConfigs()) {
        final camera = await getCamera(service.device!, ttl: ttl);
        if (camera.isPresent) cameras.add(camera.value);
      }
      return cameras;
    }, ttl: ttl);
  }

  Optional<Camera> getCachedCamera(String name) {
    return _cache.get<Camera>('camera:$name');
  }

  Future<Optional<Camera>> getCamera(String name, {Duration? ttl}) async {
    return _cache.getOrFetch('camera:$name', () async {
      final client = await _newClient(name);
      if (client.isPresent) {
        final camera = await client.value.getCamera();
        client.value.close();
        if (camera.isPresent) {
          _controller.add(
            CameraDataEvent(
              camera: camera.value,
            ),
          );
        }
        return camera;
      }
      return const Optional.empty();
    }, ttl: ttl);
  }

  Stream<Camera> getCameraAsStream(String name, {Duration period = period}) {
    return ref
        .read(timingServiceProvider)
        .events
        .throttle(period)
        .asyncMap((_) => getCamera(name, ttl: period))
        .where((e) => e.isPresent)
        .map((e) => e.value);
  }

  Optional<CameraSnapshot> getCachedSnapshot(Camera device) {
    return _cache.get<CameraSnapshot>('snapshot:${device.name}');
  }

  Future<Optional<CameraSnapshot>> getSnapshot(Camera device,
      {Duration? ttl}) async {
    return _cache.getOrFetch('snapshot:${device.name}', () async {
      final client = await _newClient(device.name);
      if (client.isPresent) {
        final snapshot = await client.value.getSnapshot();
        client.value.close();
        if (snapshot.isPresent) {
          _controller.add(
            CameraSnapshotEvent(
              name: device.name,
              service: device.service,
              snapshot: snapshot.value,
            ),
          );
        }
        return snapshot;
      }
      return const Optional.empty();
    }, ttl: ttl);
  }

  Stream<CameraSnapshot> getSnapshotAsStream(Camera device,
      {Duration period = period}) async* {
    final stream = ref
        .read(timingServiceProvider)
        .events
        .throttle(period)
        .asyncMap((_) => getSnapshot(device, ttl: period))
        .where((e) => e.isPresent)
        .map((e) => e.value);

    await for (final it in stream) {
      yield it;
    }
  }

  Future<Optional<MotionDetectConfig>> getMotionConfig(String name) async {
    // Ensure latest values are used (CGI commands replaces all values)
    return guard(() async {
      final client = await _newClient(name);
      if (client.isPresent) {
        final actual = await client.value.getMotionConfig();
        client.value.close();
        return actual;
      }
      return const Optional.empty();
    });
  }

  Future<Optional<MotionDetectConfig>> setMotionConfig(
    String name, {
    bool? enabled,
    MotionDetectSensitivityLevel? sensitivity,
  }) async {
    // Ensure latest values are used (CGI commands replaces all values)
    return guard(() async {
      final result = await getMotionConfig(name);
      if (!result.isPresent) return result;
      final now = result.value;
      final next = now.copyWith(
        enabled: enabled ?? now.enabled,
        sensitivity: sensitivity ?? now.sensitivity,
      );
      final client = await _newClient(name);
      try {
        if (client.isPresent) {
          final update = await client.value.setMotionConfig(name, next);
          if (update.isPresent) {
            final camera = _cache.get<Camera>('camera:$name');
            if (camera.isPresent) {
              _cache.set<Camera>(
                'camera:$name',
                Optional.of(camera.value.copyWith(motion: update.value)),
              );
            }
          }
          return update;
        }
        return const Optional.empty();
      } finally {
        client.value.close();
      }
    });
  }

  Future<Optional<CameraClient>> _newClient(String name) async {
    final cameras = await getConfigs();
    final found = cameras.firstWhereOptional((e) => e.device == name);
    if (!found.isPresent) const Optional.empty();
    final client = newClient(found.value);
    return Optional.of(client);
  }

  CameraClient newClient(ServiceConfig config);
}

class CameraEvent {
  CameraEvent({required this.name, required this.service});
  final String name;
  final String service;
}

class CameraDataEvent extends CameraEvent {
  CameraDataEvent({
    required this.camera,
  }) : super(name: camera.name, service: camera.service);
  final Camera camera;
}

class CameraSnapshotEvent extends CameraEvent {
  CameraSnapshotEvent({
    required super.name,
    required super.service,
    required this.snapshot,
    DateTime? when,
  }) : when = when ?? DateTime.now();

  final DateTime when;
  final CameraSnapshot snapshot;
}
