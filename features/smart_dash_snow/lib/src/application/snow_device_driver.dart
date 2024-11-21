import 'dart:async';

import 'package:smart_dash_device/smart_dash_device.dart';
import 'package:smart_dash_snow/smart_dash_snow.dart';
import 'package:smart_dash_snow/src/data/snow_device_client.dart';

class SnowDeviceDriver extends ThrottledDeviceDriver {
  SnowDeviceDriver({
    required super.key,
    required super.ref,
    required super.config,
    Duration period = SnowDriver.ttl,
  }) : super(
          trailing: true,
          throttle: period,
        );

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
    return Snow.supportedTypes
        .map((e) => e.toDefinition(Snow.readableModelName[e] ?? e.name))
        .toList();
  }

  @override
  Future<List<Device>> getAllDevices({
    DeviceType type = DeviceType.any,
    Iterable<String> ids = const [],
  }) async {
    final client = newClient();
    final devices = await client.getDevices(ids: ids);
    return devices
        .map((e) => e.toDevice())
        .where((e) => type.isAny || e.type == type)
        .toList();
  }

  @override
  SnowDeviceClient newClient() {
    return SnowDeviceClient(ref.read(snowManagerProvider).get(config));
  }
}
