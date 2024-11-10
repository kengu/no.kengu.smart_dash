import 'package:smart_dash/feature/device/application/device_driver.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_flow/smart_dash_flow.dart';

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

  static List<Tag<dynamic>> toTags(Device device) {
    final tags = <Tag>[];
    for (final token in device.toTokens()) {
      switch (token.capability) {
        case Capability.energy:
          tags.add(Tag<int>(
            token: token,
            data: device.electric?.cumulativeToday ?? 0,
            when: device.electric?.lastUpdated ?? device.lastUpdated,
          ));
          break;
        case Capability.power:
          tags.add(Tag<int>(
            token: token,
            data: device.electric?.currentPower ?? 0,
            when: device.electric?.lastUpdated ?? device.lastUpdated,
          ));
          break;
        case Capability.voltage:
          tags.add(Tag<int>(
            token: token,
            data: device.electric?.voltage ?? 0,
            when: device.electric?.lastUpdated ?? device.lastUpdated,
          ));
          break;
        case Capability.luminance:
          tags.add(Tag<int>(
            token: token,
            data: device.luminance ?? 0,
            when: device.lastUpdated,
          ));
          break;
        case Capability.temperature:
          tags.add(Tag<double>(
            token: token,
            data: device.temperature ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case Capability.temperature1h:
          tags.add(Tag<double>(
            token: token,
            data: device.temperature1h ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case Capability.temperature3h:
          tags.add(Tag<double>(
            token: token,
            data: device.temperature3h ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case Capability.temperature6h:
          tags.add(Tag<double>(
            token: token,
            data: device.temperature6h ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case Capability.temperature12h:
          tags.add(Tag<double>(
            token: token,
            data: device.temperature12h ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case Capability.temperature1d:
          tags.add(Tag<double>(
            token: token,
            data: device.temperature1d ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case Capability.ultraviolet:
          tags.add(Tag<int>(
            token: token,
            data: device.ultraviolet ?? 00,
            when: device.lastUpdated,
          ));
          break;
        case Capability.onOff:
          tags.add(Tag<bool>(
            token: token,
            data: device.onOff?.state ?? false,
            when: device.onOff?.lastUpdated ?? device.lastUpdated,
          ));
          break;
        case Capability.rain:
          tags.add(Tag<double>(
            token: token,
            data: device.rain ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case Capability.rain1h:
          tags.add(Tag<double>(
            token: token,
            data: device.rain1h ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case Capability.rain3h:
          tags.add(Tag<double>(
            token: token,
            data: device.rain3h ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case Capability.rain6h:
          tags.add(Tag<double>(
            token: token,
            data: device.rain6h ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case Capability.rain12h:
          tags.add(Tag<double>(
            token: token,
            data: device.rain12h ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case Capability.rain1d:
          tags.add(Tag<double>(
            token: token,
            data: device.rain1d ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case Capability.rainRate:
          tags.add(Tag<double>(
            token: token,
            data: device.rainRate ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case Capability.rainTotal:
          tags.add(Tag<double>(
            token: token,
            data: device.rainTotal ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case Capability.humidity:
          tags.add(Tag<double>(
            token: token,
            data: device.humidity ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case Capability.windAngle:
          tags.add(Tag<double>(
            token: token,
            data: device.windAngle ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case Capability.windSpeed:
          tags.add(Tag<double>(
            token: token,
            data: device.windSpeed ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case Capability.gustSpeed:
          tags.add(Tag<double>(
            token: token,
            data: device.gustSpeed ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case Capability.snowWeight:
          tags.add(Tag<int>(
            token: token,
            data: device.snowWeight ?? 0,
            when: device.lastUpdated,
          ));
          break;
        case Capability.snowDepth:
          tags.add(Tag<int>(
            token: token,
            data: device.snowDepth ?? 0,
            when: device.lastUpdated,
          ));
          break;
        case Capability.snow1h:
          tags.add(Tag<double>(
            token: token,
            data: device.snow1h ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case Capability.snow3h:
          tags.add(Tag<double>(
            token: token,
            data: device.snow3h ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case Capability.snow6h:
          tags.add(Tag<double>(
            token: token,
            data: device.snow6h ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case Capability.snow12h:
          tags.add(Tag<double>(
            token: token,
            data: device.snow12h ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case Capability.snow1d:
          tags.add(Tag<double>(
            token: token,
            data: device.snow1d ?? 0.0,
            when: device.lastUpdated,
          ));
          break;
        case Capability.targetTemperature:
          tags.add(Tag<double>(
            token: token,
            data: device.getTargetTemperature() ?? 0.0,
            when: device.lastUpdated,
          ));
        case Capability.any:
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
