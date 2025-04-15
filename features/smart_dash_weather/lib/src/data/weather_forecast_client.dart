import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';
import 'package:optional/optional.dart';
import 'package:riverpod/riverpod.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_weather/smart_dash_weather.dart';

import 'weather_response.dart';

abstract class WeatherForecastClient {
  WeatherForecastClient(this.service, this.ref, this.api);
  final Dio api;
  final Ref ref;
  final String service;

  final _log = Logger('$WeatherForecastClient');

  static final df = DateFormat('E, d MMM yyyy hh:mm:ss Z');

  static Dio newApi({
    required Map<String, dynamic>? headers,
    required String baseUrl,
  }) {
    return Dio(BaseOptions(
      headers: headers,
      baseUrl: baseUrl,
    ))
      // Process json in the background
      ..transformer = BackgroundTransformer();
  }

  String getForecastPath(double lat, double lon);

  WeatherState toForecast(JsonObject data) {
    return WeatherState.fromJson({
      'service': service,
      ...data,
    });
  }

  // TODO: Handle http errors better
  Future<Optional<WeatherResponse>> getForecast(double lat, double lon,
      [DateTime? lastModified]) async {
    return guard(() async {
      final path = getForecastPath(lat, lon);
      if (lastModified != null) {
        api.options.headers["if-modified-since"] = df.format(lastModified);
      }
      final response = await api.get(
        path,
        options: Options(
          validateStatus: (status) {
            final success = status != null && status < 400;
            if (!success) {
              _log.warning(
                'Fetching weather forecast from [$service] failed: [$status] $path',
              );
            }
            return success;
          },
        ),
      );
      if ((response.statusCode ?? 400) >= 400) {
        return Optional.empty();
      }

      _log.fine(
        'Fetched weather forecast from [$service]: ${response.realUri}',
      );

      return Optional.of(WeatherResponse(
        data: toForecast(response.data as JsonObject),
        expires: df.parse(
          response.headers.value('expires')!,
        ),
        lastModified: df.parse(
          response.headers.value('last-modified')!,
        ),
      ));
    }, onError: check_client_error);
  }

  void close() {
    api.close(force: true);
  }
}
