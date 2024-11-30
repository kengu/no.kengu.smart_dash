import 'package:smart_dash_integration/smart_dash_integration.dart';

import 'domain/rtl_433_device.dart';

export 'application/rtl_433_device_driver.dart';
export 'domain/rtl_433_device.dart';

class Rtl433 {
  static const String key = 'rtl_433';

  static const supportedTypes = [
    Rtl433DeviceType.sensor,
    Rtl433DeviceType.weatherStation,
  ];

  static const readableModelName = {
    Rtl433DeviceType.sensor: 'Sensor',
    Rtl433DeviceType.weatherStation: 'Weather Station',
  };

  static final Integration definition = Integration(
    key: Rtl433.key,
    type: IntegrationType.device,
    name: "RF Data Receiver (rtl_433)",
    image: "generic.png",
    category: "Smart Home & IoT",
    description: "Enables processing of RF data",
    fields: [],
    dependsOn: ["mqtt"],
    instances: 1,
    system: false,
    enabled: true,
  );
}
