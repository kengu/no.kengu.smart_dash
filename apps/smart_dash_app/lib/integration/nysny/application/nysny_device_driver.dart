// ignore_for_file: unused_import

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_app/feature/device/application/device_driver.dart';
import 'package:smart_dash_app/feature/device/domain/device.dart';
import 'package:smart_dash_app/feature/device/domain/device_definition.dart';
import 'package:smart_dash_app/feature/device/domain/driver.dart';
import 'package:smart_dash_app/integration/nysny/domain/nysny_device.dart';
import 'package:smart_dash_app/integration/nysny/nysny.dart';
import 'package:smart_dash_app/util/platform.dart';
import 'package:smart_dash_snow/smart_dash_snow.dart';

part 'nysny_device_driver.g.dart';

class NySnyDeviceDriver extends ThrottledDeviceDriver {
  NySnyDeviceDriver(Ref ref)
      : super(
          NySny.key,
          ref,
          trailing: true,
          throttle: Duration(
            // TODO Make throttle configurable
            seconds: Platform.isDesktop ? 5 : 30,
          ),
        );

  final _log = Logger('$NySnyDeviceDriver');

  @override
  Future<List<Device>> onThrottledUpdate(DateTime event) async {
    _log.fine(
      '$NySny throttled updates for '
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
      NySny.supportedTypes
          .map((e) => e.toDefinition(NySny.readableModelName[e] ?? e.name))
          .toList(),
    );
  }

  @override
  Future<List<Device>> getAllDevices({
    DeviceType type = DeviceType.any,
    Iterable<String> ids = const [],
  }) async {
    final devices = <NySnyDevice>[];
    for (final states in await ref.read(snowServiceProvider).getStates()) {
      for (final state in states) {
        devices.add(NySnyDevice(state: state));
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
NySnyDeviceDriver nySnyDeviceDriver(NySnyDeviceDriverRef ref) =>
    NySnyDeviceDriver(ref);
