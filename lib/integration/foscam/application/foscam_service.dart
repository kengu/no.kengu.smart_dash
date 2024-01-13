import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/account/data/account_repository.dart';
import 'package:smart_dash/feature/account/domain/service_definition.dart';
import 'package:smart_dash/feature/camera/domain/camera.dart';
import 'package:smart_dash/feature/identity/data/user_repository.dart';
import 'package:smart_dash/integration/foscam/data/foscam_client.dart';
import 'package:smart_dash/integration/foscam/data/foscam_response.dart';
import 'package:smart_dash/util/guard.dart';

part 'foscam_service.g.dart';

@Riverpod(keepAlive: true)
class FoscamService extends _$FoscamService {
  @override
  Future<Optional<FoscamResponse>> build() =>
      Future.value(const Optional.empty());

  final Map<String, Future> _cache = {};

  Future<List<ServiceDefinition>> _getDevices() async {
    return guard(() async {
      final user = ref.read(userRepositoryProvider).currentUser;
      final account = await ref.read(accountRepositoryProvider).get(
            user.userId,
          );
      return account.value.all('foscam');
    });
  }

  Future<List<Camera>> getCameras() async {
    final cameras = <Camera>[];
    for (var device in await _getDevices()) {
      FoscamClient client = _newClient(device);
      final camera = await client.getCamera();
      if (camera.isPresent) cameras.add(camera.value);
      client.api.close();
    }
    return cameras;
  }

  FoscamClient _newClient(ServiceDefinition device) {
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
    // Check if a request is already opened
    final key = 'snapshot:${device.name}';
    final cached = _cache[key];
    if (cached != null) {
      return cached as Future<Optional<CameraSnapshot>>;
    }
    final devices = await _getDevices();
    final found = devices.firstWhereOptional((e) => e.device == device.name);
    if (found.isPresent) {
      FoscamClient client = _newClient(found.value);
      _cache[key] = client.getSnapshot();
      final snapshot = await _cache[key];
      client.api.close();
      _cache.remove(key);
      return snapshot;
    }
    return const Optional.empty();
  }
}

//FoscamService foscamService(FoscamServiceRef ref) => FoscamService(ref);
