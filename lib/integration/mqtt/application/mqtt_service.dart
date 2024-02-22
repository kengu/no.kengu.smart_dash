import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mqtt_client/mqtt_server_client.dart' as m;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/home/application/home_service.dart';
import 'package:smart_dash/feature/identity/data/user_repository.dart';
import 'package:smart_dash/integration/mqtt/data/mqtt_client.dart';
import 'package:smart_dash/integration/mqtt/domain/mqtt_message.dart';
import 'package:smart_dash/util/guard.dart';

part 'mqtt_service.g.dart';

class MqttService {
  MqttService(this.ref) {
    ref.onDispose(dispose);
  }

  Ref ref;

  final List<MqttClient> _clients = [];
  final List<StreamSubscription> _subscriptions = [];
  final StreamController<MqttMessage> _controller =
      StreamController.broadcast();

  String get key => 'mqtt';

  Stream<MqttMessage> get updates => _controller.stream;

  Future<void> init() async {
    return guard(() async {
      final user = ref.read(userRepositoryProvider).currentUser;
      final home = await ref.read(homeServiceProvider).getCurrentHome();
      if (!home.isPresent) return;
      final configs = home.value.services.where((e) => e.key == key).toList();
      // Start listening to mqtt messages from known topics
      for (final config in configs) {
        final url = '${config.host}';
        debugPrint('MqttService >> Connecting to [$url]...');

        final client = MqttClient(
          m.MqttServerClient(url, 'SmartDash::${user.userId}')
            ..port = config.port!,
        );

        final connected = await client.connect(
          username: config.username,
          password: config.password,
        );

        if (connected) {
          debugPrint('MqttService >> Connecting to [$url]... DONE');

          // Needed for disposal when driver is uninitialized
          _clients.add(client);
          _subscriptions.add(client.updates.listen((e) {
            debugPrint('MqttService >> Received :: ${e.topic} :: ${e.payload}');
            _controller.add(e);
          }));

          debugPrint(
              'MqttService >> Subscribing to topics [${config.topics}]...');
          for (final topic in config.topics!.split(',')) {
            final result = client.subscribe(topic);
            if (result.isPresent) {
              debugPrint(
                'MqttService >> Subscribing to topics [${config.topics}]...DONE',
              );
            } else {
              debugPrint(
                'MqttService >> Subscribing to topics [${config.topics}]...FAILED',
              );
            }
          }
        } else {
          debugPrint('MqttService >> Connecting to [$url]... FAILED');
        }
      }
      return;
    });
  }

  Future<void> dispose() async {
    for (final it in _subscriptions) {
      await it.cancel();
    }
    for (final it in _clients) {
      await it.dispose();
    }
    debugPrint('MqttService >> Disposed');
  }
}

@Riverpod(keepAlive: true)
MqttService mqttService(MqttServiceRef ref) => MqttService(ref);
