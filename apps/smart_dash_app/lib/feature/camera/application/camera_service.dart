import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_account/smart_dash_account.dart';
import 'package:smart_dash_account/smart_dash_account_app.dart';
import 'package:smart_dash_app/feature/camera/application/camera_driver.dart';
import 'package:smart_dash_app/feature/camera/application/camera_manager.dart';
import 'package:smart_dash_app/feature/camera/domain/camera.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:stream_transform/stream_transform.dart';

part 'camera_service.g.dart';

class CameraService {
  CameraService(this.ref);

  final Ref ref;

  CameraManager get _manager => ref.read(cameraManagerProvider);

  final _cache = FutureCache(prefix: '$CameraService');
  String _cacheKey(String prefix, ServiceConfig config) {
    return '$prefix:${config.key}:${config.id}';
  }

  List<ServiceConfig> get configs => _manager.configs;

  bool get isStorageEnabled => _manager.isStorageEnabled;

  bool enableStorage([Duration period = CameraDriver.period]) {
    return _manager.enableStorage(period);
  }

  bool disableStorage() {
    return _manager.disableStorage();
  }

  Future<Optional<Camera>> getCamera(
    ServiceConfig config, {
    Duration? ttl,
  }) async {
    return _cache.getOrFetch(
      _cacheKey('camera', config),
      () {
        return _manager.get(config).getCamera();
      },
      ttl: ttl,
    );
  }

  Stream<Camera> getCameraAsStream(
    ServiceConfig config, {
    Duration period = CameraDriver.period,
  }) async* {
    final result = await getCamera(config);
    if (!result.isPresent) return;
    final camera = result.value;
    final stream = StreamGroup.merge(
      _manager.drivers.map(
        (e) => e.events
            .whereType<CameraDataEvent>()
            .where((e) => e.service == camera.service && e.name == camera.name)
            .throttle(period),
      ),
    );

    await for (final it in stream) {
      yield it.camera;
    }
  }

  Optional<List<Camera>> getCachedCameras() {
    final cameras = <Camera>[];
    for (final driver in _manager.drivers) {
      final camera = _cache.get(
        _cacheKey('camera', driver.config),
      );
      if (camera.isPresent) {
        cameras.add(camera.value);
      }
    }
    return Optional.of(cameras);
  }

  Future<List<Camera>> getCameras({Duration? ttl}) async {
    final cameras = <Camera>[];
    for (final driver in _manager.drivers) {
      final camera = await getCamera(
        driver.config,
        ttl: ttl,
      );
      if (camera.isPresent) {
        cameras.add(camera.value);
      }
    }
    return cameras;
  }

  Stream<Camera> getCamerasAsStream({
    Duration period = CameraDriver.period,
  }) async* {
    final stream = StreamGroup.merge(
      _manager.drivers.map(
        (e) => e.getCameraAsStream(period: period).throttle(period),
      ),
    );

    await for (final camera in stream) {
      yield camera;
    }
  }

  Stream<CameraSnapshotEvent> getSnapshotsAsStream({
    Duration period = CameraDriver.period,
  }) {
    return StreamGroup.merge(
      _manager.drivers.map(
        (e) => e.getSnapshotAsStream(period: period),
      ),
    );
  }

  Future<Optional<CameraSnapshot>> getSnapshot(
    Camera device, {
    Duration? ttl,
  }) async {
    final found = find(device);

    if (!found.isPresent) {
      return Optional.empty();
    }

    return _cache.getOrFetch(
      _cacheKey('snapshot', found.value),
      () {
        return _manager.get(found.value).getSnapshot();
      },
      ttl: ttl,
    );
  }

  Optional<CameraSnapshot> getCachedSnapshot(Camera device) {
    final found = find(device);

    if (!found.isPresent) {
      return Optional.empty();
    }

    return _cache.get<CameraSnapshot>(
      _cacheKey('snapshot', found.value),
    );
  }

  Optional<ServiceConfig> find(Camera device) {
    return _manager.find(device);
  }

  Stream<CameraSnapshotEvent> getSnapshotAsStream(
    Camera device, {
    Duration period = CameraDriver.period,
  }) {
    final stream = StreamGroup.merge(
      _manager.drivers.map(
        (e) => e.getSnapshotAsStream(period: period),
      ),
    );

    return stream;
  }

  Future<Optional<MotionDetectConfig>> getMotionConfig(Camera device) async {
    final found = find(device);

    if (!found.isPresent) {
      return Optional.empty();
    }
    final driver = _manager.get(found.value);

    return driver.getMotionConfig();
  }

  Future<Optional<MotionDetectConfig>> setMotionConfig(
    Camera device, {
    bool? enabled,
    MotionDetectSensitivityLevel? sensitivity,
  }) async {
    final found = find(device);

    if (!found.isPresent) {
      return Optional.empty();
    }
    final config = found.value;
    final driver = _manager.get(config);

    final update = await driver.setMotionConfig(
      enabled: enabled,
      sensitivity: sensitivity,
    );

    if (update.isPresent) {
      final key = _cacheKey('camera', config);
      final camera = _cache.get<Camera>(key);
      if (camera.isPresent) {
        _cache.set<Camera>(
          key,
          Optional.of(camera.value.copyWith(
            motion: update.value,
          )),
        );
      }
    }
    return update;
  }
}

@Riverpod(keepAlive: true)
CameraService cameraService(CameraServiceRef ref) => CameraService(ref);
