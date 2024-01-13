import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/account/domain/service_config.dart';
import 'package:smart_dash/integration/data/integration_repository.dart';
import 'package:smart_dash/integration/domain/integration.dart';
import 'package:smart_dash/core/presentation/widget/load/async_load_controller.dart';

part 'pairing_screen_controller.g.dart';

class PairingQuery {}

@riverpod
class PairingScreenController extends _$PairingScreenController
    with AsyncLoadController<PairingQuery, IntegrationMap> {
  @override
  FutureOr<Optional<IntegrationMap>> build() => super.build();

  @override
  Future<Optional<IntegrationMap>> load() async {
    return Optional.of(await ref.read(
      integrationRepositoryProvider.future,
    ));
  }

  Future<void> authenticate(ServiceConfig credentials) async {
    // final user = ref.read(authRepositoryProvider).currentUser;
    // final account = await ref.read(accountRepositoryProvider).get(user.userId);
    // return Optional.of(
    //   account.isPresent
    //       ? Map.fromEntries(account.value.services.map(
    //         (e) => MapEntry(e.name, e),
    //   ))
    //       : {},
    // );
  }
}
