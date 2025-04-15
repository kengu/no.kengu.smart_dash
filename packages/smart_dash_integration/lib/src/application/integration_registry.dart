import 'package:optional/optional.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

part 'integration_registry.g.dart';

typedef DriverServiceBuilder = FutureOr<DriverService> Function();
typedef ServiceConfigGetter = Iterable<ServiceConfig> Function(String key);

class IntegrationRegistry {
  IntegrationRegistry(this.ref, this.baseUrl);

  final Ref ref;
  final String baseUrl;
  final Map<String, Integration> _integrations = {};
  final Map<Integration, List<ServiceConfig>> _configs = {};
  final Map<IntegrationType, DriverServiceBuilder> _builders = {};

  bool exists(String key) {
    return _integrations.containsKey(key);
  }

  /// Install [DriverService] builder for given [type]
  void install(IntegrationType type, DriverServiceBuilder builder) {
    assert(
      !_builders.containsKey(type),
      'Builder for [$type] already exists',
    );
    _builders[type] = builder;
  }

  /// Register [Integration]s supported by given [service]
  void register(DriverService service) {
    for (final it in service.integrations) {
      _integrations[it.key] = it;
      _configs[it] = service.manager.configs;
    }
  }

  IntegrationMap getAll() {
    return Map.from(_integrations);
  }

  Optional<Integration> get(String key) {
    return Optional.ofNullable(_integrations[key]);
  }

  IntegrationMap where(Function(Integration e) test) {
    return Map.fromEntries(
      _integrations.entries.where((e) => test(e.value)),
    );
  }

  /// Discover [Integration]s from [baseUrl] and register them
  Future<IntegrationMap> discover() async {
    if (!baseUrl.isLocalhost) {
      final integrations =
          await ref.read(integrationClientProvider(baseUrl)).getAll();
      for (final it in integrations) {
        _integrations[it.key] = it;
        _configs[it] = await ref
            .read(serviceConfigClientProvider(baseUrl))
            .getAll([it.key]);
      }
    }
    return Map.from(_integrations);
  }

  /// Get all [ServiceConfig]s for registered [Integration]s from [baseUrl]
  FutureOr<List<ServiceConfig>> getConfigs({IntegrationType? type}) async {
    if (baseUrl.isLocalhost) {
      return _configs.entries
          .where((e) => type == null || e.key.type == type)
          .fold(
        <ServiceConfig>[],
        (items, entry) {
          items.addAll(entry.value);
          return items;
        },
      ).toList();
    }

    final keys = type == null
        ? _integrations.keys
        : _integrations.entries
            .where((it) => it.value.type == type)
            .map((e) => e.key);

    final client = ref.read(serviceConfigClientProvider(baseUrl));
    return keys.isEmpty
        ? <ServiceConfig>[]
        : await client.getAll(keys.toList());
  }

  /// Build installed [DriverService]s and register [Integration]s
  Future<List<DriverService>> build(ServiceConfigGetter where) async {
    final services = <DriverService>[];
    for (final builder in _builders.values) {
      final service = await builder();
      await service.manager.build(where);
      register(service);
      services.add(service);
    }
    return services;
  }
}

@Riverpod(keepAlive: true)
IntegrationRegistry integrationRegistry(
    IntegrationRegistryRef ref, String baseUrl) {
  return IntegrationRegistry(ref, baseUrl);
}
