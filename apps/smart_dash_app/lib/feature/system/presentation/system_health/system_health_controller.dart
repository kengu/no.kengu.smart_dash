import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_account/smart_dash_account.dart';
import 'package:smart_dash_app/core/presentation/widget/load/async_load_controller.dart';
import 'package:smart_dash_app/feature/system/application/system_health_service.dart';
import 'package:smart_dash_app/feature/system/domain/system_health.dart';
import 'package:smart_dash_app/integration/application/integration_manager.dart';

part 'system_health_controller.g.dart';

class SystemHealthQuery {
  SystemHealthQuery();
}

@riverpod
class SystemHealthScreenController extends _$SystemHealthScreenController
    with AsyncLoadController<SystemHealthQuery, List<SystemHealth>> {
  @override
  FutureOr<Optional<List<SystemHealth>>> build(SystemHealthQuery query) =>
      super.build(query);

  @override
  Future<Optional<List<SystemHealth>>> load(SystemHealthQuery query) async {
    final items = <SystemHealth>[];
    final integrations = ref.read(integrationManagerProvider);
    for (final it in ref.read(connectivityServiceProvider).getStates()) {
      final service = integrations.get(it.key);
      assert(service.isPresent, 'Service ${it.key} not found');
      if (service.isPresent) {
        items.add(SystemHealth(service.value, it));
      }
    }
    return Optional.of(items);
  }
}

class SystemHealth {
  SystemHealth(this.service, this.state);
  final Integration service;
  final SystemHealthState state;
}
