import 'package:smart_dash_integration/smart_dash_integration.dart';

class Mqtt {
  static const key = 'mqtt';

  static final Integration definition = Integration(
    key: Mqtt.key,
    type: IntegrationType.mqtt,
    name: "MQTT Client API",
    image: "mqtt.png",
    category: "Smart Home & IoT",
    description: "Enter MQTT client information",
    fields: [
      IntegrationField.host,
      IntegrationField.port,
      IntegrationField.username,
      IntegrationField.password,
      IntegrationField.topics,
    ],
    instances: 1,
    system: false,
    enabled: true,
    dependsOn: [],
  );
}
