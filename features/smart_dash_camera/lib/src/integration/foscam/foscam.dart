import 'package:riverpod/riverpod.dart';
import 'package:smart_dash_camera/smart_dash_camera.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

import 'application/foscam_driver.dart';

class Foscam {
  static const key = 'foscam';

  static final Integration definition = Integration(
    key: key,
    type: IntegrationType.camera,
    name: "Foscam CGI API",
    image: "foscam.png",
    category: "Security Cameras",
    description: "Enter camera information",
    fields: [
      IntegrationField.id,
      IntegrationField.host,
      IntegrationField.port,
      IntegrationField.username,
      IntegrationField.password,
    ],
    dependsOn: [],
    instances: 4,
    system: false,
    enabled: true,
  );

  static CameraManager register(Ref ref) {
    return ref.read(cameraManagerProvider)
      ..register(
        Foscam.key,
        (config) => FoscamDriver(ref, config),
      );
  }
}