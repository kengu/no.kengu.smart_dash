import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/account/domain/service_config.dart';
import 'package:smart_dash/feature/camera/application/camera_service.dart';
import 'package:smart_dash/feature/camera/data/camera_client.dart';
import 'package:smart_dash/integration/foscam/data/foscam_client.dart';
import 'package:smart_dash/integration/foscam/foscam.dart';

part 'foscam_service.g.dart';

class FoscamService extends CameraService {
  FoscamService(Ref ref) : super(ref: ref, key: Foscam.key);

  @override
  CameraClient newClient(ServiceConfig config) {
    return FoscamClient(
      host: config.host!,
      port: config.port!,
      credentials: FoscamCredentials(
        username: config.username!,
        password: config.password!,
      ),
    );
  }
}

@Riverpod(keepAlive: true)
FoscamService foscamService(FoscamServiceRef ref) => FoscamService(ref);
