import 'package:async/async.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_account/smart_dash_account_app.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_device/smart_dash_device.dart';
import 'package:smart_dash_weather/smart_dash_weather.dart';
import 'package:smart_dash_weather/src/application/weather_forecast_device_driver.dart';
import 'package:smart_dash_weather/src/application/weather_forecast_manager.dart';
import 'package:smart_dash_weather/src/data/weather_response.dart';
import 'package:smart_dash_weather/src/integration/metno/application/metno_forecast_driver.dart';
import 'package:stream_transform/stream_transform.dart';

part 'weather_service.g.dart';

@Riverpod(keepAlive: true)
class WeatherService extends _$WeatherService {
  @override
  Future<WeatherService> build() async {
    final home = await ref.read(getCurrentHomeProvider().future);

    // Register SnowState integrations
    _weatherManager.register(
      MetNo.key,
      (config) => MetNoForecastDriver(ref, config),
    );
    await _weatherManager.build(home.value.serviceWhere);

    // Register snow device driver for each integration
    _deviceManager.register(
      MetNo.key,
      (config) => WeatherForecastDeviceDriver(
        ref,
        MetNo.key,
        config,
      ),
    );
    await _deviceManager.build(home.value.serviceWhere);

    return this;
  }

  WeatherForecastManager get _weatherManager =>
      ref.read(weatherForecastManagerProvider);

  DeviceDriverManager get _deviceManager =>
      ref.read(deviceDriverManagerProvider);

  DeviceService get _service => ref.read(deviceServiceProvider);

  final _cache = FutureCache(prefix: '$WeatherService');
  String _cacheKey(String prefix, double lat, double lon) {
    return '$prefix:$lat:$lon';
  }

  Stream<WeatherState> get forecasts {
    return _weatherManager.events.whereType<WeatherEvent>().map((e) => e.data);
  }

  Optional<WeatherState> getCachedNow(Identity id) {
    return Optional.ofNullable(
      _cache.get<WeatherState>('device:$id').orElseNull,
    );
  }

  Future<Optional<WeatherState>> getNow(Identity id, {Duration? ttl}) async {
    return _cache.getOrFetch(
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

  Stream<WeatherState> getNowAsStream(
    Identity id, {
    bool refresh = false,
    Duration period = const Duration(seconds: 10),
  }) async* {
    if (refresh) {
      final next = await getNow(id);
      if (next.isPresent) yield next.value;
    }

    await for (final e in _service.devices
        .throttle(period)
        .where((e) => e.device.capabilities.isWeatherNow)
        .where((e) => Identity.of(e.device) == id)) {
      final weather = Weather.toNow(e.device);
      _cache.set<WeatherState>(
        'device:$id',
        Optional.of(weather),
      );
      yield weather;
    }
  }

  Future<List<WeatherState>> getAllNow({
    Duration ttl = const Duration(seconds: 10),
  }) async {
    return _cache.getOrFetch(
      'device:all',
      () async {
        final devices =
            await _service.where((e) => e.capabilities.isWeatherNow);
        return devices.map(Weather.toNow).toList();
      },
      ttl: ttl,
    );
  }

  Future<List<WeatherState>> getForecasts({
    required PointGeometry place,
    Duration? ttl,
  }) async {
    final key = _cacheKey('forecasts', place.lat, place.lon);
    final result = await _cache.getOrFetch<List<WeatherResponse>>(
      key,
      () async {
        final forecasts = <WeatherResponse>[];
        final cached = _cache.get<List<WeatherResponse>>(key);
        final requests = cached.isPresent
            ? cached.value.map((e) => (e.data.service, e.lastModified)).toList()
            : [];

        if (requests.isEmpty) {
          for (final driver in _weatherManager.drivers) {
            final result = await driver.getForecast(place.lat, place.lon);
            if (result.isPresent) {
              forecasts.add(result.value);
            }
          }
          return forecasts;
        }

        for (final (key, lastModified) in requests) {
          final driver = _weatherManager.getDriver(key);
          final result = await driver.getForecast(
            place.lat,
            place.lon,
            lastModified,
          );
          if (result.isPresent) {
            forecasts.add(result.value);
          }
        }
        return forecasts;
      },
      ttl: ttl?.clamp(
        ttl,
        const Duration(days: 1),
      ),
    );
    return result.map((e) => e.data).toList();
  }

  Optional<List<WeatherState>> getCachedForecasts({
    PointGeometry? place,
  }) {
    // Get all cached forecasts?
    if (place == null) {
      final states = <WeatherState>[];
      for (final it in _cache.results.values) {
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

    final cached = _cache.get<List<WeatherResponse>>(
      _cacheKey('forecasts', place.lat, place.lon),
    );
    if (cached.isPresent) {
      return Optional.of(
        cached.value.map((e) => e.data).toList(),
      );
    }
    return const Optional.empty();
  }

  Stream<WeatherState> getForecastAsStream({
    required PointGeometry place,
    String? service,
    bool refresh = false,
    Duration period = const Duration(minutes: 5),
  }) async* {
    if (refresh) {
      for (final weather in await getForecasts(place: place)) {
        yield weather;
      }
    }

    final stream = StreamGroup.merge(
      _weatherManager.drivers.map((e) => e.events
          .whereType<WeatherEvent>()
          .map((e) => e.data)
          .where(
              (e) => e.geometry.lat == place.lat && e.geometry.lon == place.lon)
          .throttle(period)),
    );

    await for (final weather in stream) {
      yield weather;
    }
  }

  Optional<WeatherState> getCachedForecast({
    required double lat,
    required double lon,
  }) {
    return Optional.ofNullable(
      _cache.get<WeatherResponse>('forecast:$lat:$lon').orElseNull?.data,
    );
  }
}
