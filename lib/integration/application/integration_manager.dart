import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/camera/application/camera_manager.dart';
import 'package:smart_dash/feature/device/application/device_driver_manager.dart';
import 'package:smart_dash/feature/home/application/location_manager.dart';
import 'package:smart_dash/feature/snow/application/snow_manager.dart';
import 'package:smart_dash/feature/weather/application/weather_forecast_manager.dart';
import 'package:smart_dash/integration/foscam/application/foscam_service.dart';
import 'package:smart_dash/integration/metno/application/metno_forecast_driver.dart';
import 'package:smart_dash/integration/metno/application/metno_forecast_service.dart';
import 'package:smart_dash/integration/nysny/application/nysny_driver.dart';
import 'package:smart_dash/integration/nysny/application/nysny_service.dart';
import 'package:smart_dash/integration/osm/application/osm_location_service.dart';
import 'package:smart_dash/integration/rtl_433/application/rtl_433_driver.dart';
import 'package:smart_dash/integration/sikom/application/sikom_driver.dart';

part 'integration_manager.g.dart';

// TODO: Add system integrations to new homes automatically
class IntegrationManager {
  IntegrationManager(this.ref);
  final Ref ref;

  void init(ProviderContainer container) async {
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
}

@Riverpod(keepAlive: true)
IntegrationManager integrationManager(IntegrationManagerRef ref) =>
    IntegrationManager(ref);
