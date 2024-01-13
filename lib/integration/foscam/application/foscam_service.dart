import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/account/data/account_repository.dart';
import 'package:smart_dash/feature/account/domain/service_config.dart';
import 'package:smart_dash/feature/camera/domain/camera.dart';
import 'package:smart_dash/feature/identity/data/user_repository.dart';
import 'package:smart_dash/integration/foscam/data/foscam_client.dart';
import 'package:smart_dash/integration/foscam/data/foscam_response.dart';
import 'package:smart_dash/util/future.dart';
import 'package:smart_dash/util/guard.dart';

part 'foscam_service.g.dart';

@Riverpod(keepAlive: true)
class FoscamService extends _$FoscamService {
  @override
  Future<Optional<FoscamResponse>> build() =>
      Future.value(const Optional.empty());

  final _cache = FutureCache(prefix: '$FoscamService');

  Future<List<ServiceConfig>> _getConfigs() async {
    return guard(() async {
      final user = ref.read(userRepositoryProvider).currentUser;
      final account = await ref.read(accountRepositoryProvider).get(
            user.userId,
          );
      return account.value.all('foscam');
    });
  }

  Future<List<Camera>> getCameras() async {
    return _cache.getOrFetch('cameras', () async {
      final cameras = <Camera>[];
      for (var device in await _getConfigs()) {
        FoscamClient client = _newClient(device);
        final camera = await client.getCamera();
        if (camera.isPresent) cameras.add(camera.value);
        client.api.close();
      }
      return cameras;
    });
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

  Future<Optional<CameraSnapshot>> getSnapshot(Camera device) async {
    return _cache.getOrFetch('snapshot:${device.name}', () async {
      final devices = await _getConfigs();
      final found = devices.firstWhereOptional((e) => e.device == device.name);
      if (found.isPresent) {
        FoscamClient client = _newClient(found.value);
        final snapshot = await client.getSnapshot();
        client.api.close();
        return snapshot;
      }
      return const Optional.empty();
    });
  }
}
