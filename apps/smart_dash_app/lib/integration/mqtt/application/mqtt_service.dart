// ignore_for_file: unused_import

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:mqtt_client/mqtt_server_client.dart' as m;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_app/integration/mqtt/data/mqtt_client.dart';
import 'package:smart_dash_app/integration/mqtt/domain/mqtt_message.dart';
import 'package:smart_dash_app/integration/mqtt/mqtt.dart';
import 'package:smart_dash_account/smart_dash_account_app.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

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

  final _log = Logger('$MqttService');

  String get key => Mqtt.key;

  Stream<MqttMessage> get updates => _controller.stream;

  Future<void> init() async {
    return guard(() async {
      final user = ref.read(userRepositoryProvider).currentUser;
      final home = await ref.read(accountServiceProvider).getCurrentHome();
      if (!home.isPresent) return;
      final configs = home.value.services.where((e) => e.key == key).toList();
      // Start listening to mqtt messages from known topics
      for (final config in configs) {
        final url = '${config.host}';
        _log.info('Connecting to [$url]...');

        final client = MqttClient(
          ref,
          m.MqttServerClient(
            url,
            'SmartDash::${user.userId}',
          )..port = config.port!,
        );

        final connected = await client.connect(
          username: config.username,
          password: config.password,
        );

        if (connected) {
          _log.info(
            'Connecting to [$url]... DONE',
          );

          // Needed for disposal when driver is uninitialized
          _clients.add(client);
          _subscriptions.add(client.updates.listen(
            (e) {
              _log.fine(
                'Received :: ${e.topic} :: ${e.payload}',
              );
              _controller.add(e);
            },
            cancelOnError: false,
          ));

          _log.fine(
            'Subscribing to topics [${config.topics}]...',
          );
          for (final topic in config.topics!.split(',')) {
            final result = client.subscribe(topic);
            if (result.isPresent) {
              _log.info(
                'Subscribing to topics [${config.topics}]...DONE',
              );
            } else {
              _log.warning(
                'Subscribing to topics [${config.topics}]...FAILED',
              );
            }
          }
        } else {
          _log.warning('Connecting to [$url]... FAILED');
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
    _log.info('Service was disposed');
  }
}

@Riverpod(keepAlive: true)
MqttService mqttService(MqttServiceRef ref) => MqttService(ref);
