import 'package:async/async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/weather/application/weather_forecast_service.dart';
import 'package:smart_dash/feature/weather/domain/weather.dart';
import 'package:stream_transform/stream_transform.dart';

part 'weather_forecast_manager.g.dart';

class WeatherForecastManager {
  WeatherForecastManager(this.ref);

  final Ref ref;

  final _log = Logger('$WeatherForecastManager');

  final Map<String, WeatherForecastService> _services = {};

  /// Check if [WeatherForecastService] for given [ServiceConfig.key] exists
  bool exists(String key) => _services.containsKey(key);

  /// [Weather] should call this to register
  void register(WeatherForecastService service) {
    assert(_services[service.key] == null,
        'Weather service integration [${service.key}] exists already');
    _services[service.key] = service;
    _log.info(
      '${service.runtimeType}[key:${service.key}] registered',
    );
  }

  /// Get [Weather] for given [IntegrationFields.key]
  T getService<T extends WeatherForecastService>(String key) {
    assert(
      exists(key),
      'WeatherService $key not found. '
      'Have you remembered to register it with the WeatherManager?',
    );
    return _services[key] as T;
  }

  Optional<Weather> getFirstCachedForecast({
    required double lat,
    required double lon,
  }) {
    for (final service in _services.values) {
      final cached = service.getCachedForecast(lat: lat, lon: lon);
      if (cached.isPresent) {
        return cached;
      }
    }
    return const Optional.empty();
  }

  Future<Optional<Weather>> getFirstForecast({
    required double lat,
    required double lon,
    Duration? ttl = const Duration(minutes: 5),
  }) async {
    for (final service in _services.values) {
      final result = await service.getForecast(
        lat: lat,
        lon: lon,
        ttl: ttl,
      );
      if (result.isPresent) {
        return result;
      }
    }
    return const Optional.empty();
  }

  Stream<Weather> getFirstForecastAsStream({
    required double lat,
    required double lon,
    String? service,
    bool refresh = false,
    Duration period = const Duration(minutes: 5),
  }) async* {
    if (refresh) {
      final next = await getFirstForecast(lat: lat, lon: lon);
      if (next.isPresent) yield next.value;
    }

    final stream = StreamGroup.merge(
      _services.values.map((e) => e.updates
          .where((e) => e.geometry.lat == lat && e.geometry.lon == lon)
          .throttle(period)),
    );

    await for (final weather in stream) {
      yield weather;
    }
  }

  Future<List<Weather>> getForecasts({
    required double lat,
    required double lon,
    Duration? ttl = const Duration(minutes: 5),
  }) async {
    final forecasts = <Weather>[];
    for (final service in _services.values) {
      final result = await service.getForecast(
        lat: lat,
        lon: lon,
        ttl: ttl,
      );
      if (result.isPresent) {
        forecasts.add(result.value);
      }
    }
    return forecasts;
  }
}

@Riverpod(keepAlive: true)
WeatherForecastManager weatherForecastManager(WeatherForecastManagerRef ref) =>
    WeatherForecastManager(ref);
