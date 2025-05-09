import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_app/core/presentation/widget/state/smart_dash_state.dart';
import 'package:smart_dash_device/smart_dash_device.dart';

part 'device_types_controller.g.dart';

class DeviceTypesQuery {
  DeviceTypesQuery(
    this.serviceKey,
  );
  final String serviceKey;
}

@riverpod
class DeviceTypesScreenController extends _$DeviceTypesScreenController
    with AsyncViewModel<DeviceTypesQuery, List<DeviceDefinition>> {
  @override
  FutureOr<Optional<List<DeviceDefinition>>> build(DeviceTypesQuery query) =>
      super.build(query);

  @override
  Future<Optional<List<DeviceDefinition>>> load(DeviceTypesQuery query) async {
    final service = ref.read(deviceManagerProvider).getDriver(
          query.serviceKey,
        );
    return Optional.ofNullable(
      service.getDeviceDefinitions(),
    );
  }
}
