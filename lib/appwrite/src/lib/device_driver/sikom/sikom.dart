class Sikom {
  static const key = 'sikom';

  static const supportedTypes = [
    'Controller',
    'ECOAstroSwitch',
    'WirelessThermostat',
    'WirelessDetector',
    'ECOEnergyController',
    'EGR',
    'Group',
    'EaseeHome'
  ];

  static const readableModelName = {
    'Controller': 'Central Control Unit',
    'ECOAstroSwitch': 'Astro Switch',
    'WirelessThermostat': 'Wireless Thermostat',
    'WirelessDetector': 'Wireless Detector',
    'ECOEnergyController': 'Energy Controller',
    'EGR': 'Echo Relay',
    'Group': 'Device Group',
    'EaseeHome': 'Easee Home',
  };
}
