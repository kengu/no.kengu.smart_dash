import 'package:riverpod/riverpod.dart';
import 'package:smart_dash_device/smart_dash_device.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';
import 'package:smart_dash_snow/smart_dash_snow.dart';

import 'integration/nysny/application/nysny_driver.dart';

class Snow {
  static const supportedTypes = [
    DeviceType.sensor,
  ];

  static const readableModelName = {
    DeviceType.sensor: 'Snow Sensor',
  };

  static IntegrationType install(Ref ref, String baseUrl) {
    final service = SnowDriverService(ref);

    // Register weather service and integrations
    ref.read(integrationRegistryProvider(baseUrl)).install(
          IntegrationType.snow,
          () => service
            ..manager.install(
              NySny.definition,
              (config) => NySnyDriver(ref, config),
            ),
        );

    // Register weather device driver for each integration
    ref.read(deviceManagerProvider).install(
          NySny.definition,
          (config) => SnowDeviceDriver(
            key: NySny.key,
            ref: ref,
            config: config,
          ),
        );

    return IntegrationType.snow;
  }
}
