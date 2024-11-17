import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_dash_account/smart_dash_account.dart';
import 'package:smart_dash_app/feature/camera/application/camera_manager.dart';

import 'application/foscam_service.dart';

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

  static CameraManager register(
    Ref ref,
    Integration config,
  ) {
    return ref.read(cameraManagerProvider)
      ..register(
        Foscam.key,
        (config) => FoscamService(ref, config),
      );
  }
}
