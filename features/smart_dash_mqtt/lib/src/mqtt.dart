import 'package:riverpod/riverpod.dart';
import 'package:smart_dash_device/smart_dash_device.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

import 'application/mqtt_driver.dart';
import 'application/mqtt_driver_service.dart';
import 'integration/rtl_433/rtl_433.dart';

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

  static IntegrationType install(Ref ref, String baseUrl) {
    final service = MqttDriverService(ref);

    // Register mqtt service and integrations
    ref.read(integrationRegistryProvider(baseUrl)).install(
          IntegrationType.mqtt,
          () => service
            ..manager.install(
              Mqtt.definition,
              (config) => MqttDriver(ref, config),
            ),
        );

    // Register device drivers
    ref.read(deviceManagerProvider).install(
          Rtl433.definition,
          (config) => Rtl433DeviceDriver(ref, config),
        );

    return IntegrationType.mqtt;
  }
}
