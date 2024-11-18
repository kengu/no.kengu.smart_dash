import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_dash_app/feature/device/application/device_driver_manager.dart';
import 'package:smart_dash_app/feature/device/domain/device.dart';
import 'package:smart_dash_app/integration/nysny/application/nysny_device_driver.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';
import 'package:smart_dash_snow/smart_dash_snow.dart';

import 'application/nysny_snow_driver.dart';

class NySny {
  static const String key = 'nysny';

  static const supportedTypes = [
    DeviceType.sensor,
  ];

  static const readableModelName = {
    DeviceType.sensor: 'Snow Sensor',
  };

  static final Integration definition = Integration(
      key: "nysny",
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
      enabled: true);

  static SnowManager register(
    Ref ref,
    Integration config,
  ) {
    ref
        .read(deviceDriverManagerProvider)
        .register(ref.read(nySnyDeviceDriverProvider));

    return ref.read(snowManagerProvider)
      ..register(
        NySny.key,
        (config) => NySnySnowDriver(ref, config),
      );
  }
}
