import 'package:optional/optional.dart';
import 'package:smart_dash_device/smart_dash_device.dart';
import 'package:smart_dash_weather/smart_dash_weather.dart';
import 'package:smart_dash_weather/src/application/weather_forecast_driver.dart';

class WeatherForecastDeviceClient extends DeviceClient {
  WeatherForecastDeviceClient(this.driver) : super(driver.config);

  final WeatherForecastDriver driver;

  Future<Optional<WeatherForecastDevice>> getDevice(
    double lat,
    double lon,
    DateTime? lastModified,
  ) async {
    final response = await driver.getForecast(
      lat,
      lon,
      lastModified,
    );
    if (response.isPresent) {
      return Optional.of(
        WeatherForecastDevice(
          state: response.value.data,
          service: driver.key,
        ),
      );
    }
    return Optional.empty();
  }

  @override
  void close() {
    // Not needed
  }
}
