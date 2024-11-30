import 'package:media_kit/media_kit.dart';
import 'package:riverpod/riverpod.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

import 'application/camera_service.dart';
import 'integration/foscam/application/foscam_driver.dart';
import 'integration/foscam/foscam.dart';

class Cameras {
  static IntegrationType install(Ref ref) {
    MediaKit.ensureInitialized();

    final service = CameraService(ref);

    // Register Camera service and integrations
    ref.read(integrationManagerProvider).install(
          IntegrationType.camera,
          () => service
            ..manager.install(
              Foscam.definition,
              (config) => FoscamDriver(ref, config),
            ),
        );

    return IntegrationType.camera;
  }
}
