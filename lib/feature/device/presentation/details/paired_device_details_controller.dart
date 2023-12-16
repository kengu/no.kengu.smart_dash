import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/device/data/device_repository.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/widget/load/async_load_controller.dart';

part 'paired_device_details_controller.g.dart';

class PairedDeviceDetailsQuery {
  PairedDeviceDetailsQuery(
    this.deviceId,
  );

  final String deviceId;
}

@riverpod
class PairedDeviceDetailsScreenController
    extends _$PairedDeviceDetailsScreenController
    with AsyncLoadController<PairedDeviceDetailsQuery, Device> {
  @override
  FutureOr<Optional<Device>> build() => super.build();

  @override
  Future<Optional<Device>> load() async {
    return ref.read(deviceRepositoryProvider).get(query!.deviceId);
  }
}
