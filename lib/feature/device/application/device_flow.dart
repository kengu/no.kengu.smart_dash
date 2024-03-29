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
      switch (token.capability) {
        case DeviceCapability.energy:
          tags.add(FlowTag<int>(
            token: token,
            data: device.electric?.cumulativeToday ?? 0,
            when: device.electric?.lastUpdated ?? device.lastUpdated,
          ));
          break;
        case DeviceCapability.power:
          tags.add(FlowTag<int>(
            token: token,
            data: device.electric?.currentPower ?? 0,
            when: device.electric?.lastUpdated ?? device.lastUpdated,
          ));
          break;
        case DeviceCapability.voltage:
          tags.add(FlowTag<int>(
            token: token,
            data: device.electric?.voltage ?? 0,
            when: device.electric?.lastUpdated ?? device.lastUpdated,
          ));
          break;
        case DeviceCapability.luminance:
          tags.add(FlowTag<int>(
            token: token,
            data: device.luminance ?? 0,
            when: device.lastUpdated,
          ));
          break;
        case DeviceCapability.temperature:
          tags.add(FlowTag<double>(
            token: token,
            data: device.temperature ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case DeviceCapability.temperature1h:
          tags.add(FlowTag<double>(
            token: token,
            data: device.temperature1h ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case DeviceCapability.temperature3h:
          tags.add(FlowTag<double>(
            token: token,
            data: device.temperature3h ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case DeviceCapability.temperature6h:
          tags.add(FlowTag<double>(
            token: token,
            data: device.temperature6h ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case DeviceCapability.temperature12h:
          tags.add(FlowTag<double>(
            token: token,
            data: device.temperature12h ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case DeviceCapability.temperature1d:
          tags.add(FlowTag<double>(
            token: token,
            data: device.temperature1d ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case DeviceCapability.ultraviolet:
          tags.add(FlowTag<int>(
            token: token,
            data: device.ultraviolet ?? 00,
            when: device.lastUpdated,
          ));
          break;
        case DeviceCapability.onOff:
          tags.add(FlowTag<bool>(
            token: token,
            data: device.onOff?.state ?? false,
            when: device.onOff?.lastUpdated ?? device.lastUpdated,
          ));
          break;
        case DeviceCapability.rain:
          tags.add(FlowTag<double>(
            token: token,
            data: device.rain ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case DeviceCapability.rain1h:
          tags.add(FlowTag<double>(
            token: token,
            data: device.rain1h ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case DeviceCapability.rain3h:
          tags.add(FlowTag<double>(
            token: token,
            data: device.rain3h ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case DeviceCapability.rain6h:
          tags.add(FlowTag<double>(
            token: token,
            data: device.rain6h ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case DeviceCapability.rain12h:
          tags.add(FlowTag<double>(
            token: token,
            data: device.rain12h ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case DeviceCapability.rain1d:
          tags.add(FlowTag<double>(
            token: token,
            data: device.rain1d ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case DeviceCapability.rainRate:
          tags.add(FlowTag<double>(
            token: token,
            data: device.rainRate ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case DeviceCapability.rainTotal:
          tags.add(FlowTag<double>(
            token: token,
            data: device.rainTotal ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case DeviceCapability.humidity:
          tags.add(FlowTag<double>(
            token: token,
            data: device.humidity ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case DeviceCapability.windAngle:
          tags.add(FlowTag<double>(
            token: token,
            data: device.windAngle ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case DeviceCapability.windSpeed:
          tags.add(FlowTag<double>(
            token: token,
            data: device.windSpeed ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case DeviceCapability.gustSpeed:
          tags.add(FlowTag<double>(
            token: token,
            data: device.gustSpeed ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case DeviceCapability.snowWeight:
          tags.add(FlowTag<int>(
            token: token,
            data: device.snowWeight ?? 0,
            when: device.lastUpdated,
          ));
          break;
        case DeviceCapability.snowDepth:
          tags.add(FlowTag<int>(
            token: token,
            data: device.snowDepth ?? 0,
            when: device.lastUpdated,
          ));
          break;
        case DeviceCapability.snow1h:
          tags.add(FlowTag<double>(
            token: token,
            data: device.snow1h ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case DeviceCapability.snow3h:
          tags.add(FlowTag<double>(
            token: token,
            data: device.snow3h ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case DeviceCapability.snow6h:
          tags.add(FlowTag<double>(
            token: token,
            data: device.snow6h ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case DeviceCapability.snow12h:
          tags.add(FlowTag<double>(
            token: token,
            data: device.snow12h ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case DeviceCapability.snow1d:
          tags.add(FlowTag<double>(
            token: token,
            data: device.snow1d ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case DeviceCapability.targetTemperature:
          tags.add(FlowTag<double>(
            token: token,
            data: device.getTargetTemperature() ?? 0.0,
            when: device.lastUpdated,
          ));
        case DeviceCapability.value:
          throw UnimplementedError(
            'Flow for ${token.name} not implemented',
          );
      }
    }
    return tags;
  }

  @override
  bool when(Object event) => event is DevicesUpdatedEvent;
}
