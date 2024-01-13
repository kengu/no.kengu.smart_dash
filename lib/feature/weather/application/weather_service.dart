import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/weather/data/weather_client.dart';
import 'package:smart_dash/feature/weather/data/weather_response.dart';
import 'package:smart_dash/feature/weather/domain/weather.dart';
import 'package:smart_dash/util/future.dart';

part 'weather_service.g.dart';

class WeatherService {
  WeatherService(this.ref);

  final Ref ref;

  final _cache = FutureCache(prefix: '$WeatherService');

  Optional<Weather> getCachedWeather(double lat, double lon) {
    return Optional.ofNullable(
      _cache.get<WeatherResponse>('$lat:$lon').orElseNull?.data,
    );
  }

  Future<Weather> getWeather(double lat, double lon, Duration period) async {
    final key = '$lat:$lon';
    final response = await _cache.getOrFetch(key, () async {
      final cached = _cache.get<WeatherResponse>(key);
      final client = ref.read(weatherClientProvider);
      final weather = await client.getForecast(
        lat,
        lon,
        cached.orElseNull?.lastModified,
      );
      return weather;
    }, ttl: period);
    return response.data;
  }
}

@Riverpod(keepAlive: true)
WeatherService weatherService(WeatherServiceRef ref) => WeatherService(
      ref,
    );
