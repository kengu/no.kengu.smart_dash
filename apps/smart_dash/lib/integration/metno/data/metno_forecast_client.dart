import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_dash/feature/weather/domain/weather.dart';
import 'package:smart_dash/integration/metno/metno.dart';
import 'package:smart_dash/feature/weather/data/weather_forecast_client.dart';
import 'package:smart_dash/util/data/json.dart';

class MetNoLocationForecastClient extends WeatherForecastClient {
  MetNoLocationForecastClient(Ref ref, Dio api) : super(MetNo.key, ref, api);

  @override
  String getForecastPath(double lat, double lon) {
    return 'complete?lat=${lat.toStringAsPrecision(4)}'
        '&lon=${lon.toStringAsPrecision(4)}';
  }

  @override
  Weather toWeather(JsonObject data) =>
      Weather.fromJson({'service': service, ...data});
}
