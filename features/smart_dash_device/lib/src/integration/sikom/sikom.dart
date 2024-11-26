import 'package:smart_dash_integration/smart_dash_integration.dart';

import 'domain/sikom_device.dart';

class Sikom {
  static const key = 'sikom';

  static const supportedTypes = [
    SikomDeviceType.controller,
    SikomDeviceType.astroSwitch,
    SikomDeviceType.thermostat,
    SikomDeviceType.detector,
    SikomDeviceType.ecoEnergyController,
    SikomDeviceType.onOffRelay,
    SikomDeviceType.group,
  ];

  static const readableModelName = {
    SikomDeviceType.controller: 'Central Control Unit',
    SikomDeviceType.astroSwitch: 'Astro Switch',
    SikomDeviceType.thermostat: 'Wireless Thermostat',
    SikomDeviceType.detector: 'Wireless Detector',
    SikomDeviceType.ecoEnergyController: 'Energy Controller',
    SikomDeviceType.onOffRelay: 'On / Off Relay',
    SikomDeviceType.group: 'Device Group',
  };

  static final Integration definition = Integration(
    key: key,
    type: IntegrationType.device,
    name: "Sikom Living API",
    image: "sikom.png",
    category: "Smart Home & IoT",
    description: "Enter account email and password",
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
