import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/account/domain/service_config.dart';
import 'package:smart_dash/feature/camera/application/camera_service.dart';
import 'package:smart_dash/feature/camera/domain/camera.dart';
import 'package:smart_dash/feature/home/application/home_service.dart';
import 'package:smart_dash/integration/foscam/data/foscam_client.dart';
import 'package:smart_dash/util/future.dart';
import 'package:smart_dash/util/guard.dart';

part 'foscam_service.g.dart';

class FoscamService implements CameraService {
  FoscamService(this.ref);

  @override
  final String key = 'foscam';

  final Ref ref;

  final _cache = FutureCache(prefix: '$FoscamService');

  @override
  Optional<List<ServiceConfig>> getCachedConfigs() {
    return _cache.get<List<ServiceConfig>>('configs');
  }

  @override
  Future<List<ServiceConfig>> getConfigs({Duration? ttl}) async {
    return _cache.getOrFetch('configs', () async {
      final home = await ref.read(homeServiceProvider).getCurrentHome();
      if (!home.isPresent) return const [];
      return home.value.serviceWhere(key);
    }, ttl: ttl);
  }

  @override
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

  @override
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

  @override
  Future<Optional<Camera>> getCamera(String name, {Duration? ttl}) async {
    return _cache.getOrFetch('camera:$name', () async {
      final client = await _newClient(name);
      if (client.isPresent) {
        final camera = await client.value.getCamera();
        client.value.close();
        return camera;
      }
      return const Optional.empty();
    }, ttl: ttl);
  }

  @override
  Optional<Camera> getCachedCamera(String name) {
    return _cache.get<Camera>('camera:$name');
  }

  @override
  Future<Optional<CameraSnapshot>> getSnapshot(Camera device,
      {Duration? ttl}) async {
    return _cache.getOrFetch('snapshot:${device.name}', () async {
      final client = await _newClient(device.name);
      if (client.isPresent) {
        final snapshot = await client.value.getSnapshot();
        client.value.close();
        return snapshot;
      }
      return const Optional.empty();
    }, ttl: ttl);
  }

  @override
  Optional<CameraSnapshot> getCachedSnapshot(Camera device) {
    return _cache.get<CameraSnapshot>('snapshot:${device.name}');
  }

  @override
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

  @override
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
    });
  }

  Future<Optional<FoscamClient>> _newClient(String name) async {
    final devices = await getConfigs();
    final found = devices.firstWhereOptional((e) => e.device == name);
    if (found.isPresent) {
      final device = found.value;
      final client = FoscamClient(
        host: device.host!,
        port: device.port!,
        credentials: FoscamCredentials(
          username: device.username,
          password: device.password,
        ),
      );
      return Optional.of(client);
    }
    return const Optional.empty();
  }
}

@Riverpod(keepAlive: true)
FoscamService foscamService(FoscamServiceRef ref) => FoscamService(ref);
