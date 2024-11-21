import 'package:riverpod/riverpod.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';
import 'package:smart_dash_weather/smart_dash_weather.dart';
import 'package:smart_dash_weather/src/application/weather_forecast_driver.dart';
import 'package:smart_dash_weather/src/data/weather_forecast_client.dart';
import 'package:smart_dash_weather/src/integration/metno/data/metno_forecast_client.dart';

class MetNoForecastDriver extends WeatherForecastDriver {
  MetNoForecastDriver(Ref ref, ServiceConfig config)
      : super(
          key: MetNo.key,
          ref: ref,
          config: config,
        );

  @override
  WeatherForecastClient newClient() {
    return MetNoLocationForecastClient(ref);
  }
}
