import 'package:async/async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_account/smart_dash_account_app.dart';
import 'package:smart_dash_analytics/smart_dash_analytics.dart';
import 'package:smart_dash_app/feature/presence/application/presence_service.dart';
import 'package:smart_dash_app/feature/system/application/network_info_service.dart';
import 'package:smart_dash_app/feature/system/application/system_health_service.dart';
import 'package:smart_dash_app/integration/mqtt/application/mqtt_service.dart';
import 'package:smart_dash_app/integration/osm/application/osm_location_service.dart';
import 'package:smart_dash_app/integration/rtl_433/rtl_433.dart';
import 'package:smart_dash_camera/smart_dash_camera.dart';
import 'package:smart_dash_common/smart_dash_common_flutter.dart';
import 'package:smart_dash_device/smart_dash_device.dart';
import 'package:smart_dash_flow/smart_dash_flow.dart';

part 'integration_manager.g.dart';

typedef IntegrationBuilder = DriverManager Function(Ref ref);

// TODO: Add system integrations to new homes automatically
@Riverpod()
class IntegrationManager extends _$IntegrationManager {
  IntegrationManager();

  final _log = Logger('$IntegrationManager');

  final Map<String, Integration> _integrations = {};
  final Map<Integration, DriverManager> _managers = {};
  final Map<Integration, IntegrationBuilder> _builders = {};

  bool _init = true;

  void register(Integration definition, IntegrationBuilder builder) {
    final exists = _builders.keys.any((e) => e.key == definition.key);
    assert(
      !(_init && exists),
      'Registration after first build: [${definition.key}]. '
      'Did you forget to initialize service provider?',
    );
    _builders[definition] = builder;
  }

  Optional<Integration> get(String key) {
    return Optional.ofNullable(_integrations[key]);
  }

  IntegrationMap getAll() {
    return Map.from(_integrations);
  }

  /// Build integrations from definitions
  @override
  Future<IntegrationManager> build() async {
    assert(_init, '$IntegrationManager should only build once!');

    // Register integrations
    register(Rtl433.definition, Rtl433.register);
    register(Foscam.definition, Foscam.register);

    _init = false;
    _log.info('Providers: Initializing...');

    // Initialize root providers
    final dirs = await ref.read(flutterDirsProvider.future);
    _log.info('Working directory is ${dirs.documentsDir}');

    final home = await ref.read(accountServiceProvider).getCurrentHome();
    assert(home.isPresent, 'TODO: Handle no home better!');

    // Do this last
    register(Sikom.definition, Sikom.register);

    // Build integrations
    await _build(home.value.serviceWhere);

    // Register location service providers
    ref.read(locationManagerProvider).register(
          ref.read(osmLocationServiceProvider),
        );

    // Bind with dependencies
    ref.read(historyManagerProvider).bind(
          ref.read(flowManagerProvider).events.map((e) => e.tags),
          ref.read(deviceServiceProvider).getTokens,
        );

    ref.read(networkInfoServiceProvider).bind();
    ref.read(presenceServiceProvider).bind();
    ref.read(systemHealthServiceProvider).bind(
          StreamGroup.merge(
            _managers.values.map((e) => e.events),
          ),
        );

    // Start services
    ref.read(mqttServiceProvider).start();
    ref.read(blockManagerProvider).start();

    // Start pumping events
    ref.read(timingServiceProvider).start();
    ref.read(historyManagerProvider).pump();

    _log.info('Providers: Initialized');

    return this;
  }

  Future<void> _build(ServiceConfigGetter where) async {
    // TODO: Remove integration repository (not needed)
    final definitions = await ref.read(integrationRepositoryProvider.future);
    for (final definition in definitions.values) {
      _integrations[definition.key] = definition;
    }

    // Build integrations
    for (final definition in _builders.keys) {
      final builder = _builders[definition]!;
      final manager = _managers[definition] = builder(ref);
      await manager.build(where);
      _integrations[definition.key] = definition;
    }
  }
}
