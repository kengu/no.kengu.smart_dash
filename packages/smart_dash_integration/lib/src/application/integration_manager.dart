import 'package:optional/optional.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

part 'integration_manager.g.dart';

typedef IntegrationBuilder = DriverManager Function(Ref ref);

class IntegrationManager {
  IntegrationManager();

  final Map<String, Integration> _integrations = {};

  void register(Integration definition) {
    _integrations[definition.key] = definition;
  }

  Optional<Integration> get(String key) {
    return Optional.ofNullable(_integrations[key]);
  }

  IntegrationMap getAll() {
    return Map.from(_integrations);
  }
}

@Riverpod(keepAlive: true)
IntegrationManager integrationManager(IntegrationManagerRef ref) {
  return IntegrationManager();
}
