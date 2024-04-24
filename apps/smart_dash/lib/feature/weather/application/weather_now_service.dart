import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/device/application/device_service.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/feature/weather/domain/weather.dart';
import 'package:smart_dash/util/future.dart';
import 'package:stream_transform/stream_transform.dart';

part 'weather_now_service.g.dart';

class WeatherNowService {
  WeatherNowService(this.ref);

  final Ref ref;

  static const String key = 'weather_now';

  static const supportedTypes = [
    DeviceType.sensor,
  ];

  static const readableModelName = {
    DeviceType.sensor: 'Sensor',
  };

  final _cache = FutureCache(prefix: '$WeatherNowService');

  final StreamController<List<Weather>> _updates = StreamController.broadcast();

  Stream<List<Weather>> get updates => _updates.stream;

  Optional<Weather> getCachedNow(Identity id) {
    return Optional.ofNullable(
      _cache.get<Weather>('device:$id').orElseNull,
    );
  }

  Future<Optional<Weather>> getNow(Identity id, {Duration? ttl}) async {
    final key = 'device:$id';
    return _cache.getOrFetch(key, () async {
      final result = await ref.read(deviceServiceProvider).get(id);
      if (result.isPresent) {
        final device = result.value;
        if (device.capabilities.isWeatherNow) {
          return Optional.of(toNow(device));
        }
      }
      return const Optional.empty();
    }, ttl: ttl);
  }

  Stream<Weather> getNowAsStream(
    Identity id, {
    bool refresh = false,
    Duration period = const Duration(seconds: 10),
  }) async* {
    if (refresh) {
      final next = await getNow(id);
      if (next.isPresent) yield next.value;
    }

    await for (final e in ref
        .read(deviceServiceProvider)
        .devices
        .throttle(period)
        .where((e) => e.device.capabilities.isWeatherNow)
        .where((e) => Identity.of(e.device) == id)) {
      final weather = toNow(e.device);
      _cache.set<Weather>(
        'device:$id',
        Optional.of(weather),
      );
      yield weather;
    }
  }

  Future<List<Weather>> getAllNow({
    Duration ttl = const Duration(seconds: 10),
  }) async {
    return _cache.getOrFetch('device:all', () async {
      final devices = await ref
          .read(deviceServiceProvider)
          .where((e) => e.capabilities.isWeatherNow);
      return devices.map(toNow).toList();
    }, ttl: ttl);
  }

  static Weather toNow(Device device) {
    return Weather(
      service: device.service,
      observedBy: Identity.of(device),
      geometry: const PointGeometry(coords: []),
      props: WeatherProperties(
        timeseries: [
          WeatherTimeStep(
            time: device.lastUpdated,
            data: WeatherData(
              instant: WeatherInstant(
                details: WeatherInstantDetails(
                  windSpeed: device.windSpeed,
                  lightLuminance: device.luminance,
                  relativeHumidity: device.humidity,
                  windSpeedOfGust: device.gustSpeed,
                  airTemperature: device.temperature,
                  windFromDirection: device.windAngle,
                  precipitationAmount: device.rainTotal,
                  ultravioletRadiation: device.ultraviolet,
                ),
              ),
            ),
          ),
        ],
        meta: WeatherMeta(
          units: WeatherUnits(
            windSpeed: TokenUnit.windSpeed.symbol,
            precipitationAmount: TokenUnit.rain.symbol,
            lightLuminance: TokenUnit.luminance.symbol,
            relativeHumidity: TokenUnit.humidity.symbol,
            windSpeedOfGust: TokenUnit.gustSpeed.symbol,
            airTemperature: TokenUnit.temperature.symbol,
            windFromDirection: TokenUnit.windAngle.symbol,
            ultravioletRadiation: TokenUnit.ultraviolet.symbol,
          ),
          updatedAt: device.lastUpdated,
        ),
      ),
    );
  }
}

@Riverpod(keepAlive: true)
WeatherNowService weatherNowService(WeatherNowServiceRef ref) =>
    WeatherNowService(ref);
