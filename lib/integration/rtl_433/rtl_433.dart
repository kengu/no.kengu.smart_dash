import 'domain/rtl_433_device.dart';

class Rtl433 {
  static const String key = 'rtl_433';

  static const supportedTypes = [
    Rtl433DeviceType.sensor,
    Rtl433DeviceType.weatherStation,
  ];

  static const readableModelName = {
    Rtl433DeviceType.sensor: 'Sensor',
    Rtl433DeviceType.weatherStation: 'Weather Station',
  };
}
