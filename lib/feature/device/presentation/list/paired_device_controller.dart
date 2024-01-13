import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/device/data/device_repository.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/core/presentation/widget/load/async_load_controller.dart';

part 'paired_device_controller.g.dart';

class PairedDeviceQuery {
  PairedDeviceQuery();
}

@riverpod
class PairedDeviceScreenController extends _$PairedDeviceScreenController
    with AsyncLoadController<PairedDeviceQuery, List<Device>> {
  @override
  FutureOr<Optional<List<Device>>> build() => super.build();

  @override
  Future<Optional<List<Device>>> load() async {
    return ref.read(deviceRepositoryProvider).getAll();
  }
}
