import 'package:smart_dash/feature/device/domain/device.dart';

class MetNo {
  static const key = 'metno';

  static const supportedTypes = [
    DeviceType.sensor,
  ];

  static const readableModelName = {
    DeviceType.sensor: 'Sensor',
  };
}
