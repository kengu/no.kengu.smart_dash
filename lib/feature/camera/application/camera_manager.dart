import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/account/domain/service_config.dart';
import 'package:smart_dash/feature/camera/application/camera_service.dart';
import 'package:smart_dash/feature/camera/domain/camera.dart';
import 'package:smart_dash/integration/domain/integration.dart';
import 'package:stream_transform/stream_transform.dart';

part 'camera_manager.g.dart';

class CameraManager {
  CameraManager(this.ref);
  final Ref ref;
  final Map<String, CameraService> _services = {};

  final _log = Logger('$CameraManager');

  /// Check if [CameraService] for given [ServiceConfig.key] exists
  bool exists(String key) => _services.containsKey(key);

  /// [Camera] should call this to register
  void register(CameraService service) {
    assert(
      _services[service.key] == null,
      'Camera service integration [${service.key}] exists already',
    );

    _services[service.key] = service;
    _log.fine(
      '${service.runtimeType}[key:${service.key}] registered',
    );
  }

  Future<List<ServiceConfig>> init() {
    // Prefetch into caches
    return getConfigs();
  }

  /// Get [Camera] for given [IntegrationFields.key]
  T getService<T extends CameraService>(String key) {
    assert(
      exists(key),
      'CameraService $key not found. '
      'Have you remembered to register it with the CameraManager?',
    );
    return _services[key] as T;
  }

  Optional<List<ServiceConfig>> getCachedConfigs() {
    final configs = <ServiceConfig>[];
    for (final service in _services.values) {
      final cached = service.getCachedConfigs();
      if (cached.isPresent) {
        configs.addAll(cached.value);
      }
    }
    return Optional.of(configs);
  }

  Future<List<ServiceConfig>> getConfigs({Duration? ttl}) async {
    final configs = <ServiceConfig>[];
    for (final service in _services.values) {
      configs.addAll(await service.getConfigs(ttl: ttl));
    }
    return configs;
  }

  Future<Optional<Camera>> getCamera(ServiceConfig config,
      {Duration? ttl}) async {
    assert(config.device != null, 'ServiceConfig.device is null');
    return getService(config.key).getCamera(
      config.device!,
      ttl: ttl,
    );
  }

  Stream<Camera> getCameraAsStream(ServiceConfig config,
      {Duration period = CameraService.defaultPeriod}) async* {
    final stream = StreamGroup.merge(
      _services.values.map(
        (e) => e.events.whereType<CameraDataEvent>().throttle(period),
      ),
    );

    await for (final it in stream) {
      yield it.camera;
    }
  }

  Optional<List<Camera>> getCachedCameras() {
    final cameras = <Camera>[];
    for (final service in _services.values) {
      final cached = service.getCachedCameras();
      if (cached.isPresent) {
        cameras.addAll(cached.value);
      }
    }
    return Optional.of(cameras);
  }

  Future<List<Camera>> getCameras({Duration? ttl}) async {
    final cameras = <Camera>[];
    for (final service in _services.values) {
      cameras.addAll(await service.getCameras(ttl: ttl));
    }
    return cameras;
  }

  Future<Optional<CameraSnapshot>> getSnapshot(
    Camera device, {
    Duration? ttl,
  }) {
    return getService(device.service).getSnapshot(device, ttl: ttl);
  }

  Stream<CameraSnapshot> getSnapshotAsStream(Camera device,
      {Duration period = CameraService.defaultPeriod}) async* {
    final stream = StreamGroup.merge(
      _services.values.map(
        (e) => e.events.whereType<CameraSnapshotEvent>().throttle(period),
      ),
    );

    await for (final it in stream) {
      yield it.snapshot;
    }
  }

  Optional<CameraSnapshot> getCachedSnapshot(Camera device) {
    return getService(device.service).getCachedSnapshot(device);
  }

  Future<Optional<MotionDetectConfig>> getMotionConfig(Camera device) async {
    return getService(device.service).getMotionConfig(
      device.name,
    );
  }

  Future<Optional<MotionDetectConfig>> setMotionConfig(
    Camera device, {
    bool? enabled,
    MotionDetectSensitivityLevel? sensitivity,
  }) async {
    return getService(device.service).setMotionConfig(
      device.name,
      enabled: enabled,
      sensitivity: sensitivity,
    );
  }
}

@Riverpod(keepAlive: true)
CameraManager cameraManager(CameraManagerRef ref) => CameraManager(ref);
