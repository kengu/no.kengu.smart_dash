import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_endpoint/src/crud_controller_mixin.dart';
import 'package:smart_dash_datasource/smart_dash_datasource.dart';
import 'package:smart_dash_websocket/smart_dash_websocket.dart';

typedef _SendMessage = void Function(WebSocketMessage message);

mixin WebsocketCRUDControllerMixin<I, T> on CRUDControllerMixin<I, T> {
  late _SendMessage _sendMessage;

  String get channel => type.toLowerCase();
  Future<WebSocketMessage> onMessage(WebSocketMessage message);

  void registerChannel(WebSocketServerMultiplexer websocket) {
    websocket.registerChannel(channel, onMessage);
    _sendMessage = (WebSocketMessage message) {
      websocket.sendMessage(channel, message);
    };
  }
}

mixin WebsocketRepositoryControllerMixin<I, T, R extends Repository<I, T>>
    on WebsocketCRUDControllerMixin<I, T> {
  R get repo;

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
