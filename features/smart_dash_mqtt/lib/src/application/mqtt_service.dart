// ignore_for_file: unused_import

import 'dart:async';

import 'package:logging/logging.dart';
import 'package:mqtt_client/mqtt_server_client.dart' as m;
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_account/smart_dash_account_app.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_device/smart_dash_device.dart';
import 'package:smart_dash_mqtt/smart_dash_mqtt.dart';
import 'package:smart_dash_mqtt/src/application/mqtt_driver.dart';
import 'package:smart_dash_mqtt/src/application/mqtt_manager.dart';
import 'package:smart_dash_mqtt/src/data/mqtt_client.dart';

part 'mqtt_service.g.dart';

class MqttService
    extends DriverService<MqttMessage, MqttDataEvent, MqttDriver, MqttManager> {
  MqttService(Ref ref) : super(ref, FutureCache(prefix: '$MqttService')) {
    ref.onDispose(disconnect);
  }

  final _log = Logger('$MqttService');

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
Future<MqttService> mqttService(MqttServiceRef ref) async {
  final home = await ref.read(getCurrentHomeProvider().future);

  // Register SnowState integrations
  final mqttManager = ref.read(mqttManagerProvider)
    ..register(
      Mqtt.key,
      (config) => MqttDriver(ref, config),
    );
  mqttManager.build(home.value.serviceWhere);

  final deviceManager = ref.read(deviceDriverManagerProvider)
    ..register(
      Rtl433.key,
      (config) => Rtl433DeviceDriver(ref, config),
    );
  await deviceManager.build(home.value.serviceWhere);

  return MqttService(ref);
}
