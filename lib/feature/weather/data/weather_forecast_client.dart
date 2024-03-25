import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_dash/feature/weather/domain/weather.dart';
import 'package:smart_dash/util/data/json.dart';
import 'package:smart_dash/util/guard.dart';
import 'package:intl/intl.dart';

import 'weather_response.dart';

abstract class WeatherForecastClient {
  WeatherForecastClient(this.service, this.ref, this.api);
  final Dio api;
  final Ref ref;
  final String service;

  static final df = DateFormat('E, d MMM yyyy hh:mm:ss Z');

  String getForecastPath(double lat, double lon);

  Weather toWeather(JsonObject data);

  // TODO: Handle http errors better
  Future<WeatherResponse> getForecast(double lat, double lon,
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
              debugPrint(
                'Fetching weather forecast from [$service] failed: [$status] $path',
              );
            }
            return success;
          },
        ),
      );
      debugPrint(
        'Fetched weather forecast from [$service]: ${response.realUri}',
      );

      return WeatherResponse(
        data: toWeather(response.data as JsonObject),
        expires: df.parse(
          response.headers.value('expires')!,
        ),
        lastModified: df.parse(
          response.headers.value('last-modified')!,
        ),
      );
    });
  }
}
