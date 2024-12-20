import 'package:riverpod/riverpod.dart';
import 'package:smart_dash_camera/smart_dash_camera.dart';
import 'package:smart_dash_camera/src/integration/foscam/data/foscam_client.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

class FoscamDriver extends CameraDriver {
  FoscamDriver(
    Ref ref,
    ServiceConfig config,
  ) : super(ref: ref, config: config, key: Foscam.key);

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
