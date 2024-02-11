import 'package:smart_dash/feature/device/application/device_driver.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/feature/flow/application/flow_manager.dart';

class SikomFlow extends Flow {
  SikomFlow() : super('sikom');

  @override
  Stream<FlowEvent> evaluate(Object event) async* {
    if (event is DriverUpdatedEvent) {
      for (final device in event.devices) {
        for (final token in device.toTokens()) {
          switch (token.unit) {
            case TokenUnit.energy:
              yield FlowEvent<int>(
                token,
                device.electric?.cumulativeToday ?? 0,
                device.electric?.lastUpdated ?? device.lastUpdated,
              );
              break;
            case TokenUnit.power:
              yield FlowEvent<int>(
                token,
                device.electric?.currentPower ?? 0,
                device.electric?.lastUpdated ?? device.lastUpdated,
              );
              break;
            case TokenUnit.voltage:
              yield FlowEvent<int>(
                token,
                device.electric?.voltage ?? 0,
                device.electric?.lastUpdated ?? device.lastUpdated,
              );
              break;
            case TokenUnit.temperature:
              yield FlowEvent<double>(
                token,
                device.temperature ?? 0.0,
                device.lastUpdated,
              );
              break;
            case TokenUnit.onOff:
              yield FlowEvent<bool>(
                token,
                device.onOff?.state ?? false,
                device.onOff?.lastUpdated ?? device.lastUpdated,
              );
              break;
          }
        }
      }
    }
  }

  @override
  bool when(Object event) =>
      event is DriverUpdatedEvent &&
      event.devices.any(
        (d) => d.capabilities.isNotEmpty,
      );
}
