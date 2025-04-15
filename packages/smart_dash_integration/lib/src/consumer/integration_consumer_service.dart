import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

abstract class IntegrationConsumerService<D> extends IntegrationService<D> {
  IntegrationConsumerService(super.ref, super.type, this.baseUrl);

  final String baseUrl;
  final _configs = <ServiceConfig>{};
  final _integrations = <String, Integration>{};

  @override
  List<Integration> get integrations {
    return _integrations.values.toList();
  }

  List<ServiceConfig> get configs {
    return _configs.toList();
  }

  @mustCallSuper
  Future<void> build() async {
    final registry = ref.read(integrationRegistryProvider(baseUrl));
    _integrations.clear();
    final result = await registry.discover();
    for (final it in result.values.where((e) => e.type == type)) {
      _integrations[it.key] = it;
    }
    _configs
      ..clear()
      ..addAll(
        await registry.getConfigs(type: type),
      );
  }
}
