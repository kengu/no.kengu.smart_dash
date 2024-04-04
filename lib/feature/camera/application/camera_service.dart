import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional_internal.dart';
import 'package:smart_dash/feature/account/domain/service_config.dart';
import 'package:smart_dash/feature/camera/domain/camera.dart';
import 'package:smart_dash/feature/system/application/timing_service.dart';
import 'package:stream_transform/stream_transform.dart';

abstract class CameraService {
  CameraService({required this.key, required this.ref}) {
    ref.onDispose(
      () => _controller.close(),
    );
  }

  static const Duration defaultPeriod = Duration(seconds: 1);

  final Ref ref;

  final String key;

  final StreamController<CameraEvent> _controller =
      StreamController.broadcast();

  Stream<CameraEvent> get events => _controller.stream;

  Optional<List<ServiceConfig>> getCachedConfigs();

  Future<List<ServiceConfig>> getConfigs({Duration? ttl});

  Future<List<Camera>> getCameras({
    Duration? ttl,
  });

  Optional<List<Camera>> getCachedCameras();

  Future<Optional<Camera>> getCamera(
    String name, {
    Duration? ttl,
  });

  Stream<Camera> getCameraAsStream(String name,
      {Duration period = defaultPeriod}) async* {
    final stream = ref
        .read(timingServiceProvider)
        .events
        .throttle(period)
        .asyncMap((_) => getCamera(name, ttl: period))
        .where((e) => e.isPresent)
        .map((e) => e.value);

    await for (final it in stream) {
      _controller.add(
        CameraDataEvent(camera: it),
      );
      yield it;
    }
  }

  Optional<Camera> getCachedCamera(String name);

  Future<Optional<CameraSnapshot>> getSnapshot(
    Camera device, {
    Duration? ttl,
  });

  Stream<CameraSnapshot> getSnapshotAsStream(Camera device,
      {Duration period = defaultPeriod}) async* {
    final stream = ref
        .read(timingServiceProvider)
        .events
        .throttle(period)
        .asyncMap((_) => getSnapshot(device, ttl: period))
        .where((e) => e.isPresent)
        .map((e) => e.value);

    await for (final it in stream) {
      _controller.add(
        CameraSnapshotEvent(
          name: device.name,
          snapshot: it,
        ),
      );
      yield it;
    }
  }

  Optional<CameraSnapshot> getCachedSnapshot(Camera device);

  Future<Optional<MotionDetectConfig>> getMotionConfig(String name);

  Future<Optional<MotionDetectConfig>> setMotionConfig(
    String name, {
    bool? enabled,
    MotionDetectSensitivityLevel? sensitivity,
  });
}

class CameraEvent {
  CameraEvent({required this.name});
  final String name;
}

class CameraDataEvent extends CameraEvent {
  CameraDataEvent({required this.camera}) : super(name: camera.name);
  final Camera camera;
}

class CameraSnapshotEvent extends CameraEvent {
  CameraSnapshotEvent({required super.name, required this.snapshot});
  final CameraSnapshot snapshot;
}
