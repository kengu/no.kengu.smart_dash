import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';
import 'package:smart_dash_weather/src/data/weather_forecast_client.dart';
import 'package:smart_dash_weather/src/data/weather_response.dart';

abstract class WeatherForecastDriver extends Driver<WeatherForecastDriver> {
  WeatherForecastDriver({
    required super.ref,
    required super.key,
    required super.config,
  }) : super(
          type: IntegrationType.weather,
          last: DriverInitializedEvent.now(key),
        );

  static const Duration period = Duration(seconds: 3);

  @protected
  WeatherForecastClient newClient();

  Future<Optional<WeatherResponse>> getForecast(
    double lat,
    double lon, [
    DateTime? lastModified,
  ]) async {
    final client = newClient();
    try {
      return await client.getForecast(
        lat,
        lon,
        lastModified,
      );
    } finally {
      client.close();
    }
  }
}
