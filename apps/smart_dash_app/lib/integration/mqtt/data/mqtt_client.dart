// ignore_for_file: unused_import

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash_app/feature/system/application/system_health_service.dart';
import 'package:smart_dash_app/integration/mqtt/domain/mqtt_message.dart' as s;
import 'package:smart_dash_app/integration/mqtt/mqtt.dart';
import 'package:smart_dash_app/util/platform.dart';
import 'package:universal_io/io.dart' as io;

class MqttClient {
  MqttClient(this.ref, MqttServerClient api, {bool logging = false})
      : _api = api {
    _api.autoReconnect = true;
    _api.resubscribeOnAutoReconnect = true;

    _api.logging(on: logging);

    /// Set the correct MQTT protocol for mosquito
    _api.setProtocolV311();

    _api.keepAlivePeriod = 60;
    _api.connectTimeoutPeriod = 30000;

    _api.pongCallback = _pong;
    _api.onConnected = _onConnected;
    _api.onSubscribed = _onSubscribed;
    _api.onSubscribeFail = _onSubscribeFail;
    _api.onUnsubscribed = _onUnsubscribed;
    _api.onDisconnected = _onDisconnected;
    _api.onAutoReconnect = _onAutoReconnect;
    _api.onAutoReconnected = _onAutoReconnected;
  }

  final Ref ref;

  final MqttServerClient _api;

  final Map<String, MqttSubscriptionStatus> _subscriptions = {};

  final StreamController<s.MqttMessage> _controller =
      StreamController.broadcast();

  final _log = Logger('$MqttClient');

  int _aliveCount = 0;

  StreamSubscription? _updateSubscription;

  MqttConnectionState _state = MqttConnectionState.disconnected;

  bool get isDisconnected => !isConnected;

  bool get isConnected => _state == MqttConnectionState.connected;

  Stream<s.MqttMessage> get updates => _controller.stream;

  Future<bool> connect({String? username, String? password}) async {
    assert(isDisconnected, 'Already connected');

    _log.info(
      'MqttClient >> Connect :: Client is connecting',
    );

    final deviceId = await Platform.deviceId;

    _api.connectionMessage = MqttConnectMessage()
        .withClientIdentifier('smart_dash::$deviceId')
        .withWillTopic('smart_dash/will')
        .withWillMessage('offline')
        .withWillQos(MqttQos.atLeastOnce)
        .authenticateAs(username, password);

    try {
      final status = await _api.connect(username, password);
      if (status != null) {
        _state = status.state;
        return isConnected;
      }
    } on NoConnectionException catch (e, stackTrace) {
      // Raised by the client when connection fails.
      _log.severe('Connection failed', e, stackTrace);
      _api.disconnect();
    } on io.SocketException catch (e, stackTrace) {
      // Raised by the socket layer
      _log.severe('Connection failed', e, stackTrace);
      _api.disconnect();
    } on io.HttpException catch (e, stackTrace) {
      // Raised by the socket layer
      _log.severe('Connection failed', e, stackTrace);
      _api.disconnect();
    }
    return false;
  }

  bool isSubscribedTo(String topic) {
    return _api.getSubscriptionsStatus(topic) !=
        MqttSubscriptionStatus.doesNotExist;
  }

  Optional<Subscription> subscribe(String topic) {
    final subscription = Optional.ofNullable(
      _api.subscribe(topic, MqttQos.exactlyOnce),
    );
    if (subscription.isPresent) {
      _subscriptions[topic] = _api.getSubscriptionsStatus(topic);
    }
    return subscription;
  }

  Future<bool> disconnect([bool gracefully = false]) async {
    assert(
      isConnected,
      'MqttClient >> Disconnect :: Already disconnected',
    );

    if (gracefully) {
      for (final topic in _subscriptions.keys) {
        _api.unsubscribe(topic, expectAcknowledge: gracefully);
      }

      // Wait for the unsubscribe messages from the broker
      while (_subscriptions.isNotEmpty) {
        await MqttUtilities.asyncSleep(1);
      }
    }
    _api.disconnect();
    return true;
  }

  Future<void> dispose() async {
    await disconnect();
    await _updateSubscription?.cancel();
    _controller.close();
  }

  // The successful connect callback
  void _onConnected() {
    _updateSubscription?.cancel();
    _updateSubscription = _api.updates!.listen((
      List<MqttReceivedMessage<MqttMessage?>>? messages,
    ) {
      for (final message in messages ?? <MqttReceivedMessage<MqttMessage?>>[]) {
        final payload = message.payload as MqttPublishMessage;
        _controller.add(s.MqttMessage(
          topic: message.topic,
          payload: MqttPublishPayload.bytesToStringAsString(
            payload.payload.message,
          ),
        ));
      }
      ref.read(systemHealthServiceProvider).setOK(Mqtt.key);
    }, cancelOnError: false);

    ref.read(systemHealthServiceProvider).setOK(Mqtt.key);

    _log.info(
      'OnConnected :: '
      'Client connection was successful',
    );
  }

  void _pong() {
    _log.fine(
      'Pong :: '
      'Ping response client callback invoked',
    );
    _aliveCount++;
  }

  void _onSubscribed(String topic) {
    _log.info(
      'OnSubscribed :: '
      'Confirmed for topic :: $topic',
    );
    _subscriptions[topic] = _api.getSubscriptionsStatus(topic);
  }

  void _onSubscribeFail(String topic) {
    _log.warning(
      'OnSubscribedFail :: '
      'Not subscribed to topic [$topic]',
    );
    _subscriptions.remove(topic);
  }

  void _onUnsubscribed(String? topic) {
    _log.info(
      'OnUnsubscribed :: '
      'Confirmed for topic :: $topic',
    );
    _subscriptions.remove(topic);
  }

  // The unsolicited disconnect callback
  void _onDisconnected() {
    _log.info(
      'OnDisconnected :: '
      'Client disconnected',
    );
    final connectivity = ref.read(systemHealthServiceProvider);
    if (_api.connectionStatus!.disconnectionOrigin ==
        MqttDisconnectionOrigin.solicited) {
      _log.info(
        'OnDisconnected :: '
        'Is solicited, this is CORRECT',
      );
      connectivity.setFailed(Mqtt.key, 'Disconnected by System');
    } else {
      _log.warning(
        'OnDisconnected :: '
        'Is unsolicited or none, this is INCORRECT',
      );
      connectivity.setFailed(Mqtt.key, 'Disconnected by Broker');
    }
    if (_aliveCount == 3) {
      _log.info(
        'OnDisconnected :: '
        'Pong count is correct [$_aliveCount]',
      );
    } else {
      _log.warning(
        'OnDisconnected :: '
        'Pong count is incorrect, expected 3, actual is $_aliveCount',
      );
    }
  }

  void _onAutoReconnect() {
    ref.read(systemHealthServiceProvider).setFailed(
          Mqtt.key,
          'Auto reconnect in progress',
        );
    _log.info('Auto reconnect :: STARTED');
  }

  void _onAutoReconnected() {
    ref.read(systemHealthServiceProvider).setOK(Mqtt.key);
    _log.info('Auto reconnect :: COMPLETED');
  }
}
