import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

part 'integration_manager.g.dart';

typedef DriverServiceBuilder = FutureOr<DriverService> Function();

class IntegrationManager {
  IntegrationManager();

  final Map<String, Integration> _integrations = {};
  final Map<IntegrationType, DriverServiceBuilder> _builders = {};

  void install(IntegrationType type, DriverServiceBuilder builder) {
    assert(
      !_builders.containsKey(type),
      'Builder for [$type] already exists',
    );
    _builders[type] = builder;
  }

  Optional<Integration> get(String key) {
    return Optional.ofNullable(_integrations[key]);
  }

  IntegrationMap getAll() {
    return Map.from(_integrations);
  }

  /// Build integrations
  Future<List<DriverService>> build(ServiceConfigGetter where) async {
    final services = <DriverService>[];
    for (final builder in _builders.values) {
      final service = await builder();
      for (final it in service.manager.integrations) {
        _integrations[it.key] = it;
      }
      await service.manager.build(where);
      services.add(service);
    }
    return services;
  }
}

@Riverpod(keepAlive: true)
IntegrationManager integrationManager(IntegrationManagerRef ref) {
  return IntegrationManager();
}
