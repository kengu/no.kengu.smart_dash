import 'package:optional/optional.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

import 'weather_forecast_driver.dart';

part 'weather_forecast_manager.g.dart';

class WeatherForecastManager extends DriverManager<WeatherForecastDriver> {
  WeatherForecastManager(super.ref);

  /// Find [ServiceConfig] for [WeatherForecastDriver] with given [Integration.key]
  Optional<ServiceConfig> find(String key) {
    return configs.where((e) => e.key == key).firstOptional;
  }

  /// Get [WeatherForecastDriver] for given [Integration.key]
  WeatherForecastDriver getDriver(String key) {
    final config = find(key);
    assert(
      config.isPresent,
      '$WeatherForecastDriver[key:$key] not found. '
      'Have you remembered to register it with the DeviceDriverManager?',
    );
    return get(config.value);
  }
}

@Riverpod(keepAlive: true)
WeatherForecastManager weatherForecastManager(Ref ref) {
  return WeatherForecastManager(ref);
}
