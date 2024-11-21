import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash_camera/smart_dash_camera.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';
import 'package:stream_transform/stream_transform.dart';

abstract class CameraDriver extends Driver<CameraDriver> {
  CameraDriver({
    required super.ref,
    required super.key,
    required super.last,
    required super.config,
  }) : super(type: IntegrationType.camera);

  static const Duration period = Duration(seconds: 3);

  @protected
  CameraClient newClient();

  Future<Optional<Camera>> getCamera() async {
    final client = newClient();
    try {
      final camera = await client.getCamera();
      if (camera.isPresent) {
        raise(
          CameraDataEvent.now(
            camera.value,
          ),
        );
        return camera;
      }
      return const Optional.empty();
    } finally {
      client.close();
    }
  }

  Stream<Camera> getCameraAsStream({Duration period = period}) async* {
    final stream = ref
        .read(timingServiceProvider)
        .events
        .throttle(period)
        .asyncMap((_) => getCamera())
        .where((e) => e.isPresent)
        .map((e) => e.value);

    // For easier debugging
    await for (final it in stream) {
      yield it;
    }
  }

  Future<Optional<CameraSnapshot>> getSnapshot() async {
    final client = newClient();
    try {
      final snapshot = await client.getSnapshot();
      if (snapshot.isPresent) {
        raise(
          _asSnapshotEvent(snapshot),
        );
      }
      return snapshot;
    } finally {
      client.close();
    }
  }

  Stream<CameraSnapshotEvent> getSnapshotAsStream({
    Duration period = period,
  }) async* {
    final stream = ref
        .read(timingServiceProvider)
        .events
        .throttle(period)
        .asyncMap((_) => getSnapshot())
        .where((e) => e.isPresent)
        .map(_asSnapshotEvent);

    // For easier debugging
    await for (final it in stream) {
      yield it;
    }
  }

  Future<Optional<MotionDetectConfig>> getMotionConfig() async {
    return guard(() async {
      final client = newClient();
      try {
        return await client.getMotionConfig();
      } finally {
        client.close();
      }
    });
  }

  Future<Optional<MotionDetectConfig>> setMotionConfig({
    bool? enabled,
    MotionDetectSensitivityLevel? sensitivity,
  }) async {
    // Ensure latest values are used (CGI commands replaces all values)
    return guard(() async {
      final result = await getMotionConfig();
      if (!result.isPresent) return result;
      final now = result.value;
      final next = now.copyWith(
        enabled: enabled ?? now.enabled,
        sensitivity: sensitivity ?? now.sensitivity,
      );
      final client = newClient();
      try {
        return await client.setMotionConfig(next);
      } finally {
        client.close();
      }
    });
  }

  CameraSnapshotEvent _asSnapshotEvent(Optional<CameraSnapshot> snapshot) {
    return CameraSnapshotEvent.now(
      name: config.name,
      service: config.key,
      snapshot: snapshot.value,
    );
  }
}

class CameraEvent extends DriverEvent {
  CameraEvent({
    required this.name,
    required this.service,
    required super.when,
    required super.last,
  }) : super(key: service);

  factory CameraEvent.now({required String name, required String service}) {
    final when = DateTime.now();
    return CameraEvent(
      name: name,
      service: service,
      when: when,
      last: when,
    );
  }

  final String name;
  final String service;
}

class CameraDataEvent extends CameraEvent {
  CameraDataEvent({
    required this.camera,
    required super.when,
    required super.last,
  }) : super(name: camera.name, service: camera.service);

  factory CameraDataEvent.now(Camera camera) {
    final when = DateTime.now();
    return CameraDataEvent(
      camera: camera,
      when: when,
      last: when,
    );
  }

  final Camera camera;
}

class CameraSnapshotEvent extends CameraEvent {
  CameraSnapshotEvent({
    required super.name,
    required super.service,
    required this.snapshot,
    required super.when,
    required super.last,
  });

  factory CameraSnapshotEvent.now(
      {required String name,
      required String service,
      required CameraSnapshot snapshot}) {
    final when = DateTime.now();
    return CameraSnapshotEvent(
      name: name,
      when: when,
      last: when,
      service: service,
      snapshot: snapshot,
    );
  }

  final CameraSnapshot snapshot;
}
