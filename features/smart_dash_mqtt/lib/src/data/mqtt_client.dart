import 'dart:async';

import 'package:logging/logging.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:optional/optional.dart';
import 'package:riverpod/riverpod.dart';
import 'package:smart_dash_mqtt/smart_dash_mqtt.dart' as s;
import 'package:universal_io/io.dart' as io;

class MqttClient {
  MqttClient(
    this.ref,
    MqttServerClient api, {
    bool logging = false,
  }) : _api = api {
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

  final Map<String, MqttSubscriptionStatus> _topics = {};

  final StreamController<MqttStatus> _statusController =
      StreamController.broadcast();

  final StreamController<s.MqttMessage> _messageController =
      StreamController.broadcast();

  final _log = Logger('$MqttClient');

  final List<StreamSubscription> _subscriptions = [];

  int _aliveCount = 0;

  MqttConnectionState _state = MqttConnectionState.disconnected;

  bool get isDisconnected => !isConnected;

  bool get isConnected => _state == MqttConnectionState.connected;

  Stream<MqttStatus> get status => _statusController.stream;
  Stream<s.MqttMessage> get messages => _messageController.stream;

  Future<bool> connect({String? username, String? password}) async {
    assert(isDisconnected, 'Already connected');

    _log.info(
      'MqttClient >> Connect :: Client is connecting',
    );

    _api.connectionMessage = MqttConnectMessage()
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
      _severe('Connection failed', e, stackTrace);
      _api.disconnect();
    } on io.SocketException catch (e, stackTrace) {
      // Raised by the socket layer
      _severe('Connection failed', e, stackTrace);
      _api.disconnect();
    } on io.HttpException catch (e, stackTrace) {
      // Raised by the socket layer
      _severe('Connection failed', e, stackTrace);
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
      _topics[topic] = _api.getSubscriptionsStatus(topic);
    }
    return subscription;
  }

  Future<bool> disconnect([bool gracefully = false]) async {
    assert(
      isConnected,
      'MqttClient >> Disconnect :: Already disconnected',
    );

    if (gracefully) {
      for (final topic in _topics.keys) {
        _api.unsubscribe(topic, expectAcknowledge: gracefully);
      }

      // Wait for the unsubscribe messages from the broker
      while (_topics.isNotEmpty) {
        await MqttUtilities.asyncSleep(1);
      }
    }
    _api.disconnect();
    return true;
  }

  Future<void> dispose() async {
    await disconnect();
    for (final it in _subscriptions) {
      it.cancel();
    }
    _subscriptions.clear();
    _statusController.close();
    _messageController.close();
  }

  // The successful connect callback
  void _onConnected() {
    for (final it in _subscriptions) {
      it.cancel();
    }
    _subscriptions.clear();
    _subscriptions.add(_api.updates!.listen((
      List<MqttReceivedMessage<MqttMessage?>>? messages,
    ) {
      for (final message in messages ?? <MqttReceivedMessage<MqttMessage?>>[]) {
        final payload = message.payload as MqttPublishMessage;
        _messageController.add(s.MqttMessage(
          topic: message.topic,
          payload: MqttPublishPayload.bytesToStringAsString(
            payload.payload.message,
          ),
        ));
      }
      _statusController.add(MqttStatus.alive);
    }, cancelOnError: false));

    _statusController.add(MqttStatus.alive);

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
    _topics[topic] = _api.getSubscriptionsStatus(topic);
  }

  void _onSubscribeFail(String topic) {
    _log.warning(
      'OnSubscribedFail :: '
      'Not subscribed to topic [$topic]',
    );
    _topics.remove(topic);
  }

  void _onUnsubscribed(String? topic) {
    _log.info(
      'OnUnsubscribed :: '
      'Confirmed for topic :: $topic',
    );
    _topics.remove(topic);
  }

  // The unsolicited disconnect callback
  void _onDisconnected() {
    _log.info(
      'OnDisconnected :: '
      'Client disconnected',
    );
    if (_api.connectionStatus!.disconnectionOrigin ==
        MqttDisconnectionOrigin.solicited) {
      _log.info(
        'OnDisconnected :: '
        'Is solicited, this is CORRECT',
      );
      _closed('Disconnected by System');
    } else {
      _log.warning(
        'OnDisconnected :: '
        'Is unsolicited or none, this is INCORRECT',
      );
      _closed('Disconnected by Broker');
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
    _closed('Auto reconnect in progress');
    _log.info('Auto reconnect :: STARTED');
  }

  void _onAutoReconnected() {
    _alive('Auto reconnect :: COMPLETED');
  }

  void _alive(String message) {
    _log.info(message);
    _statusController.add(MqttStatus.alive);
  }

  void _closed(String message) {
    _log.info(message);
    _statusController.add(MqttStatus.closed);
  }

  void _severe(String message, Object error, StackTrace stackTrace) {
    _log.severe(message, error, stackTrace);
    _messageController.addError(error, stackTrace);
    _messageController.addError(error, stackTrace);
  }
}

enum MqttStatus {
  alive,
  closed,
  failure,
}
