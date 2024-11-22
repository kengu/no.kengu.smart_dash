import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash_camera/smart_dash_camera.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

abstract class CameraDriver extends Driver<CameraDriver> {
  CameraDriver({
    required super.ref,
    required super.key,
    required super.config,
  }) : super(type: IntegrationType.camera);

  static const ttl = Duration(hours: 1);
  static const max = Duration(hours: 24);
  static const Duration period = Duration(seconds: 3);

  @protected
  CameraClient newClient();

  Future<Optional<Camera>> getCamera() async {
    final client = newClient();
    try {
      final camera = await client.getCamera();
      if (camera.isPresent) {
        raise(
          CameraEvent.now(
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

  Future<Optional<CameraSnapshot>> getCameraSnapshot() async {
    final client = newClient();
    try {
      final snapshot = await client.getSnapshot();
      if (snapshot.isPresent) {
        raise(CameraSnapshotEvent.now(
          snapshot.value,
          name: config.name,
          service: config.key,
        ));
      }
      return snapshot;
    } finally {
      client.close();
    }
  }

  Future<Optional<MotionDetectConfig>> getCameraMotionConfig() async {
    return guard(() async {
      final client = newClient();
      try {
        return await client.getMotionConfig();
      } finally {
        client.close();
      }
    });
  }

  Future<Optional<MotionDetectConfig>> setCameraMotionConfig({
    bool? enabled,
    MotionDetectSensitivityLevel? sensitivity,
  }) async {
    // Ensure latest values are used (CGI commands replaces all values)
    return guard(() async {
      final result = await getCameraMotionConfig();
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
}

class CameraEvent extends DriverDataEvent<Camera> {
  CameraEvent(
    super.data, {
    required super.when,
    required super.last,
  }) : super(key: data.service);

  String get name => data.name;
  String get service => data.service;

  factory CameraEvent.now(Camera camera) {
    final when = DateTime.now();
    return CameraEvent(
      camera,
      when: when,
      last: when,
    );
  }
}

class CameraSnapshotEvent extends DriverDataEvent<CameraSnapshot> {
  CameraSnapshotEvent(
    super.data, {
    required this.name,
    required this.service,
    required this.snapshot,
    required super.when,
    required super.last,
  }) : super(key: service);

  final String name;
  final String service;

  factory CameraSnapshotEvent.now(
    CameraSnapshot snapshot, {
    required String name,
    required String service,
  }) {
    final when = DateTime.now();
    return CameraSnapshotEvent(
      snapshot,
      name: name,
      when: when,
      last: when,
      service: service,
      snapshot: snapshot,
    );
  }

  final CameraSnapshot snapshot;
}
