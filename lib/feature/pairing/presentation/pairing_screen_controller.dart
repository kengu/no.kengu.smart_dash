import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/account/domain/service_definition.dart';
import 'package:smart_dash/feature/device/data/device_definition_repository.dart';
import 'package:smart_dash/feature/device/domain/driver_definition.dart';
import 'package:smart_dash/widget/load/async_load_controller.dart';

part 'pairing_screen_controller.g.dart';

class PairingQuery {}

@riverpod
class PairingScreenController extends _$PairingScreenController
    with AsyncLoadController<PairingQuery, DriverDefinitionMap> {
  @override
  FutureOr<Optional<DriverDefinitionMap>> build() => super.build();

  @override
  Future<Optional<DriverDefinitionMap>> load() async {
    return Optional.of(await ref.read(
      driverDefinitionRepositoryProvider.future,
    ));
  }

  Future<void> authenticate(ServiceDefinition credentials) async {
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
