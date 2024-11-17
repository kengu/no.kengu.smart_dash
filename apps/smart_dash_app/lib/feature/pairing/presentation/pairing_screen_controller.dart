import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_account/smart_dash_account.dart';
import 'package:smart_dash_app/core/presentation/widget/load/async_load_controller.dart';
import 'package:smart_dash_app/integration/application/integration_manager.dart';

part 'pairing_screen_controller.g.dart';

class PairingQuery {}

@riverpod
class PairingScreenController extends _$PairingScreenController
    with AsyncLoadController<PairingQuery, IntegrationMap> {
  @override
  FutureOr<Optional<IntegrationMap>> build(PairingQuery query) =>
      super.build(query);

  @override
  Future<Optional<IntegrationMap>> load(PairingQuery query) async {
    final integrations = ref.read(integrationManagerProvider).integrations;
    return Optional.of(Map.fromEntries(integrations.entries.where(
      (e) => e.value.type == IntegrationType.device,
    )));
  }
}
