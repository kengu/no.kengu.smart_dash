import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

import 'mqtt_driver.dart';

part 'mqtt_manager.g.dart';

final class MqttManager extends DriverManager<MqttDriver> {
  MqttManager(super.ref);
}

@Riverpod(keepAlive: true)
MqttManager mqttManager(Ref ref) => MqttManager(ref);
