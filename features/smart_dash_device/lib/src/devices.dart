import 'package:riverpod/riverpod.dart';
import 'package:smart_dash_device/smart_dash_device.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

import 'integration/sikom/application/sikom_driver.dart';

class Devices {
  static IntegrationType install(Ref ref, String baseUrl) {
    final service = DeviceDriverService(ref);

    // Register Device service and integrations
    ref.read(integrationRegistryProvider(baseUrl)).install(
          IntegrationType.device,
          () => service
            ..manager.install(
              Sikom.definition,
              (config) => SikomDriver(ref, config),
            ),
        );

    return IntegrationType.device;
  }
}
