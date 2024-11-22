import 'dart:async';

import 'package:riverpod/riverpod.dart';
import 'package:smart_dash_device/smart_dash_device.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';
import 'package:smart_dash_weather/smart_dash_weather.dart';
import 'package:smart_dash_weather/src/data/weather_forecast_device_client.dart';

import 'weather_forecast_manager.dart';

class WeatherForecastDeviceDriver extends ThrottledDeviceDriver {
  WeatherForecastDeviceDriver(
    Ref ref,
    String key,
    ServiceConfig config,
  ) : super(
          ref: ref,
          key: key,
          config: config,
          trailing: true,
          throttle: const Duration(seconds: 60),
        );

  final _lastUpdated = <PointGeometry, DateTime>{};

  @override
  Future<List<Device>> onThrottledUpdate(DateTime event) async {
    final paired = await getPairedDevices();
    final updated = paired.isNotEmpty
        ? await getAllDevices(ids: paired.map((e) => e.id))
        : <Device>[];
    return updated;
  }

  @override
  List<DeviceDefinition> getDeviceDefinitions() {
    return [
      DeviceType.weatherForecast.toDefinition(
        Weather.readableModelName[DeviceType.weatherForecast],
      )
    ];
  }

  // TODO: Implement places in configuration
  final _places = [
    const PointGeometry(coords: [8.8168, 60.0802]),
  ];

  Future<List<PointGeometry>> getPlaces() async {
    final service = await ref.read(weatherServiceProvider.future);
    final places = service.getForecastsCached();

    return [
      ..._places,
      if (places.isPresent)
        ...places.value.map(
          (e) => e.geometry,
        )
    ];
  }

  @override
  Future<List<Device>> getAllDevices({
    DeviceType type = DeviceType.any,
    Iterable<String> ids = const [],
  }) async {
    final devices = <Device>[];
    final client = newClient();
    final places = await getPlaces();
    for (final place in places) {
      final when = _lastUpdated[place];
      final result = await client.getDevice(
        place.lat,
        place.lon,
        when,
      );
      if (result.isPresent) {
        final device = result.value;
        _lastUpdated[place] = device.lastUpdated;
        devices.add(result.value.toDevice());
      }
    }
    return devices
        .where((e) => ids.isEmpty || ids.contains(e.id))
        .where((e) => type.isAny || e.type == type)
        .toList();
  }

  @override
  WeatherForecastDeviceClient newClient() {
    return WeatherForecastDeviceClient(
      ref.read(weatherForecastManagerProvider).get(config),
    );
  }
}
