import 'package:smart_dash_integration/smart_dash_integration.dart';

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
}
