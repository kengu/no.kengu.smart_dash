import 'package:smart_dash/feature/device/application/device_driver.dart';
import 'package:smart_dash/feature/flow/application/flow_manager.dart';
import 'package:smart_dash/feature/flow/domain/token.dart';

class SikomFlow extends Flow {
  SikomFlow() : super('sikom');

  @override
  Stream<FlowEvent> evaluate(DriverEvent event) async* {
    if (event is DriverUpdatedEvent) {
      for (final device in event.devices) {
        for (final token in device.toTokens()) {
          switch (token.unit) {
            case TokenUnit.energy:
              yield FlowEvent<int>(
                token,
                device.energy?.cumulativeToday ?? 0,
                device.energy?.lastUpdated ?? device.lastUpdated,
              );
              break;
            case TokenUnit.power:
              yield FlowEvent<int>(
                token,
                device.energy?.currentPower ?? 0,
                device.lastUpdated,
              );
              break;
            case TokenUnit.voltage:
              yield FlowEvent<int>(
                token,
                device.voltage ?? 0,
                device.lastUpdated,
              );
              break;
            case TokenUnit.temperature:
              yield FlowEvent<int>(
                token,
                device.temperature ?? 0,
                device.lastUpdated,
              );
              break;
          }
        }
      }
    }
  }

  @override
  bool when(DriverEvent event) =>
      event is DriverUpdatedEvent &&
      event.devices.any(
        (d) => d.capabilities.isNotEmpty,
      );
}
