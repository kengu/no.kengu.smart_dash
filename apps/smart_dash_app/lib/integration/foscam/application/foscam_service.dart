import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_account/smart_dash_account.dart';
import 'package:smart_dash_app/feature/camera/application/camera_service.dart';
import 'package:smart_dash_app/feature/camera/data/camera_client.dart';
import 'package:smart_dash_app/integration/foscam/data/foscam_client.dart';
import 'package:smart_dash_app/integration/foscam/foscam.dart';

part 'foscam_service.g.dart';

class FoscamService extends CameraService {
  FoscamService(Ref ref) : super(ref: ref, key: Foscam.key);

  @override
  CameraClient newClient(ServiceConfig config) {
    return FoscamClient(
      host: config.host!,
      port: int.parse(config.port!),
      credentials: FoscamCredentials(
        username: config.username!,
        password: config.password!,
      ),
    );
  }
}

@Riverpod(keepAlive: true)
FoscamService foscamService(FoscamServiceRef ref) => FoscamService(ref);
