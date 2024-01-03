import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/weather/data/weather_client.dart';
import 'package:smart_dash/feature/weather/data/weather_response.dart';
import 'package:smart_dash/feature/weather/domain/weather.dart';
import 'package:smart_dash/util/guard.dart';

part 'weather_service.g.dart';

class WeatherService {
  WeatherService(this.ref);

  final Ref ref;

  final Map<String, WeatherResponse> cache = {};

  Optional<(DateTime, Future<Weather>)> _request = const Optional.empty();

  Optional<Weather> getCachedWeather(double lat, double lon) {
    return Optional.ofNullable(cache['$lat:$lon']?.data);
  }

  Future<Weather> getWeather(double lat, double lon, Duration period) {
    if (_request.isEmpty ||
        DateTime.now().difference(_request.value.$1) > period) {
      final future = guard(() async {
        final key = '$lat:$lon';
        final cached = cache[key];
        if (cached?.isExpired == false) {
          return cache[key]!.data;
        }

        final client = ref.read(weatherClientProvider);
        final weather = await client.getForecast(
          lat,
          lon,
          cached?.lastModified,
        );
        cache[key] = weather;

        return weather.data;
      });
      ;

      _request = Optional.of(
        (
          DateTime.now(),
          future,
        ),
      );
    }
    return _request.value.$2;
  }
}

@Riverpod(keepAlive: true)
WeatherService weatherService(WeatherServiceRef ref) => WeatherService(
      ref,
    );
