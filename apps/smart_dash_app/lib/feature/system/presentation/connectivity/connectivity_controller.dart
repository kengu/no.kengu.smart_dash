import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_app/core/presentation/widget/load/async_load_controller.dart';
import 'package:smart_dash_app/feature/system/application/connectivity_service.dart';
import 'package:smart_dash_app/feature/system/domain/connectivity.dart';
import 'package:smart_dash_app/integration/application/integration_manager.dart';
import 'package:smart_dash_account/smart_dash_account.dart';

part 'connectivity_controller.g.dart';

class ConnectivityQuery {
  ConnectivityQuery();
}

@riverpod
class ConnectivityScreenController extends _$ConnectivityScreenController
    with AsyncLoadController<ConnectivityQuery, List<Connectivity>> {
  @override
  FutureOr<Optional<List<Connectivity>>> build(ConnectivityQuery query) =>
      super.build(query);

  @override
  Future<Optional<List<Connectivity>>> load(ConnectivityQuery query) async {
    final items = <Connectivity>[];
    final integrations = ref.read(integrationManagerProvider);
    for (final it in ref.read(connectivityServiceProvider).getStates()) {
      final service = integrations.get(it.key);
      assert(service.isPresent, 'Service ${it.key} not found');
      if (service.isPresent) {
        items.add(Connectivity(service.value, it));
      }
    }
    return Optional.of(items);
  }
}

class Connectivity {
  Connectivity(this.service, this.state);
  final Integration service;
  final ConnectivityState state;
}
