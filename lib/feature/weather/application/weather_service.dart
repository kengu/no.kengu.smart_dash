import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/device/application/device_service.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/feature/system/application/timing_service.dart';
import 'package:smart_dash/feature/weather/data/weather_client.dart';
import 'package:smart_dash/feature/weather/data/weather_response.dart';
import 'package:smart_dash/feature/weather/domain/weather.dart';
import 'package:smart_dash/util/future.dart';
import 'package:stream_transform/stream_transform.dart';

part 'weather_service.g.dart';

class WeatherService {
  WeatherService(this.ref);

  final Ref ref;

  final _cache = FutureCache(prefix: '$WeatherService');

  Optional<Weather> getCachedNow(Identity id) {
    return Optional.ofNullable(
      _cache.get<Weather>('device:$id').orElseNull,
    );
  }

  Stream<Weather> getNowAsStream(Identity id,
      [Duration period = const Duration(seconds: 10)]) async* {
    await for (final e in ref
        .read(deviceServiceProvider)
        .stream
        .throttle(period)
        .where((e) => Identity.of(e.device) == id)) {
      yield _toWeatherNow(e.device);
    }
  }

  Future<Optional<Weather>> getNow(Identity id, Duration period) async {
    final key = 'device:$id';
    return _cache.getOrFetch(key, () async {
      final result = await ref.read(deviceServiceProvider).get(id);
      if (result.isPresent) {
        final device = result.value;
        return Optional.of(_toWeatherNow(device));
      }
      return const Optional.empty();
    }, ttl: period);
  }

  Weather _toWeatherNow(Device device) {
    return Weather(
      geometry: const PointGeometry(coords: []),
      props: WeatherProperties(
        meta: WeatherMeta(
          units: WeatherUnits(
            airTemperature: TokenUnit.temperature.symbol,
            windFromDirection: TokenUnit.windAngle.symbol,
            windSpeed: TokenUnit.windSpeed.symbol,
            windSpeedOfGust: TokenUnit.gustSpeed.symbol,
            precipitationAmount: TokenUnit.rain.symbol,
            relativeHumidity: TokenUnit.humidity.symbol,
          ),
          updatedAt: device.lastUpdated,
        ),
        timeseries: [
          WeatherTimeStep(
            time: device.lastUpdated,
            data: WeatherData(
              instant: WeatherInstant(
                details: WeatherInstantDetails(
                  windSpeed: device.windSpeed,
                  windSpeedOfGust: device.gustSpeed,
                  airTemperature: device.temperature,
                  windFromDirection: device.windAngle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Optional<Weather> getCachedForecast(double lat, double lon) {
    return Optional.ofNullable(
      _cache.get<WeatherResponse>('forecast:$lat:$lon').orElseNull?.data,
    );
  }

  Stream<Weather> getForecastAsStream(double lat, double lon,
      [Duration period = const Duration(minutes: 5)]) {
    return ref
        .read(timingServiceProvider)
        .events
        .throttle(period)
        .asyncMap((_) => getForecast(lat, lon, period));
  }

  Future<Weather> getForecast(double lat, double lon, Duration period) async {
    final key = 'forecast:$lat:$lon';
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
