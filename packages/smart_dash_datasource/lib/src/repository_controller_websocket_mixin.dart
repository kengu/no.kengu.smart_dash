import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_datasource/smart_dash_datasource.dart';
import 'package:smart_dash_websocket/smart_dash_websocket.dart';

typedef _SendMessage = void Function(WebSocketMessage message);

mixin RepositoryControllerWebsocketMixin<I, T, R extends Repository<I, T>>
    on RepositoryController<I, T, R> {
  late _SendMessage _sendMessage;

  String get channel => type.toLowerCase();
  Future<WebSocketMessage> onMessage(WebSocketMessage message);

  WebSocketMessage toMessage(RepositoryEvent<I, T> e) {
    return WebSocketMessage(
      channel: channel,
      type: '${typeOf<RepositoryEvent<I, T>>()}',
      // TODO: Handle single and bulk events
      payload: toJson(e.item),
    );
  }

  void registerChannel(WebSocketServerMultiplexer websocket) {
    websocket.registerChannel(channel, onMessage);
    _sendMessage = (WebSocketMessage message) {
      websocket.sendMessage(channel, message);
    };
    repo.events.listen(
      (e) => _sendMessage(toMessage(e)),
      onError: (error, stackTrace) {
        log.severe(
          'Failed to process ${RepositoryEvent<I, T>}',
          error,
          stackTrace,
        );
      },
      cancelOnError: false,
    );
  }
}

/*
mixin WebsocketRepositoryControllerMixin<I, T, R extends Repository<I, T>>
    on RepositoryControllerWebsocketMixin<I, T, R> {
  WebSocketMessage toMessage(RepositoryEvent<I, T> e) {
    return WebSocketMessage(
      channel: channel,
      type: '${typeOf<RepositoryEvent<I, T>>()}',
      // TODO: Handle single and bulk events
      payload: toJson(e.item),
    );
  }

  @override
  void registerChannel(WebSocketServerMultiplexer websocket) {
    super.registerChannel(websocket);
    repo.events.listen(
      (e) {
        return _sendMessage(toMessage(e));
      },
      onError: (error, stackTrace) {
        log.severe(
          'Failed to process ${RepositoryEvent<I, T>}',
          error,
          stackTrace,
        );
      },
      cancelOnError: false,
    );
  }
}
 */
