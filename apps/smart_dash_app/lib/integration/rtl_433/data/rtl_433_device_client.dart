import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash_app/integration/mqtt/application/mqtt_service.dart';
import 'package:smart_dash_app/integration/mqtt/domain/mqtt_message.dart';
import 'package:smart_dash_app/integration/rtl_433/domain/rtl_433_device.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_device/smart_dash_device.dart';

class Rtl433DeviceClient extends DeviceClient {
  Rtl433DeviceClient(this.ref, super.config);

  final Ref ref;

  Stream<Rtl433Device> get updates {
    // TODO: Add MQTT topics to Rtl433 configuration
    final service = ref.read(mqttServiceProvider);
    return service.updates
        .asyncMap(_onUpdate)
        .where((e) => e.isPresent)
        .map((e) => e.value);
  }

  FutureOr<Optional<Rtl433Device>> _onUpdate(MqttMessage e) {
    return guard(
      () async {
        /// TODO: Make rtl_433 format matching more robust
        if (e.payload.startsWith('{"time"')) {
          Rtl433Device device = Rtl433Device.fromJson(
            jsonDecode(e.payload),
          );
          return Optional.of(
            await _estimate(device),
          );
        }
        return Optional.empty();
      },
      task: '_onUpdate',
      name: '$runtimeType',
    );
  }

  Future<Rtl433Device> _estimate(Rtl433Device device) async {
    if (device.capabilities.hasRainTotal) {
      final previous = await ref.read(deviceServiceProvider).get(
            Identity.of(device.toDevice()),
          );
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
          rainInInches: null,
          rainInMillimeters: rain,
          rainRateInchesPerHour: null,
          rainRateMillimeterPerHour: rainRate,
        );
      }
    }
    return device;
  }

  @override
  void close() {
    // No need
  }
}
