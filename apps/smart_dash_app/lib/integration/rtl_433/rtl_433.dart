import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_dash_account/smart_dash_account.dart';
import 'package:smart_dash_device/smart_dash_device.dart';

import 'application/rtl_433_device_driver.dart';
import 'domain/rtl_433_device.dart';

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

  static DeviceDriverManager register(Ref ref) {
    return ref.read(deviceDriverManagerProvider)
      ..register(
        Rtl433.key,
        (config) => Rtl433DeviceDriver(ref, config),
      );
  }
}
