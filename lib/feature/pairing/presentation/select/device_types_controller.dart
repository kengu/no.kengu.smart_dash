import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/device/application/device_driver_manager.dart';
import 'package:smart_dash/feature/device/domain/device_definition.dart';
import 'package:smart_dash/widget/load/async_load_controller.dart';

part 'device_types_controller.g.dart';

class DeviceTypesQuery {
  DeviceTypesQuery(
    this.serviceKey,
  );
  final String serviceKey;
}

@riverpod
class DeviceTypesScreenController extends _$DeviceTypesScreenController
    with AsyncLoadController<DeviceTypesQuery, List<DeviceDefinition>> {
  @override
  FutureOr<Optional<List<DeviceDefinition>>> build() => super.build();

  @override
  Future<Optional<List<DeviceDefinition>>> load() async {
    final service = ref.read(deviceDriverManagerProvider).getDriver(
          query!.serviceKey,
        );
    return Optional.ofNullable(
      await service.getDeviceDefinitions(),
    );
  }
}
