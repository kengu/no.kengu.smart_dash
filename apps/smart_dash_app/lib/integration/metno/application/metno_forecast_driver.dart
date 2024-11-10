// ignore_for_file: unused_import

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_app/feature/device/application/device_driver.dart';
import 'package:smart_dash_app/feature/device/domain/device.dart';
import 'package:smart_dash_app/feature/device/domain/device_definition.dart';
import 'package:smart_dash_app/feature/weather/application/weather_forecast_manager.dart';
import 'package:smart_dash_app/feature/weather/domain/weather.dart';
import 'package:smart_dash_app/integration/metno/domain/metno_forecast_device.dart';
import 'package:smart_dash_app/integration/metno/metno.dart';
import 'package:smart_dash_app/util/platform.dart';

part 'metno_forecast_driver.g.dart';

class MetNoForecastDriver extends ThrottledDeviceDriver {
  MetNoForecastDriver(Ref ref)
      : super(
          MetNo.key,
          ref,
          trailing: true,
          throttle: Duration(
            // TODO Make throttle configurable
            seconds: Platform.isDesktop ? 5 : 30,
          ),
        );

  // TODO: Implement places in integration
  final _places = [
    const PointGeometry(coords: [8.8168, 60.0802]),
  ];

  final _log = Logger('$MetNoForecastDriver');

  @override
  Future<List<Device>> onThrottledUpdate(DateTime event) async {
    _log.fine(
      '$MetNo throttled updates for '
      '${event.difference(lastEvent.last).inSeconds} sec.',
    );
    final paired = await getPairedDevices();
    final updated = paired.isNotEmpty
        ? await getAllDevices(ids: paired.map((e) => e.id))
        : <Device>[];
    return updated;
  }

  @override
  Future<List<DeviceDefinition>> getDeviceDefinitions() {
    return Future.value(
      MetNo.supportedTypes
          .map((e) => e.toDefinition(MetNo.readableModelName[e] ?? e.name))
          .toList(),
    );
  }

  @override
  Future<List<Device>> getAllDevices({
    DeviceType type = DeviceType.any,
    Iterable<String> ids = const [],
  }) async {
    final devices = <MetNoForecastDevice>[];
    final manager = ref.read(weatherForecastManagerProvider);
    for (final place in _places) {
      final result = await manager.getForecasts(lat: place.lat, lon: place.lon);
      for (final forecast in result) {
        devices.add(MetNoForecastDevice(state: forecast));
      }
    }
    return devices
        .map((e) => e.toDevice())
        .where((e) => ids.isEmpty || ids.contains(e.id))
        .where((e) => type.isAny || e.type == type)
        .toList();
  }
}

@Riverpod(keepAlive: true)
MetNoForecastDriver metNoForecastDriver(MetNoForecastDriverRef ref) =>
    MetNoForecastDriver(ref);
