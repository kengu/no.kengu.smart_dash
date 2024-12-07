import 'dart:async';
import 'dart:convert';

import 'package:logging/logging.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_websocket/smart_dash_websocket.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// This class implements a multiplex protocol over WebSocket on the client-side
class WebSocketClientMultiplexer {
  final Logger log = Logger('$WebSocketClientMultiplexer');
  final _incomingController = StreamController<WebSocketMessage>.broadcast();
  final _channelControllers = <String, StreamController<WebSocketMessage>>{};

  WebSocketChannel? _webSocket;
  StreamSubscription? _webSocketSubscription;

  bool get isConnected => _webSocket != null;

  Future<void> connect(String wsUrl) async {
    assert(_webSocketSubscription != null, 'Already connected');
    return guard(
      () async {
        _webSocket = IOWebSocketChannel.connect(Uri.parse(wsUrl));
        _webSocketSubscription = _webSocket!.stream.listen(
          (message) {
            _handleIncomingMessage(message);
          },
          onDone: () {
            log.info('WebSocket connection closed');
            close();
          },
          onError: (error) {
            log.warning('WebSocket error: \$error');
            close();
          },
        );
      },
      task: 'connect',
      name: '$WebSocketClientMultiplexer',
      done: () {
        log.info('WebSocket connection established to \$wsUrl');
      },
    );
  }

  void close() {
    _webSocket?.sink.close();
    _webSocket = null;
    _webSocketSubscription?.cancel();
    _webSocketSubscription = null;
    for (final controller in _channelControllers.values) {
      controller.close();
    }
    _channelControllers.clear();
    _incomingController.close();
  }

  Stream<WebSocketMessage> listenTo(String channel) {
    _channelControllers[channel] ??=
        StreamController<WebSocketMessage>.broadcast();
    return _channelControllers[channel]!.stream;
  }

  void subscribe(String channel, String type) {
    final message = WebSocketRequest(
      action: WebSocketAction.sub,
      message: WebSocketMessage(
        type: type,
        channel: channel,
      ),
    );
    _sendMessage(message);
  }

  void unsubscribe(String channel, String type) {
    final message = WebSocketRequest(
      action: WebSocketAction.unsub,
      message: WebSocketMessage(
        type: type,
        channel: channel,
      ),
    );
    _sendMessage(message);
  }

  void sendCommand(String channel, String type, dynamic payload) {
    final message = WebSocketRequest(
      action: WebSocketAction.cmd,
      message: WebSocketMessage(
        type: type,
        channel: channel,
        payload: payload,
      ),
    );
    _sendMessage(message);
  }

  void _handleIncomingMessage(String message) {
    return guardSync(
      () {
        try {
          final parsedMessage = WebSocketMessage.fromJson(
            jsonDecode(message),
          );
          _incomingController.add(parsedMessage);
          if (_channelControllers.containsKey(parsedMessage.channel)) {
            _channelControllers[parsedMessage.channel]!.add(parsedMessage);
          }
        } catch (error) {
          log.severe('Invalid message format: $message', error);
        }
      },
      task: '_handleIncomingMessage',
      name: '$WebSocketClientMultiplexer',
    );
  }

  void _sendMessage(WebSocketRequest request) {
    assert(_webSocket != null, 'websocket is closed');
    return guardSync(
      () {
        try {
          final encodedMessage = jsonEncode(request.toJson());
          _webSocket?.sink.add(encodedMessage);
        } catch (error) {
          log.severe('Failed to send message: $request', error);
        }
      },
      task: '_sendMessage',
      name: '$WebSocketClientMultiplexer',
    );
  }
}
