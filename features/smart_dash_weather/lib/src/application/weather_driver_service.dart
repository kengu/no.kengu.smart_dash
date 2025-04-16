import 'package:optional/optional.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_device/smart_dash_device.dart';
import 'package:smart_dash_geocoder/smart_dash_geocoder.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';
import 'package:smart_dash_weather/smart_dash_weather.dart';
import 'package:smart_dash_weather/src/application/weather_forecast_driver.dart';
import 'package:smart_dash_weather/src/application/weather_forecast_manager.dart';
import 'package:smart_dash_weather/src/data/weather_response.dart';
import 'package:stream_transform/stream_transform.dart';

part 'weather_driver_service.g.dart';

typedef WeatherStateSelect = WeatherState Function(List<WeatherState>);

/// A [WeatherDriverService] for [WeatherState] lookup from [Driver]s
/// that implements [IntegrationType.weather] integrations.
class WeatherDriverService extends DriverService<WeatherState, WeatherEvent,
    WeatherForecastDriver, WeatherForecastManager> {
  WeatherDriverService(Ref ref)
      : super(
          ref,
          IntegrationType.weather,
          FutureCache(prefix: '$WeatherDriverService'),
        );

  static const Duration ttl = WeatherForecastDriver.ttl;
  static const Duration max = WeatherForecastDriver.max;
  static const Duration period = Duration(seconds: 5);

  DeviceDriverService get _service => ref.read(deviceServiceProvider);

  String _cacheKey(String prefix, double lat, double lon) {
    return '$prefix:$lat:$lon';
  }

  @override
  WeatherForecastManager get manager =>
      ref.read(weatherForecastManagerProvider);

  /// Get [WeatherState] for given [id] from [cache]
  Optional<WeatherState> getNowCached(Identity id) {
    return Optional.ofNullable(
      cache.get<WeatherState>('device:$id').orElseNull,
    );
  }

  /// Get [WeatherState] for given [id]
  Future<Optional<WeatherState>> getNow(
    Identity id, {
    Duration? ttl = const Duration(seconds: 10),
  }) async {
    return cache.getOrFetch(
      'device:$id',
      () async {
        final result = await _service.get(id);
        if (result.isPresent) {
          final device = result.value;
          if (device.capabilities.isWeatherNow) {
            return Optional.of(Weather.toNow(device));
          }
        }
        return const Optional.empty();
      },
      ttl: ttl,
    );
  }

  /// Get all [WeatherState]s
  Future<List<WeatherState>> getNowAll({
    Duration ttl = const Duration(seconds: 10),
  }) async {
    return cache.getOrFetch(
      'device:all',
      () async {
        final devices = await _service.where(
          (e) => e.capabilities.isWeatherNow,
        );
        return devices.map(Weather.toNow).toList();
      },
      ttl: ttl,
    );
  }

  /// Get a stream of actual [WeatherState]s now
  /// periodically pulled from [getNow] for given [id].
  Stream<WeatherState> getNowAsStream(
    Identity id, {
    bool refresh = false,
    Duration period = const Duration(seconds: 10),
  }) async* {
    if (refresh) {
      final next = await getNow(id, ttl: period);
      if (next.isPresent) yield next.value;
    }

    yield* ref
        .read(timingServiceProvider)
        .events
        .throttle(period.clamp(period, max))
        .asyncMap((e) => getNow(id))
        .where((e) => e.isPresent)
        .map((e) => e.value);
  }

  /// Get [WeatherState] forecasts for given [point].
  /// If [select] is not given, first [WeatherState]
  /// in list of [WeatherState] matches from each
  /// [Driver] is selected.
  Future<Optional<WeatherState>> getForecast(
    PointGeometry point, {
    String? service,
    Duration? ttl = ttl,
    WeatherStateSelect? select,
  }) async {
    final states = await getForecasts(point, service: service, ttl: ttl);
    if (states.isNotEmpty) {
      return select != null
          ? Optional.of(select(states))
          : states.first.toOptional;
    }
    return Optional.empty();
  }

  /// Get first cached [WeatherState] forecast for given [point].
  Optional<WeatherState> getForecastCached(PointGeometry point) {
    final states = getForecastsCached(point: point);
    if (states.isPresent) {
      return states.value.firstOptional;
    }
    return Optional.empty();
  }

  /// Get a stream of [WeatherState] forecasts
  /// periodically pulled from [getForecasts] for given [point].
  /// If [select]  is not given, first [WeatherState] in list
  /// of [WeatherState] matches from each [Driver] is selected.
  Stream<WeatherState> getForecastAsStream(
    PointGeometry point, {
    String? service,
    bool refresh = false,
    Duration period = period,
    WeatherStateSelect? select,
  }) {
    return getForecastsAsStream(
      point,
      service: service,
      refresh: refresh,
      period: period,
    ).map((e) => select == null ? e.first : select(e));
  }

  /// Get [WeatherState] forecasts for given [point].
  Future<List<WeatherState>> getForecasts(
    PointGeometry point, {
    String? service,
    Duration? ttl = ttl,
  }) async {
    final key = _cacheKey('forecasts', point.lat, point.lon);
    final result = await cache.getOrFetch<List<WeatherResponse>>(
      key,
      () async {
        final forecasts = <WeatherResponse>[];
        Map<dynamic, dynamic> lastModified = _lastModified(key, service);

        final drivers = manager.drivers.where(
          (e) => service == null || e.key == service,
        );

        for (final driver in drivers) {
          final result = await driver.getForecast(
            point.lat,
            point.lon,
            lastModified[driver.key],
          );
          if (result.isPresent) {
            forecasts.add(result.value);
          }
        }
        return forecasts;
      },
      ttl: ttl?.clamp(ttl, max),
    );
    return result.map((e) => e.data).toList();
  }

  /// Get cached [WeatherState] forecasts for given [point].
  Optional<List<WeatherState>> getForecastsCached({
    PointGeometry? point,
  }) {
    // Get all cached forecasts?
    if (point == null) {
      final states = <WeatherState>[];
      for (final it in cache.results.values) {
        switch (it) {
          case List<WeatherState> _:
            states.addAll(it);
            break;
          case WeatherState _:
            states.add(it);
            break;
        }
      }
      if (states.isEmpty) {
        return const Optional.empty();
      }
      return Optional.of(states);
    }

    final cached = cache.get<List<WeatherResponse>>(
      _cacheKey('forecasts', point.lat, point.lon),
    );
    if (cached.isPresent) {
      return Optional.of(
        cached.value.map((e) => e.data).toList(),
      );
    }
    return const Optional.empty();
  }

  /// Get a stream of [WeatherState]s forecasts
  /// periodically pulled from [getForecasts] for given [point].
  Stream<List<WeatherState>> getForecastsAsStream(
    PointGeometry point, {
    String? service,
    bool refresh = false,
    Duration period = period,
  }) async* {
    if (refresh) {
      final states = await getForecasts(point, service: service);
      if (states.isNotEmpty) {
        yield states;
      }
    }

    yield* ref
        .read(timingServiceProvider)
        .events
        .throttle(period.clamp(ttl, max))
        .asyncMap((e) => getForecasts(point))
        .where((e) => e.isNotEmpty);
  }

  Map<String, DateTime> _lastModified(String key, String? service) {
    final cached = cache.get<List<WeatherResponse>>(key);

    // Get last modified
    return cached.isPresent
        ? Map.fromEntries(
            cached.value
                .where((e) => service == null || service == e.data.service)
                .map((e) => MapEntry(e.data.service, e.lastModified)),
          )
        : <String, DateTime>{};
  }
}

@Riverpod(keepAlive: true)
WeatherDriverService weatherService(Ref ref) {
  return WeatherDriverService(ref);
}
