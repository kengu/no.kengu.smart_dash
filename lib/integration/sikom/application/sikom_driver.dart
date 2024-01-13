import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/device/application/device_driver.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/feature/device/domain/device_definition.dart';
import 'package:smart_dash/feature/flow/application/flow_manager.dart';
import 'package:smart_dash/integration/sikom/application/sikom_driver_flows.dart';
import 'package:smart_dash/integration/sikom/data/sikom_client.dart';
import 'package:smart_dash/integration/sikom/domain/sikom_device.dart';
import 'package:smart_dash/integration/sikom/domain/sikom_gateway.dart';
import 'package:smart_dash/integration/sikom/sikom.dart';
import 'package:smart_dash/util/guard.dart';

part 'sikom_driver.g.dart';

class SikomDriver extends ThrottledDeviceDriver {
  SikomDriver(super.ref)
      : super(
          trailing: true,
          throttle: const Duration(seconds: 5),
        );

  @override
  String get key => Sikom.key;

  @override
  void onRegisterFlows(FlowManager manager) {
    manager.register(SikomPowerFlow());
    manager.register(SikomEnergyFlow());
    manager.register(SikomVoltageFlow());
  }

  @override
  Future<List<Device>> onThrottledUpdate(DateTime event) async {
    debugPrint(
      'Sikom throttled updates for '
      '${event.difference(lastUpdated.last).inSeconds} sec.',
    );
    final paired = await getPairedDevices();

    final updated = paired.isNotEmpty
        ? await getAllDevices(ids: paired.map((e) => e.id))
        : <Device>[];
    return updated;
  }

  @override
  Future<List<DeviceDefinition>> getDeviceDefinitions() {
    return guard(() async {
      final client = ref.read(sikomClientProvider);
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
    });
  }

  String _readableName(SikomDevice e) =>
      Sikom.readableModelName[e.type] ?? e.model;

  Future<Optional<List<SikomGateway>>> getGateways() async {
    return guard(() async {
      final client = ref.read(sikomClientProvider);
      return client.getGateways();
    });
  }

  @override
  Future<List<Device>> getAllDevices({
    String? type,
    Iterable<String> ids = const [],
  }) async {
    return guard(() async {
      final devices = <Device>[];
      final client = ref.read(sikomClientProvider);
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
    });
  }
}

@Riverpod(keepAlive: true)
SikomDriver sikomDriver(SikomDriverRef ref) => SikomDriver(ref);