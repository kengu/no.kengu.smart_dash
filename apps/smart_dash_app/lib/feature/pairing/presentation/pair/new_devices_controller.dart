import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_app/core/presentation/widget/state/smart_dash_state.dart';
import 'package:smart_dash_device/smart_dash_device.dart';

part 'new_devices_controller.g.dart';

class NewDevicesQuery {
  NewDevicesQuery({
    required this.type,
    required this.serviceKey,
  });
  final DeviceType type;
  final String serviceKey;
}

@riverpod
class NewDevicesScreenController extends _$NewDevicesScreenController
    with AsyncViewModel<NewDevicesQuery, List<Device>> {
  @override
  FutureOr<Optional<List<Device>>> build(NewDevicesQuery query) =>
      super.build(query);

  @override
  Future<Optional<List<Device>>> load(NewDevicesQuery query) async {
    final driver = ref.read(deviceManagerProvider).getDriver(
          query.serviceKey,
        );
    return Optional.of(
      await driver.getNewDevices(query.type),
    );
  }
}
