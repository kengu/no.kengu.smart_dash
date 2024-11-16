import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_account/smart_dash_account_app.dart';
import 'package:smart_dash_app/feature/camera/application/camera_manager.dart';
import 'package:smart_dash_app/feature/device/application/device_driver_manager.dart';
import 'package:smart_dash_app/feature/snow/application/snow_manager.dart';
import 'package:smart_dash_app/feature/weather/application/weather_forecast_manager.dart';
import 'package:smart_dash_app/integration/foscam/application/foscam_service.dart';
import 'package:smart_dash_app/integration/metno/application/metno_forecast_driver.dart';
import 'package:smart_dash_app/integration/metno/application/metno_forecast_service.dart';
import 'package:smart_dash_app/integration/nysny/application/nysny_driver.dart';
import 'package:smart_dash_app/integration/nysny/application/nysny_service.dart';
import 'package:smart_dash_app/integration/osm/application/osm_location_service.dart';
import 'package:smart_dash_app/integration/rtl_433/application/rtl_433_driver.dart';
import 'package:smart_dash_app/integration/sikom/application/sikom_driver.dart';

part 'integration_manager.g.dart';

// TODO: Add system integrations to new homes automatically
class IntegrationManager {
  IntegrationManager(this.ref);
  final Ref ref;

  void init(ProviderContainer container) async {
    // Prepare integrations
    await ref.read(integrationRepositoryProvider.future);

    // Register camera service providers and init manager
    container.read(cameraManagerProvider)
      ..register(container.read(foscamServiceProvider))
      ..init(withStorage: true);

    // Register location service providers
    container.read(locationManagerProvider).register(
          container.read(osmLocationServiceProvider),
        );

    // Register weather service providers
    container.read(weatherForecastManagerProvider).register(
          container.read(metNoForecastServiceProvider),
        );

    // Register snow service providers
    container.read(snowManagerProvider).register(
          container.read(nySnyServiceProvider),
        );

    // Register device drivers and bind manager with dependencies
    final manager = container.read(deviceDriverManagerProvider);
    manager
      ..register(container.read(sikomDriverProvider))
      ..register(container.read(rtl433DriverProvider))
      ..register(container.read(metNoForecastDriverProvider))
      ..register(container.read(nySnyDriverProvider))
      ..bind();
  }

  Optional<Integration> get(String key) {
    return ref.read(integrationRepositoryProvider.notifier).get(key);
  }

  Optional<IntegrationMap> supports(Iterable<IntegrationType> types) {
    return ref.read(integrationRepositoryProvider.notifier).supports(types);
  }

  Optional<IntegrationMap> where(bool Function(Integration element) test) {
    return ref.read(integrationRepositoryProvider.notifier).where(test);
  }
}

@Riverpod(keepAlive: true)
IntegrationManager integrationManager(IntegrationManagerRef ref) =>
    IntegrationManager(ref);
