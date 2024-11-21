import 'package:riverpod/riverpod.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_weather/smart_dash_weather.dart';
import 'package:smart_dash_weather/src/data/weather_forecast_client.dart';

class MetNoLocationForecastClient extends WeatherForecastClient {
  MetNoLocationForecastClient(Ref ref)
      : super(
          MetNo.key,
          ref,
          WeatherForecastClient.newApi(
            baseUrl: baseUrl,
            headers: {'User-Agent': userAgent},
          ),
        );

  static String userAgent =
      'SmartDash/0.1 github.com/discoos support@discoos.org';
  static String baseUrl = 'https://api.met.no/weatherapi/locationforecast/2.0/';

  @override
  String getForecastPath(double lat, double lon) {
    return 'complete?lat=${lat.toStringAsPrecision(4)}'
        '&lon=${lon.toStringAsPrecision(4)}';
  }

  @override
  WeatherState toForecast(JsonObject data) =>
      WeatherState.fromJson({'service': service, ...data});
}
