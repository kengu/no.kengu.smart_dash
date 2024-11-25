import 'dart:async';

import 'package:logging/logging.dart';
import 'package:mqtt_client/mqtt_server_client.dart' as m;
import 'package:optional/optional.dart';
import 'package:riverpod/riverpod.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';
import 'package:smart_dash_mqtt/smart_dash_mqtt.dart';
import 'package:smart_dash_mqtt/src/data/mqtt_client.dart';

final class MqttDriver extends Driver<MqttDriver> {
  MqttDriver(Ref ref, ServiceConfig config)
      : super(
          ref: ref,
          config: config,
          key: Mqtt.key,
          type: IntegrationType.mqtt,
        );

  static const ttl = Duration(hours: 1);
  static const max = Duration(hours: 24);

  static final log = Logger('$MqttDriver');

  Optional<MqttClient> client = Optional.empty();

  final List<StreamSubscription> _subscriptions = [];

  bool get isConnected => client.isPresent && client.value.isConnected;
  bool get isDisconnected => client.isPresent && client.value.isDisconnected;

  Future<void> connect(String identifier) {
    return guard(() async {
      // Start listening to mqtt messages from known topics
      final url = '${config.host}';
      log.info('Connecting to [$url]...');

      final client = MqttClient(
        ref,
        m.MqttServerClient(
          url,
          'SmartDash::$identifier',
        )..port = int.parse(config.port!),
      );

      final connected = await client.connect(
        username: config.username,
        password: config.password,
      );

      if (connected) {
        log.info(
          'Connecting to [$url]... DONE',
        );

        // Needed for disposal when driver is uninitialized
        _subscriptions
          ..add(client.messages.listen(
            (message) {
              log.fine(
                'Received :: ${message.topic} :: ${message.payload}',
              );
              raise(MqttDataEvent.now(
                key,
                message,
              ));
            },
            onError: failed,
            cancelOnError: false,
          ))
          ..add(
            client.status.listen(
              (e) => MqttStatusEvent.now(key, e),
              onError: failed,
              cancelOnError: false,
            ),
          );

        log.fine(
          'Subscribing to topics [${config.topics}]...',
        );
        for (final topic in config.topics!.split(',')) {
          final result = client.subscribe(topic);
          if (result.isPresent) {
            log.info(
              'Subscribing to topics [${config.topics}]...DONE',
            );
          } else {
            warning(
              'Subscribing to topics [${config.topics}]...FAILED',
            );
          }
        }
      } else {
        warning('Connecting to [$url]... FAILED');
      }
      return;
    });
  }

  Future<bool> disconnect([bool gracefully = false]) {
    return guard(() async {
      if (isDisconnected) return true;
      return client.value.disconnect(gracefully);
    });
  }

  void warning(Object message) {
    log.warning(message);
    failed(message);
  }
}

class MqttEvent extends DriverEvent {
  MqttEvent({
    required super.key,
    required super.last,
    required super.when,
  });
}

class MqttStatusEvent extends DriverDataEvent<MqttStatus> {
  MqttStatusEvent(
    super.data, {
    required super.key,
    required super.last,
    required super.when,
  });

  factory MqttStatusEvent.now(String key, MqttStatus data) {
    final when = DateTime.now();
    return MqttStatusEvent(
      data,
      key: key,
      when: when,
      last: when,
    );
  }
}

class MqttDataEvent extends DriverDataEvent<MqttMessage> {
  MqttDataEvent(
    super.data, {
    required super.key,
    required super.last,
    required super.when,
  });

  String get topic => data.topic;
  String get payload => data.payload;

  factory MqttDataEvent.now(String key, MqttMessage data) {
    final when = DateTime.now();
    return MqttDataEvent(
      data,
      key: key,
      when: when,
      last: when,
    );
  }
}
