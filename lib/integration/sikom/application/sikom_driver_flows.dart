import 'package:smart_dash/feature/device/application/device_driver.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/feature/device/domain/energy_summary.dart';
import 'package:smart_dash/feature/flow/application/flow_manager.dart';
import 'package:smart_dash/feature/flow/domain/token.dart';

class SikomFlow extends Flow {
  SikomFlow() : super('sikom');

  @override
  Stream<FlowEvent> evaluate(DriverEvent event) async* {
    if (event is DriverUpdatedEvent) {
      for (final device in event.devices) {
        for (final capability in device.capabilities) {
          switch (capability) {
            case DeviceCapabilities.energy:
              yield FlowEvent<EnergySummary>(
                Tokens.energy,
                device.energy ?? EnergySummary.empty(),
                device.energy?.lastUpdated ?? device.lastUpdated,
              );
              break;
            case DeviceCapabilities.power:
              yield FlowEvent<int>(
                Tokens.power,
                device.energy?.currentPower ?? 0,
                device.lastUpdated,
              );
              break;
            case DeviceCapabilities.voltage:
              yield FlowEvent<int>(
                Tokens.voltage,
                device.voltage ?? 0,
                device.lastUpdated,
              );
              break;
            case DeviceCapabilities.temperature:
              yield FlowEvent<int>(
                Tokens.temperature,
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
