import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/account/data/account_repository.dart';
import 'package:smart_dash/feature/account/domain/service_config.dart';
import 'package:smart_dash/feature/camera/application/camera_service.dart';
import 'package:smart_dash/feature/camera/domain/camera.dart';
import 'package:smart_dash/feature/identity/data/user_repository.dart';
import 'package:smart_dash/integration/foscam/data/foscam_client.dart';
import 'package:smart_dash/util/future.dart';

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
  Future<List<ServiceConfig>> getConfigs(
      {Duration ttl = const Duration(seconds: 4)}) async {
    return _cache.getOrFetch('configs', () async {
      final user = ref.read(userRepositoryProvider).currentUser;
      final account = await ref.read(accountRepositoryProvider).get(
            user.userId,
          );
      return account.value.all('foscam');
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
  Future<List<Camera>> getCameras(
      {Duration ttl = const Duration(seconds: 4)}) async {
    return _cache.getOrFetch('cameras', () async {
      final cameras = <Camera>[];
      for (var service in await getConfigs()) {
        final camera = await getCamera(service.device!, ttl: ttl);
        if (camera.isPresent) cameras.add(camera.value);
      }
      return cameras;
    });
  }

  @override
  Future<Optional<Camera>> getCamera(String name,
      {Duration ttl = const Duration(seconds: 4)}) async {
    return _cache.getOrFetch('camera:$name', () async {
      final devices = await getConfigs();
      final found = devices.firstWhereOptional((e) => e.device == name);
      if (found.isPresent) {
        FoscamClient client = _newClient(found.value);
        final camera = await client.getCamera();
        client.api.close();
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
      {Duration ttl = const Duration(seconds: 4)}) async {
    return _cache.getOrFetch('snapshot:${device.name}', () async {
      final devices = await getConfigs();
      final found = devices.firstWhereOptional((e) => e.device == device.name);
      if (found.isPresent) {
        FoscamClient client = _newClient(found.value);
        final snapshot = await client.getSnapshot();
        client.api.close();
        return snapshot;
      }
      return const Optional.empty();
    }, ttl: ttl);
  }

  @override
  Optional<CameraSnapshot> getCachedSnapshot(Camera device) {
    return _cache.get<CameraSnapshot>('snapshot:${device.name}');
  }

  FoscamClient _newClient(ServiceConfig device) {
    final client = FoscamClient(
      host: device.host!,
      port: device.port!,
      creds: FoscamCredentials(
        username: device.username,
        password: device.password,
      ),
    );
    return client;
  }
}

@Riverpod(keepAlive: true)
FoscamService foscamService(FoscamServiceRef ref) => FoscamService(ref);
