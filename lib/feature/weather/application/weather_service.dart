import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  Future<Weather> getWeather(double lat, double lon) => guard(() async {
        /*
        final repo = ref.read(WeatherRepositoryProvider);
        final cached = await repo.getPriceHourly(area, when);
        if (cached.isPresent && cached.value.isNotEmpty) {
          return cached.value;
        }
        */
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
        /*
        if (weather.isNotEmpty) {
          await repo.save(area, prices);
        }*/
        cache[key] = weather;

        return weather.data;
      });
}

@Riverpod(keepAlive: true)
WeatherService weatherService(WeatherServiceRef ref) => WeatherService(
      ref,
    );
