import 'package:smart_dash/feature/device/application/device_driver.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/feature/flow/domain/flow.dart';

class DeviceTokensFlow extends Flow {
  const DeviceTokensFlow() : super('$DeviceTokensFlow');

  @override
  Stream<FlowEvent> evaluate(Object event) async* {
    if (event is DevicesUpdatedEvent) {
      for (final device in event.devices) {
        final tags = toTags(device);
        yield FlowEvent(flow: key, tags: tags);
      }
    }
  }

  static List<FlowTag<dynamic>> toTags(Device device) {
    final tags = <FlowTag>[];
    for (final token in device.toTokens()) {
      switch (token.unit) {
        case TokenUnit.energy:
          tags.add(FlowTag<int>(
            token: token,
            data: device.electric?.cumulativeToday ?? 0,
            when: device.electric?.lastUpdated ?? device.lastUpdated,
          ));
          break;
        case TokenUnit.power:
          tags.add(FlowTag<int>(
            token: token,
            data: device.electric?.currentPower ?? 0,
            when: device.electric?.lastUpdated ?? device.lastUpdated,
          ));
          break;
        case TokenUnit.voltage:
          tags.add(FlowTag<int>(
            token: token,
            data: device.electric?.voltage ?? 0,
            when: device.electric?.lastUpdated ?? device.lastUpdated,
          ));
          break;
        case TokenUnit.luminance:
          tags.add(FlowTag<int>(
            token: token,
            data: device.luminance ?? 0,
            when: device.lastUpdated,
          ));
          break;
        case TokenUnit.temperature:
          tags.add(FlowTag<double>(
            token: token,
            data: device.temperature ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case TokenUnit.ultraviolet:
          tags.add(FlowTag<int>(
            token: token,
            data: device.ultraviolet ?? 00,
            when: device.lastUpdated,
          ));
          break;
        case TokenUnit.onOff:
          tags.add(FlowTag<bool>(
            token: token,
            data: device.onOff?.state ?? false,
            when: device.onOff?.lastUpdated ?? device.lastUpdated,
          ));
          break;
        case TokenUnit.rain:
          tags.add(FlowTag<double>(
            token: token,
            data: device.rain ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case TokenUnit.humidity:
          tags.add(FlowTag<double>(
            token: token,
            data: device.humidity ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case TokenUnit.windAngle:
          tags.add(FlowTag<double>(
            token: token,
            data: device.windAngle ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case TokenUnit.windSpeed:
          tags.add(FlowTag<double>(
            token: token,
            data: device.windSpeed ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case TokenUnit.gustSpeed:
          tags.add(FlowTag<double>(
            token: token,
            data: device.gustSpeed ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case TokenUnit.snowWeight:
          tags.add(FlowTag<int>(
            token: token,
            data: device.snowWeight ?? 0,
            when: device.lastUpdated,
          ));
          break;
        case TokenUnit.snowDepth:
          tags.add(FlowTag<int>(
            token: token,
            data: device.snowDepth ?? 0,
            when: device.lastUpdated,
          ));
          break;
        // Unimplemented units
        case TokenUnit.count:
          throw UnimplementedError(
            '${TokenUnit.count} not implemented',
          );
      }
    }
    return tags;
  }

  @override
  bool when(Object event) => event is DevicesUpdatedEvent;
}
