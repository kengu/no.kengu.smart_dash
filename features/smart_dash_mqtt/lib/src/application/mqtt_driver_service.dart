import 'dart:async';

import 'package:logging/logging.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';
import 'package:smart_dash_mqtt/smart_dash_mqtt.dart';
import 'package:smart_dash_mqtt/src/application/mqtt_driver.dart';
import 'package:smart_dash_mqtt/src/application/mqtt_manager.dart';

part 'mqtt_driver_service.g.dart';

/// A [DriverService] for processing [MqttMessage]s from
/// [MqttDriver]s that implements [IntegrationType.mqtt] integrations.
class MqttDriverService
    extends DriverService<MqttMessage, MqttDataEvent, MqttDriver, MqttManager> {
  MqttDriverService(Ref ref)
      : super(
          ref,
          IntegrationType.mqtt,
          FutureCache(prefix: '$MqttDriverService'),
        ) {
    ref.onDispose(disconnect);
  }

  final _log = Logger('$MqttDriverService');

  @override
  MqttManager get manager => ref.read(mqttManagerProvider);

  Future<void> connect(String identifier) async {
    return guard(() async {
      for (final driver in manager.drivers) {
        await driver.connect(identifier);
      }
      _log.info(
        'Connected successfully to ${manager.drivers.length} brokers',
      );
    });
  }

  Future<void> disconnect([bool gracefully = false]) {
    return guard(() async {
      for (final it in manager.drivers) {
        await it.disconnect(gracefully);
      }
      _log.info(
        'Disconnected successfully from ${manager.drivers.length} brokers',
      );
    });
  }
}

@Riverpod(keepAlive: true)
MqttDriverService mqttService(Ref ref) {
  return MqttDriverService(ref);
}
