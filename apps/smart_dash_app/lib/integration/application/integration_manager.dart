import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_account/smart_dash_account_app.dart';
import 'package:smart_dash_app/feature/device/application/device_driver_manager.dart';
import 'package:smart_dash_app/feature/weather/application/weather_forecast_manager.dart';
import 'package:smart_dash_app/integration/metno/application/metno_forecast_driver.dart';
import 'package:smart_dash_app/integration/metno/application/metno_forecast_service.dart';
import 'package:smart_dash_app/integration/osm/application/osm_location_service.dart';
import 'package:smart_dash_app/integration/rtl_433/application/rtl_433_driver.dart';
import 'package:smart_dash_app/integration/sikom/application/sikom_driver.dart';

part 'integration_manager.g.dart';

typedef IntegrationBuilder = DriverManager Function(
  Ref ref,
  Integration config,
);

// TODO: Add system integrations to new homes automatically
class IntegrationManager {
  IntegrationManager(this.ref);

  final Ref ref;
  final Map<String, Integration> _integrations = {};
  final Map<Integration, DriverManager> _managers = {};
  final Map<Integration, IntegrationBuilder> _builders = {};

  void register(Integration definition, IntegrationBuilder builder) {
    assert(
      !_builders.keys.any((e) => e.key == definition.key),
      '$IntegrationManager: '
      '$Integration [${definition.key}] already registered',
    );
    _builders[definition] = builder;
  }

  /// Build integrations from definitions
  Future<void> build(ProviderContainer container) async {
    // TODO: Remove integration repository (not needed)
    final definitions = await ref.read(integrationRepositoryProvider.future);
    for (final definition in definitions.values) {
      _integrations[definition.key] = definition;
    }

    final home = await ref.read(accountServiceProvider).getCurrentHome();
    assert(home.isPresent, 'TODO: Handle no home better!');

    // Build integrations
    for (final definition in _builders.keys) {
      final builder = _builders[definition]!;
      final manager = _managers[definition] = builder(
        ref,
        definition,
      );
      manager.build(home.value.serviceWhere);
      _integrations[definition.key] = definition;
    }

    // Register location service providers
    container.read(locationManagerProvider).register(
          container.read(osmLocationServiceProvider),
        );

    // Register weather service providers
    container.read(weatherForecastManagerProvider).register(
          container.read(metNoForecastServiceProvider),
        );

    // Register device drivers and bind manager with dependencies
    final manager = container.read(deviceDriverManagerProvider);
    manager
      ..register(container.read(sikomDriverProvider))
      ..register(container.read(rtl433DriverProvider))
      ..register(container.read(metNoForecastDriverProvider));

    await manager.bind();
  }

  Map<String, Integration> get integrations => Map.of(_integrations);

  Optional<Integration> get(String key) {
    return Optional.ofNullable(_integrations[key]);
  }
}

@Riverpod(keepAlive: true)
IntegrationManager integrationManager(IntegrationManagerRef ref) =>
    IntegrationManager(ref);
