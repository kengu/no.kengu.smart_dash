import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/device/application/device_driver.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/feature/device/domain/device_definition.dart';
import 'package:smart_dash/integration/mqtt/application/mqtt_service.dart';
import 'package:smart_dash/integration/rtl_433/domain/rtl_433_device.dart';
import 'package:smart_dash/integration/rtl_433/rtl_433.dart';
import 'package:smart_dash/util/guard.dart';
import 'package:smart_dash/util/platform.dart';

part 'rtl_433_driver.g.dart';

class Rtl433Driver extends ThrottledDeviceDriver {
  Rtl433Driver(Ref ref)
      : super(
          Rtl433.key,
          ref,
          trailing: true,
          throttle: Duration(
            // TODO Make throttle configurable
            seconds: Platform.isDesktop ? 5 : 30,
          ),
        );

  final List<StreamSubscription> _subscriptions = [];
  final Map<(Object, String), Rtl433Device> _devices = {};

  @override
  String get key => Rtl433.key;

  @override
  Future<void> onInit(Completer<void> completer) async {
    return guard(
      () async {
        _subscriptions.add(ref.read(mqttServiceProvider).updates.listen((e) {
          /// TODO: Make rtl_433 format matching more robust...
          if (e.payload.startsWith('{"time"')) {
            final device = Rtl433Device.fromJson(jsonDecode(e.payload));
            _devices[(device.id, device.model)] = device;
          }
        }));
        return super.onInit(completer);
      },
      task: 'onInit',
      name: '$Rtl433Driver',
    );
  }

  @override
  Future<void> onUnInit() async {
    for (final it in _subscriptions) {
      await it.cancel();
    }
    return super.onUnInit();
  }

  @override
  Future<List<Device>> onThrottledUpdate(DateTime event) async {
    debugPrint(
      'Rtl433 throttled updates for '
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
    return Future.value(
      Rtl433.supportedTypes.map((e) => e.toDefinition()).toList(),
    );
  }

  @override
  Future<List<Device>> getAllDevices({
    DeviceType type = DeviceType.any,
    Iterable<String> ids = const [],
  }) {
    final found = _devices.values
        .map((e) => e.toDevice())
        .where((e) => ids.contains(e.id) || type.isAny || e.type == type)
        .toList();
    return Future.value(found);
  }
}

@Riverpod(keepAlive: true)
Rtl433Driver rtl433Driver(Rtl433DriverRef ref) => Rtl433Driver(ref);
