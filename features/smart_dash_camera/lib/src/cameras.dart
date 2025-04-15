import 'package:riverpod/riverpod.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

import 'application/camera_driver_service.dart';
import 'integration/foscam/application/foscam_driver.dart';
import 'integration/foscam/foscam.dart';

class Cameras {
  static IntegrationType install(Ref ref, String baseUrl) {
    final service = CameraDriverService(ref);

    // Register Camera service and integrations
    ref.read(integrationRegistryProvider(baseUrl)).install(
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
