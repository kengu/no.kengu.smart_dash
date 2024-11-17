import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_dash_account/smart_dash_account.dart';
import 'package:smart_dash_app/feature/camera/application/camera_driver.dart';
import 'package:smart_dash_app/feature/camera/data/camera_client.dart';
import 'package:smart_dash_app/integration/foscam/data/foscam_client.dart';
import 'package:smart_dash_app/integration/foscam/foscam.dart';

class FoscamService extends CameraDriver {
  FoscamService(
    Ref ref,
    ServiceConfig config,
  ) : super(
          ref: ref,
          config: config,
          key: Foscam.key,
        );

  @override
  CameraClient newClient() {
    return FoscamClient(
      config: config,
      credentials: FoscamCredentials(
        username: config.username!,
        password: config.password!,
      ),
    );
  }
}
