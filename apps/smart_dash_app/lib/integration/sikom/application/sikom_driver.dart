// ignore_for_file: unused_import

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_app/feature/device/application/device_driver.dart';
import 'package:smart_dash_app/feature/device/domain/device.dart';
import 'package:smart_dash_app/feature/device/domain/device_definition.dart';
import 'package:smart_dash_app/integration/sikom/data/sikom_client.dart';
import 'package:smart_dash_app/integration/sikom/domain/sikom_device.dart';
import 'package:smart_dash_app/integration/sikom/domain/sikom_gateway.dart';
import 'package:smart_dash_app/integration/sikom/domain/sikom_property.dart';
import 'package:smart_dash_app/integration/sikom/sikom.dart';
import 'package:smart_dash_app/util/platform.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

part 'sikom_driver.g.dart';

class SikomDriver extends ThrottledDeviceDriver {
  SikomDriver(Ref ref)
      : super(
          Sikom.key,
          ref,
          trailing: true,
          throttle: Duration(
            // TODO Make throttle configurable
            seconds: Platform.isDesktop ? 5 : 30,
          ),
        );

  final _log = Logger('$SikomDriver');

  @override
  Future<List<Device>> onThrottledUpdate(DateTime event) async {
    _log.fine(
      '$Sikom throttled updates for '
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
      Sikom.supportedTypes.map((e) => e.toDefinition()).toList(),
    );
  }

  Future<Optional<List<SikomGateway>>> getGateways() async {
    return guard(() async {
      final client = ref.read(sikomClientProvider);
      return client.getGateways();
    });
  }

  @override
  Future<List<Device>> getAllDevices({
    DeviceType type = DeviceType.any,
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
            type: SikomDeviceType.fromDeviceType(type),
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

  @override
  Future<bool> updateDevice(Device device) async {
    return guard(() async {
      final applied = <SikomProperty>{};
      final client = ref.read(sikomClientProvider);
      final devices = await client.getAllDevices(ids: [device.id]);
      if (devices.isPresent) {
        final current = devices.value.first;
        final diff = current.diff(device);
        for (final it in diff) {
          final result = await client.setDeviceProperty(device.id, it);
          if (result.isPresent) applied.add(it);
        }
        return applied.length == diff.length;
      }
      return false;
    });
  }
}

@Riverpod(keepAlive: true)
SikomDriver sikomDriver(SikomDriverRef ref) => SikomDriver(ref);
