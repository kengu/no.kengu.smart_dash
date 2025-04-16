import 'dart:async';
import 'dart:convert';

import 'package:logging/logging.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:smart_dash_websocket/smart_dash_websocket.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

typedef WebSocketMessageHandler = Future<WebSocketMessage> Function(
    WebSocketMessage message);

/// This class implements a multiplex protocol over websocket on server-side
class WebSocketServerMultiplexer {
  final List<WebSocketChannel> _webSockets = [];
  final Map<String, WebSocketMessageHandler> _handlers = {};
  final Map<String, StreamController<WebSocketMessage>> _controllers = {};
  final Map<WebSocketChannel, Map<String, Set<String>>> _subscriptions = {};

  final Logger log = Logger('$WebSocketServerMultiplexer');

  void addWebSocket(WebSocketChannel webSocket) {
    _webSockets.add(webSocket);
    _subscriptions[webSocket] = {};
    webSocket.stream.listen(
      (message) {
        _handleIncomingMessage(webSocket, message);
      },
      onDone: () {
        _cleanupWebSocket(webSocket);
      },
      onError: (error, stackTrace) {
        log.severe('WebSocket error', error, stackTrace);
        _cleanupWebSocket(webSocket);
      },
    );
    log.info(
      'Added websocket [$webSocket] (count: ${_webSockets.length}',
    );
  }

  // TODO: Add message types that given channel handles
  void registerChannel(String channel, WebSocketMessageHandler handler) {
    assert(
      !_controllers.containsKey(channel),
      'Handler for channel [$channel] already registered',
    );

    _controllers[channel] = StreamController<WebSocketMessage>.broadcast();
    _handlers[channel] = handler;

    _controllers[channel]!.stream.listen(
      (message) async {
        final payload = jsonEncode(message.toJson());
        for (final ws in _webSockets) {
          if (_subscriptions[ws]?[channel]?.contains(message.type) ?? false) {
            ws.sink.add(payload);
            log.fine(
              'Sent message [${message.type}] from channel [$channel] to [$ws]',
            );
          }
        }
      },
      cancelOnError: false,
    );

    log.fine(
      'Registered [$WebSocketMessage] handler for channel [$channel]',
    );
  }

  void sendMessage(String channel, WebSocketMessage message) {
    if (_controllers.containsKey(channel)) {
      _controllers[channel]!.add(message);
    } else {
      log.severe('Unknown channel: $channel');
    }
  }

  Middleware middleware(String wsPath) {
    final wsHandler = webSocketHandler((WebSocketChannel webSocket, String? _) {
      addWebSocket(webSocket);
    });
    return (Handler innerHandler) {
      return (Request request) async {
        if (request.method == 'GET' && request.url.path == wsPath) {
          return await wsHandler(request);
        }
        return innerHandler(request);
      };
    };
  }

  void _handleIncomingMessage(WebSocketChannel webSocket, String payload) {
    try {
      final request = WebSocketRequest.fromJson(
        jsonDecode(payload),
      );
      final action = request.action;
      final message = request.message;
      final channel = message.channel.toLowerCase();

      switch (action) {
        case WebSocketAction.sub:
          _subscribe(webSocket, channel, message.type);
          break;
        case WebSocketAction.cmd:
          _executeCommand(webSocket, request);
          break;
        case WebSocketAction.unsub:
          _unsubscribe(webSocket, channel, message.type);
          break;
      }
    } catch (error, stackTrace) {
      log.severe('Invalid message format', error, stackTrace);
      _sendError(webSocket, 'unknown', 'Invalid message format', payload);
    }
  }

  void _executeCommand(
    WebSocketChannel webSocket,
    WebSocketRequest request,
  ) async {
    assert(
      request.action == WebSocketAction.cmd,
      'Only handle ${WebSocketAction.cmd}',
    );
    final message = request.message;
    final channel = message.channel.toLowerCase();
    if (_handlers.containsKey(channel)) {
      final handler = _handlers[channel]!;
      final response = await handler(message);
      webSocket.sink.add(jsonEncode(response.toJson()));
      log.info('Executed command [${message.type}] on channel []');
    } else {
      _sendError(webSocket, message.channel, 'Unknown channel');
    }
  }

  void _subscribe(WebSocketChannel webSocket, String channel, String type) {
    if (_controllers.containsKey(channel)) {
      _subscriptions[webSocket] ??= {};
      _subscriptions[webSocket]![channel] ??= {};
      _subscriptions[webSocket]![channel]!.add(type);
      _sendStatus(
        webSocket,
        channel,
        'Subscribed to message type [$type]',
      );
      log.info(
        '[$webSocket] subscribed to '
        'message type [$type] in channel [$channel]',
      );
    } else {
      _sendError(webSocket, channel, 'Unknown channel');
      log.severe('Unknown channel [$channel]');
    }
  }

  void _unsubscribe(WebSocketChannel webSocket, String channel, String type) {
    if (_subscriptions[webSocket]?[channel]?.contains(type) ?? false) {
      _subscriptions[webSocket]![channel]!.remove(type);
      if (_subscriptions[webSocket]![channel]!.isEmpty) {
        _subscriptions[webSocket]!.remove(channel);
      }
      _sendStatus(
        webSocket,
        channel,
        'Unsubscribed from message type [$type]',
      );
      log.info(
        '[$webSocket] unsubscribed from '
        'message type [$type] in channel [$channel]',
      );
    } else {
      _sendError(
        webSocket,
        channel,
        'Not subscribing to messages in channel [$channel]',
      );
      log.severe(
        '[$webSocket] not subscribing to '
        'messages in channel [$channel]',
      );
    }
  }

  void _cleanupWebSocket(WebSocketChannel webSocket) {
    log.info('Cleaning up WebSocket [$webSocket]');
    _webSockets.remove(webSocket);
    _subscriptions.remove(webSocket);
  }

  void _sendError(WebSocketChannel webSocket, String channel, String message,
      [String? payload]) {
    final error = WebSocketMessage.error(
      channel: channel,
      message: message,
      payload: payload,
    );
    webSocket.sink.add(jsonEncode(error.toJson()));
  }

  void _sendStatus(WebSocketChannel webSocket, String channel, String message) {
    final status = WebSocketMessage.status(
      channel: channel,
      message: message,
    );
    webSocket.sink.add(jsonEncode(status.toJson()));
  }
}
