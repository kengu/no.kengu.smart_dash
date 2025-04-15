import 'dart:async';

import 'package:optional/optional.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_camera/smart_dash_camera.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';
import 'package:stream_transform/stream_transform.dart';

part 'camera_driver_service.g.dart';

/// A [DriverService] for [Camera] lookup from [CameraDriver]s
/// that implements [IntegrationType.camera] integrations.
class CameraDriverService
    extends DriverService<Camera, CameraEvent, CameraDriver, CameraManager> {
  CameraDriverService(Ref ref)
      : super(
          ref,
          IntegrationType.camera,
          FutureCache(prefix: '$CameraDriverService'),
        );

  static const Duration ttl = CameraDriver.ttl;
  static const Duration max = CameraDriver.max;
  static const Duration period = CameraDriver.period;

  @override
  CameraManager get manager => ref.read(cameraManagerProvider);

  /// Check if [CameraSnapshot] storage is enabled
  bool get isStorageEnabled => manager.isStorageEnabled;

  /// Enable [CameraSnapshot] storage
  bool enableStorage([Duration period = period]) {
    return manager.enableStorage(period);
  }

  /// Disable [CameraSnapshot] storage
  bool disableStorage() {
    return manager.disableStorage();
  }

  /// Find [ServiceConfig] for given [camera]
  Optional<ServiceConfig> find(Camera device) {
    return manager.firstConfig(device.service, device.name);
  }

  /// Get [Camera] for given [ServiceConfig]
  Future<Optional<Camera>> getCamera(
    ServiceConfig config, {
    Duration? ttl,
  }) async {
    return cache.getOrFetch(
      _cacheKey('camera', config),
      () {
        return manager.get(config).getCamera();
      },
      ttl: ttl,
    );
  }

  /// Get [Camera] for given [ServiceConfig] from [cache]
  Optional<Camera> getCameraCached(ServiceConfig config) {
    return cache.get(_cacheKey('camera', config));
  }

  /// Get stream of [Camera]s for given [config]
  /// periodically pulled from [getCamera]
  Stream<Camera> getCameraAsStream(
    ServiceConfig config, {
    bool refresh = false,
    Duration period = period,
  }) async* {
    if (refresh) {
      final camera = await getCamera(config);
      if (camera.isNotEmpty) {
        yield camera.value;
      }
    }

    yield* ref
        .read(timingServiceProvider)
        .events
        .throttle(period.clamp(ttl, max))
        .asyncMap((e) => getCamera(config))
        .where((e) => e.isPresent)
        .map((e) => e.value);
  }

  /// Get all [Camera]s
  Future<List<Camera>> getCameras({Duration? ttl}) async {
    final cameras = <Camera>[];
    for (final driver in manager.drivers) {
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

  /// Get all [Camera]s from [cache]
  Optional<List<Camera>> getCamerasCached() {
    final cameras = <Camera>[];
    for (final driver in manager.drivers) {
      final camera = cache.get(
        _cacheKey('camera', driver.config),
      );
      if (camera.isPresent) {
        cameras.add(camera.value);
      }
    }
    return Optional.of(cameras);
  }

  /// Get a stream of all [Camera]s periodically pulled from [getCameras].
  Stream<List<Camera>> getCamerasAsStream({
    bool refresh = false,
    Duration period = period,
  }) async* {
    if (refresh) {
      final cameras = await getCameras();
      if (cameras.isNotEmpty) {
        yield cameras;
      }
    }

    yield* ref
        .read(timingServiceProvider)
        .events
        .throttle(period.clamp(ttl, max))
        .asyncMap((e) => getCameras())
        .where((e) => e.isNotEmpty);
  }

  /// Get [CameraSnapshot] for given [camera]
  Future<Optional<CameraSnapshot>> getCameraSnapshot(
    Camera camera, {
    Duration? ttl,
  }) async {
    final found = find(camera);
    if (!found.isPresent) {
      return Optional.empty();
    }
    return _getSnapshot(found.value, ttl);
  }

  /// Get [CameraSnapshot] for given [camera] from [cache]
  Optional<CameraSnapshot> getCameraSnapshotCached(Camera camera) {
    final found = find(camera);

    if (!found.isPresent) {
      return Optional.empty();
    }

    return cache.get<CameraSnapshot>(
      _cacheKey('snapshot', found.value),
    );
  }

  /// Get a stream of [CameraSnapshot]s for given [camera]
  /// periodically pulled from [getCamera].
  Stream<CameraSnapshotEvent> getCameraSnapshotAsStream(
    Camera camera, {
    bool refresh = false,
    Duration period = period,
  }) async* {
    if (refresh) {
      final result = await getCameraSnapshot(camera);
      if (result.isNotEmpty) {
        yield CameraSnapshotEvent.now(
          result.value,
          name: camera.name,
          service: camera.service,
        );
      }
    }

    yield* ref
        .read(timingServiceProvider)
        .events
        .throttle(period.clamp(ttl, max))
        .asyncMap((e) => getCameraSnapshot(camera))
        .where((e) => e.isNotEmpty)
        .map((e) => CameraSnapshotEvent.now(
              e.value,
              name: camera.name,
              service: camera.service,
            ));
  }

  /// Get all [CameraSnapshot]s.
  Future<List<CameraSnapshot>> getCameraSnapshots({Duration? ttl}) async {
    final snapshots = <CameraSnapshot>[];
    for (final config in manager.configs) {
      final snapshot = await _getSnapshot(config, ttl);
      if (snapshot.isPresent) {
        snapshots.add(snapshot.value);
      }
    }
    return snapshots;
  }

  /// Get all [CameraSnapshot] from [cache]
  List<CameraSnapshot> getCameraSnapshotsCached() {
    final snapshots = <CameraSnapshot>[];
    for (final config in manager.configs) {
      final snapshot = cache.get(_cacheKey('snapshot', config));
      if (snapshot.isPresent) {
        snapshots.add(snapshot.value);
      }
    }
    return snapshots;
  }

  /// Get a stream of all [CameraSnapshot]s periodically
  /// pulled from [getCameraSnapshots].
  Stream<List<CameraSnapshotEvent>> getCameraSnapshotsAsStream({
    bool refresh = false,
    Duration period = period,
  }) async* {
    if (refresh) {
      final snapshots = await _getSnapshotsAsEvents();
      yield snapshots;
    }

    yield* ref
        .read(timingServiceProvider)
        .events
        .throttle(period.clamp(ttl, max))
        .asyncMap((_) => _getSnapshotsAsEvents());
  }

  Future<Optional<MotionDetectConfig>> getCameraMotionConfig(
      Camera device) async {
    final found = find(device);

    if (!found.isPresent) {
      return Optional.empty();
    }
    final driver = manager.get(found.value);

    return driver.getCameraMotionConfig();
  }

  Future<Optional<MotionDetectConfig>> setCameraMotionConfig(
    Camera device, {
    bool? enabled,
    MotionDetectSensitivityLevel? sensitivity,
  }) async {
    final found = find(device);

    if (!found.isPresent) {
      return Optional.empty();
    }
    final config = found.value;
    final driver = manager.get(config);

    final update = await driver.setCameraMotionConfig(
      enabled: enabled,
      sensitivity: sensitivity,
    );

    if (update.isPresent) {
      final key = _cacheKey('camera', config);
      final camera = cache.get<Camera>(key);
      if (camera.isPresent) {
        cache.set<Camera>(
          key,
          Optional.of(camera.value.copyWith(
            motion: update.value,
          )),
        );
      }
    }
    return update;
  }

  String _cacheKey(String prefix, ServiceConfig config) {
    return '$prefix:${config.key}:${config.id}';
  }

  Future<Optional<CameraSnapshot>> _getSnapshot(
    ServiceConfig config,
    Duration? ttl,
  ) async {
    return cache.getOrFetch(
      _cacheKey('snapshot', config),
      () {
        return manager.get(config).getCameraSnapshot();
      },
      ttl: ttl,
    );
  }

  Future<List<CameraSnapshotEvent>> _getSnapshotsAsEvents() async {
    final snapshots = <CameraSnapshotEvent>[];
    for (final config in manager.configs) {
      final snapshot = await _getSnapshot(config, ttl);
      if (snapshot.isPresent) {
        snapshots.add(CameraSnapshotEvent.now(
          snapshot.value,
          name: config.name,
          service: config.key,
        ));
      }
    }
    return snapshots;
  }
}

@Riverpod(keepAlive: true)
CameraDriverService cameraService(CameraServiceRef ref) {
  return CameraDriverService(ref);
}
