import 'package:smart_dash/feature/device/domain/device.dart';

class NySny {
  static const String key = 'nysny';

  static const supportedTypes = [
    DeviceType.sensor,
  ];

  static const readableModelName = {
    DeviceType.sensor: 'Snow Sensor',
  };
}
