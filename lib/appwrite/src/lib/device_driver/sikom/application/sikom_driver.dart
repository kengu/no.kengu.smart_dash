import 'dart:async';

import 'package:smart_dash_backend/device_driver/application/device_driver.dart';
import 'package:smart_dash_backend/device_driver/domain/device.dart';
import 'package:smart_dash_backend/device_driver/domain/device_definition.dart';
import 'package:smart_dash_backend/device_driver/sikom/data/sikom_client.dart';
import 'package:smart_dash_backend/device_driver/sikom/domain/sikom_device.dart';
import 'package:smart_dash_backend/device_driver/sikom/domain/sikom_gateway.dart';
import 'package:smart_dash_backend/device_driver/sikom/sikom.dart';

class SikomDriver extends DeviceDriver {
  SikomDriver(this.client, super.repo);

  final SikomClient client;

  @override
  String get key => Sikom.key;

  @override
  Future<List<DeviceDefinition>> getDeviceDefinitions() async {
    final devices = await client.getSikomDevices();
    return devices.isPresent
        ? devices.value
            .where((e) => Sikom.supportedTypes.contains(e.type))
            .map((e) => DeviceDefinition(
                  type: e.type,
                  name: _readableName(e),
                ))
            .toSet()
            .toList()
        : <DeviceDefinition>[];
  }

  String _readableName(SikomDevice e) =>
      Sikom.readableModelName[e.type] ?? e.model;

  @override
  Future<List<Device>> getAllDevices({
    String? type,
    Iterable<String> ids = const [],
  }) async {
    final devices = <Device>[];
    final gateways = await client.getGateways();
    if (gateways.isPresent) {
      for (SikomGateway gateway in gateways.value) {
        final result = await client.getDevices(
          gateway,
          ids: ids,
          type: type,
        );
        if (result.isPresent) {
          devices.addAll(result.value.map(
            (e) => e.toDevice(),
          ));
        }
      }
    }
    return devices;
  }
}
