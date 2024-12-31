import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_app/core/presentation/widget/state/smart_dash_state.dart';
import 'package:smart_dash_device/smart_dash_device.dart';

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
    with AsyncViewModel<PairedDeviceDetailsQuery, Device> {
  @override
  FutureOr<Optional<Device>> build(PairedDeviceDetailsQuery query) =>
      super.build(query);

  @override
  Future<Optional<Device>> load(PairedDeviceDetailsQuery query) async {
    return ref.read(deviceRepositoryProvider).get(query.id);
  }
}
