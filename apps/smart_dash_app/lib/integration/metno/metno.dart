import 'package:smart_dash_app/feature/device/domain/device.dart';

class MetNo {
  static const key = 'metno';

  static const supportedTypes = [
    DeviceType.weatherForecast,
  ];

  static const readableModelName = {
    DeviceType.weatherForecast: 'Weather Forecast',
  };
}
