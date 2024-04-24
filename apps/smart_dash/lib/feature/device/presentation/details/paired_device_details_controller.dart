import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/device/data/device_repository.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/core/presentation/widget/load/async_load_controller.dart';

part 'paired_device_details_controller.g.dart';

class PairedDeviceDetailsQuery {
  PairedDeviceDetailsQuery(
    this.id,
  );

  final Identity id;
}

@riverpod
class PairedDeviceDetailsScreenController
    extends _$PairedDeviceDetailsScreenController
    with AsyncLoadController<PairedDeviceDetailsQuery, Device> {
  @override
  FutureOr<Optional<Device>> build(PairedDeviceDetailsQuery query) =>
      super.build(query);

  @override
  Future<Optional<Device>> load(PairedDeviceDetailsQuery query) async {
    return ref.read(deviceRepositoryProvider).get(query.id);
  }
}
