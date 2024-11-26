import 'dart:async';
import 'dart:convert';

import 'package:optional/optional.dart';
import 'package:riverpod/riverpod.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_device/smart_dash_device.dart';
import 'package:smart_dash_mqtt/src/application/mqtt_driver.dart';
import 'package:smart_dash_mqtt/src/application/mqtt_manager.dart';
import 'package:smart_dash_mqtt/src/integration/rtl_433/domain/rtl_433_device.dart';
import 'package:stream_transform/stream_transform.dart';

class Rtl433DeviceClient extends DeviceClient {
  Rtl433DeviceClient(this.ref, super.config);

  final Ref ref;

  Stream<Rtl433Device> get updates {
    // TODO: Add MQTT topics to Rtl433 configuration
    final manager = ref.read(mqttManagerProvider);
    return manager.events
        .whereType<MqttDataEvent>()
        .asyncMap(_onUpdate)
        .where((e) => e.isPresent)
        .map((e) => e.value);
  }

  FutureOr<Optional<Rtl433Device>> _onUpdate(MqttDataEvent e) {
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
      final previous = await ref.read(deviceServiceProvider).requireValue.get(
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
