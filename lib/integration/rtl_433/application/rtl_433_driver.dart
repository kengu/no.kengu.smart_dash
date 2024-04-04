import 'dart:async';
import 'dart:convert';

// ignore: unused_import
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/device/application/device_driver.dart';
import 'package:smart_dash/feature/device/application/device_service.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/feature/device/domain/device_definition.dart';
import 'package:smart_dash/integration/mqtt/application/mqtt_service.dart';
import 'package:smart_dash/integration/mqtt/domain/mqtt_message.dart';
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

  final _log = Logger('$Rtl433Driver');

  final Map<Identity, Device> _devices = {};

  final List<StreamSubscription> _subscriptions = [];

  @override
  Future<Stream<DriverDevicesEvent>> onInit(Completer<void> completer) async {
    return guard(
      () async {
        final service = ref.read(mqttServiceProvider);
        // TODO: Add MQTT topics to Rtl433 configuration
        _subscriptions.add(
          service.updates.listen(
            _onUpdate,
            cancelOnError: false,
          ),
        );
        return super.onInit(completer);
      },
      task: 'onInit',
      name: '$Rtl433Driver',
    );
  }

  Future<void> _onUpdate(MqttMessage e) {
    return guard(
      () async {
        /// TODO: Make rtl_433 format matching more robust
        if (e.payload.startsWith('{"time"')) {
          Device device = Rtl433Device.fromJson(
            jsonDecode(e.payload),
          ).toDevice();
          device = await _estimate(device);
          _devices[Identity.of(device)] = device;
        }
      },
      task: '_onUpdate',
      name: '$runtimeType',
    );
  }

  Future<Device> _estimate(Device device) async {
    if (device.capabilities.hasRainTotal) {
      final previous =
          await ref.read(deviceServiceProvider).get(Identity.of(device));
      if (previous.isPresent) {
        // Calculate rain difference since last measurement
        final rain = device.rainTotal! - (previous.value.rainTotal ?? 0);
        // Calculate rain rate since last measurement
        // TODO: Calculate rain rate over longer period
        double? rainRate = device.rainRate;
        if (!device.hasRainRate) {
          final span = device.lastUpdated.difference(
            previous.value.lastUpdated,
          );
          if (span.inSeconds > 0) {
            rainRate = rain / span.inSeconds * 60;
          }
        }
        return device.copyWith(
          rain: rain,
          rainRate: rainRate,
        );
      }
    }
    return device;
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
    _log.fine(
      '$Rtl433 throttled updates for '
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
      Rtl433.supportedTypes.map((e) => e.toDefinition()).toList(),
    );
  }

  @override
  Future<List<Device>> getAllDevices({
    DeviceType type = DeviceType.any,
    Iterable<String> ids = const [],
  }) {
    final found = _devices.values
        .where((e) => ids.isEmpty || ids.contains(e.id))
        .where((e) => type.isAny || e.type == type)
        .toList();
    return Future.value(found);
  }
}

@Riverpod(keepAlive: true)
Rtl433Driver rtl433Driver(Rtl433DriverRef ref) => Rtl433Driver(ref);
