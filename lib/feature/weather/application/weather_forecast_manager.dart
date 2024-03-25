import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/account/domain/service_config.dart';
import 'package:smart_dash/feature/system/application/timing_service.dart';
import 'package:smart_dash/feature/weather/application/weather_forecast_service.dart';
import 'package:smart_dash/feature/weather/domain/weather.dart';
import 'package:smart_dash/integration/domain/integration.dart';
import 'package:stream_transform/stream_transform.dart';

part 'weather_forecast_manager.g.dart';

class WeatherForecastManager {
  WeatherForecastManager(this.ref);

  final Ref ref;

  final Map<String, WeatherForecastService> _services = {};

  /// Check if [WeatherForecastService] for given [ServiceConfig.key] exists
  bool exists(String key) => _services.containsKey(key);

  /// [Weather] should call this to register
  void register(WeatherForecastService service) {
    assert(_services[service.key] == null,
        'Weather service integration [${service.key}] exists already');
    _services[service.key] = service;
    debugPrint('$WeatherForecastManager: '
        '${service.runtimeType}[key:${service.key}] registered');
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

  Optional<Weather> getFirstCachedForecast(double lat, double lon) {
    for (final service in _services.values) {
      final cached = service.getCachedForecast(lat, lon);
      if (cached.isPresent) {
        return cached;
      }
    }
    return const Optional.empty();
  }

  Future<Optional<Weather>> getFirstForecast(double lat, double lon,
      {Duration? ttl = const Duration(minutes: 5)}) async {
    for (final service in _services.values) {
      final result = await service.getForecast(lat, lon, ttl: ttl);
      if (result.isPresent) {
        return result;
      }
    }
    return const Optional.empty();
  }

  Stream<Weather> getFirstForecastAsStream(double lat, double lon,
      {String? service, Duration period = const Duration(minutes: 5)}) {
    return ref
        .read(timingServiceProvider)
        .events
        .throttle(period)
        .asyncMap((_) => getFirstForecast(lat, lon, ttl: period))
        .map((e) => e.value);
  }

  List<Weather> getCachedForecasts(double lat, double lon) {
    final forecasts = <Weather>[];
    for (final service in _services.values) {
      final cached = service.getCachedForecast(lat, lon);
      if (cached.isPresent) {
        forecasts.add(cached.value);
      }
    }
    return forecasts;
  }

  Future<List<Weather>> getForecasts(double lat, double lon,
      {Duration? ttl = const Duration(minutes: 5)}) async {
    final forecasts = <Weather>[];
    for (final service in _services.values) {
      final result = await service.getForecast(lat, lon, ttl: ttl);
      if (result.isPresent) {
        forecasts.add(result.value);
      }
    }
    return forecasts;
  }

  Stream<List<Weather>> getForecastsAsStream(double lat, double lon,
      {String? service, Duration ttl = const Duration(minutes: 5)}) {
    return ref
        .read(timingServiceProvider)
        .events
        .throttle(ttl)
        .asyncMap((_) => getForecasts(lat, lon, ttl: ttl));
  }
}

@Riverpod(keepAlive: true)
WeatherForecastManager weatherForecastManager(WeatherForecastManagerRef ref) =>
    WeatherForecastManager(ref);
