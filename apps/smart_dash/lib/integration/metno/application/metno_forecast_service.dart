import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/weather/application/weather_forecast_service.dart';
import 'package:smart_dash/feature/weather/data/weather_forecast_client.dart';
import 'package:smart_dash/integration/metno/data/metno_forecast_client.dart';
import 'package:smart_dash/integration/metno/metno.dart';
import 'package:smart_dash_account/smart_dash_account.dart';

part 'metno_forecast_service.g.dart';

class MetNoForecastService extends WeatherForecastService {
  MetNoForecastService(Ref ref) : super(MetNo.key, ref) {
    ref.onDispose(() {
      _api.close(force: true);
    });
  }

  final _api = Dio(BaseOptions(headers: {
    'User-Agent': 'SmartDash/0.1 github.com/discoos support@discoos.org',
  }, baseUrl: 'https://api.met.no/weatherapi/locationforecast/2.0/'))
    // Process json in the background
    ..transformer = BackgroundTransformer();

  @override
  WeatherForecastClient newClient(ServiceConfig config) {
    return MetNoLocationForecastClient(
      ref,
      _api,
    );
  }
}

@Riverpod(keepAlive: true)
MetNoForecastService metNoForecastService(MetNoForecastServiceRef ref) {
  return MetNoForecastService(ref);
}
