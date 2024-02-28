import 'package:smart_dash/feature/device/application/device_driver.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/feature/flow/application/flow_manager.dart';

class DeviceFlow extends Flow {
  const DeviceFlow() : super('device');

  @override
  Stream<FlowEvent> evaluate(Object event) async* {
    if (event is DevicesUpdatedEvent) {
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
            case TokenUnit.luminance:
              yield FlowEvent<int>(
                token,
                device.luminance ?? 0,
                device.lastUpdated,
              );
              break;
            case TokenUnit.temperature:
              yield FlowEvent<double>(
                token,
                device.temperature ?? 0.0,
                device.lastUpdated,
              );
              break;
            case TokenUnit.ultraviolet:
              yield FlowEvent<int>(
                token,
                device.ultraviolet ?? 00,
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
            case TokenUnit.rain:
              yield FlowEvent<double>(
                token,
                device.rain ?? 0.0,
                device.lastUpdated,
              );
              break;
            case TokenUnit.humidity:
              yield FlowEvent<double>(
                token,
                device.humidity ?? 0.0,
                device.lastUpdated,
              );
              break;
            case TokenUnit.windAngle:
              yield FlowEvent<double>(
                token,
                device.windAngle ?? 0.0,
                device.lastUpdated,
              );
              break;
            case TokenUnit.windSpeed:
              yield FlowEvent<double>(
                token,
                device.windSpeed ?? 0.0,
                device.lastUpdated,
              );
              break;
            case TokenUnit.gustSpeed:
              yield FlowEvent<double>(
                token,
                device.gustSpeed ?? 0.0,
                device.lastUpdated,
              );
              break;
            case TokenUnit.count:
              throw UnimplementedError(
                '${TokenUnit.count} not implemented',
              );
          }
        }
      }
    }
  }

  @override
  bool when(Object event) =>
      event is DevicesUpdatedEvent &&
      event.devices.any(
        (d) => d.capabilities.isNotEmpty,
      );
}
