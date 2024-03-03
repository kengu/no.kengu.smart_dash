import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/core/presentation/widget/load/async_load_controller.dart';
import 'package:smart_dash/feature/device/application/device_driver_manager.dart';
import 'package:smart_dash/feature/device/domain/device.dart';

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
    with AsyncLoadController<NewDevicesQuery, List<Device>> {
  @override
  FutureOr<Optional<List<Device>>> build(NewDevicesQuery query) =>
      super.build(query);

  @override
  Future<Optional<List<Device>>> load(NewDevicesQuery query) async {
    final driver = ref.read(deviceDriverManagerProvider).getDriver(
          query.serviceKey,
        );
    return Optional.of(
      await driver.getNewDevices(query.type),
    );
  }
}
