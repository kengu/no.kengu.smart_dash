import 'package:smart_dash_integration/smart_dash_integration.dart';

class NySny {
  static const String key = 'nysny';

  static final Integration definition = Integration(
    key: key,
    type: IntegrationType.device,
    name: "NySny Web",
    image: "nysny.png",
    category: "Snow Depth Services",
    description: "Enter account information",
    fields: [
      IntegrationField.username,
      IntegrationField.password,
    ],
    dependsOn: [],
    instances: 1,
    system: false,
    enabled: true,
  );
}
