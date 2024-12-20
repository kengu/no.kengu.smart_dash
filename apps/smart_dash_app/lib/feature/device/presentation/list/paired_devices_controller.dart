import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_app/core/presentation/widget/load/async_load_controller.dart';
import 'package:smart_dash_device/smart_dash_device.dart';

part 'paired_devices_controller.g.dart';

class PairedDeviceQuery {
  PairedDeviceQuery();
}

@riverpod
class PairedDevicesScreenController extends _$PairedDevicesScreenController
    with AsyncLoadController<PairedDeviceQuery, List<Device>> {
  @override
  FutureOr<Optional<List<Device>>> build(PairedDeviceQuery query) =>
      super.build(query);

  @override
  Future<Optional<List<Device>>> load(PairedDeviceQuery query) async {
    return Optional.of(await ref.read(deviceRepositoryProvider).getAll());
  }
}
