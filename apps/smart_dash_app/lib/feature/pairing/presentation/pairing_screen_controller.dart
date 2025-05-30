import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_account/smart_dash_account_app.dart';
import 'package:smart_dash_app/core/presentation/widget/state/smart_dash_state.dart';

part 'pairing_screen_controller.g.dart';

class PairingQuery {}

@riverpod
class PairingScreenController extends _$PairingScreenController
    with AsyncViewModel<PairingQuery, IntegrationMap> {
  @override
  FutureOr<Optional<IntegrationMap>> build(PairingQuery query) =>
      super.build(query);

  @override
  Future<Optional<IntegrationMap>> load(PairingQuery query) async {
    final result =
        await ref.watch(getCurrentIntegrationRegistryProvider.future);
    if (!result.isPresent) return const Optional.empty();
    final integrations = result.value.getAll();
    return Optional.of(Map.fromEntries(integrations.entries.where(
      (e) => e.value.type == IntegrationType.device,
    )));
  }
}
