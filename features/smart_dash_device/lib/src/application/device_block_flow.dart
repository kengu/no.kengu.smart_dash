import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_device/smart_dash_device.dart';
import 'package:smart_dash_flow/smart_dash_flow.dart';

class DeviceBlockFlow extends BlockFlow {
  DeviceBlockFlow(
    super.ref,
    super.id,
  );

  @override
  Stream<List<Tag<dynamic>>> toTags(Object event) async* {
    if (event is DevicesUpdatedEvent) {
      for (final device in event.devices) {
        yield DeviceTokensFlow.toTags(device);
      }
    }
  }

  @override
  BlockTriggerOnType toTrigger(Object event) {
    return switch (event.runtimeType) {
      const (DevicesUpdatedEvent) => BlockTriggerOnType.device,
      const (ThrottledDriverUpdatedEvent) => BlockTriggerOnType.device,
      _ => BlockTriggerOnType.none,
    };
  }
}
