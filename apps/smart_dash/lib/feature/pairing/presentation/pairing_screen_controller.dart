import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/core/presentation/widget/load/async_load_controller.dart';
import 'package:smart_dash/integration/data/integration_repository.dart';
import 'package:smart_dash/integration/domain/integration.dart';

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
    final services = await ref.read(
      integrationRepositoryProvider.future,
    );
    return Optional.of(Map.fromEntries(services.entries.where(
      (e) => e.value.features.contains(IntegrationFeature.device),
    )));
  }
}
