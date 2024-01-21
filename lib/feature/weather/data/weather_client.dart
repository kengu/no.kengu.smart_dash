import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/util/guard.dart';
import 'package:intl/intl.dart';

import 'weather_response.dart';

class WeatherClient {
  WeatherClient(this.ref, this.api);
  final Dio api;
  final Ref ref;

  static final df = DateFormat('E, d MMM yyyy hh:mm:ss Z');

  Future<WeatherResponse> getForecast(double lat, double lon,
      [DateTime? lastModified]) async {
    return guard(() async {
      final path = 'complete?lat=${lat.toStringAsPrecision(4)}'
          '&lon=${lon.toStringAsPrecision(4)}';
      if (lastModified != null) {
        api.options.headers["if-modified-since"] = df.format(lastModified);
      }
      final response = await api.get(path);
      debugPrint('Fetched weather forecast: ${response.realUri}');
      return WeatherResponse.fromJson({
        'data': response.data,
        'expires': df
            .parse(
              response.headers.value('expires')!,
            )
            .toIso8601String(),
        'last_modified': df
            .parse(
              response.headers.value('last-modified')!,
            )
            .toIso8601String(),
      });
    });
  }
}

@riverpod
final weatherClientProvider = Provider(
  (ref) => WeatherClient(
    ref,
    Dio(BaseOptions(headers: {
      'User-Agent': 'SmartDash/0.1 github.com/discoos support@discoos.org',
    }, baseUrl: 'https://api.met.no/weatherapi/locationforecast/2.0/'))
      // Process json in the background
      ..transformer = BackgroundTransformer(),
  ),
);
