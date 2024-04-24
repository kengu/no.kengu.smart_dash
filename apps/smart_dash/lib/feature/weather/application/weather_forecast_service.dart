import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/feature/weather/data/weather_forecast_client.dart';
import 'package:smart_dash/feature/weather/data/weather_response.dart';
import 'package:smart_dash/feature/weather/domain/weather.dart';
import 'package:smart_dash_account/smart_dash_account.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

abstract class WeatherForecastService {
  WeatherForecastService(this.key, this.ref);

  final Ref ref;

  final String key;

  final _cache = FutureCache(prefix: '$WeatherForecastService');

  final StreamController<Weather> _updates = StreamController.broadcast();

  Stream<Weather> get updates => _updates.stream;

  Optional<Weather> getCachedForecast({
    required double lat,
    required double lon,
  }) {
    return Optional.ofNullable(
      _cache.get<WeatherResponse>('forecast:$lat:$lon').orElseNull?.data,
    );
  }

  Future<Optional<Weather>> getForecast({
    required double lat,
    required double lon,
    Duration? ttl,
  }) async {
    final key = 'forecast:$lat:$lon';
    final result =
        await _cache.getOrFetch<Optional<WeatherResponse>>(key, () async {
      final cached = _cache.get<WeatherResponse>(key);
      final config = await _getConfig();
      if (config.isPresent) {
        final client = newClient(config.value);
        final weather = await client.getForecast(
          lat,
          lon,
          cached.orElseNull?.lastModified,
        );
        _updates.add(weather.data);
        return Optional.of(weather);
      }
      return const Optional.empty();
    }, ttl: ttl);
    return result.isPresent
        ? Optional.of(result.value.data)
        : const Optional.empty();
  }

  WeatherForecastClient newClient(ServiceConfig config);

  Future<Optional<ServiceConfig>> _getConfig(
      {Duration ttl = const Duration(seconds: 4)}) async {
    return _cache.getOrFetch('config', () async {
      final home = await ref.read(homeServiceProvider).getCurrentHome();
      if (!home.isPresent) return const Optional.empty();
      return home.value.firstServiceWhere(key);
    }, ttl: ttl);
  }

  static Weather toForecast(String service, JsonObject data) {
    return Weather.fromJson({
      'service': service,
      ...data,
    });
  }
}
