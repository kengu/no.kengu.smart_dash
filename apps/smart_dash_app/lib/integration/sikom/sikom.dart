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
}
