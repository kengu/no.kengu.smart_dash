import 'package:freezed_annotation/freezed_annotation.dart';

part 'websocket_message.freezed.dart';
part 'websocket_message.g.dart';

enum WebSocketAction {
  sub,
  cmd,
  unsub,
}

@freezed
class WebSocketMessage with _$WebSocketMessage {
  const WebSocketMessage._();

  const factory WebSocketMessage({
    required String type,
    required String channel,
    dynamic payload,
  }) = _WebSocketMessage;

  factory WebSocketMessage.status({
    required String channel,
    required String message,
  }) {
    return WebSocketMessage(
      type: 'status',
      channel: channel,
      payload: {'message': message},
    );
  }

  factory WebSocketMessage.response({
    required String channel,
    required WebSocketAction action,
    required String message,
  }) {
    return WebSocketMessage(
      type: 'response',
      channel: channel,
      payload: {
        'action': action.name,
        "message": message,
      },
    );
  }

  factory WebSocketMessage.error({
    required String channel,
    required String message,
    String? payload,
  }) {
    return WebSocketMessage(
      type: 'error',
      channel: channel,
      payload: {
        'message': message,
        if (payload != null) 'payload': payload,
      },
    );
  }

  factory WebSocketMessage.fromJson(Map<String, Object?> json) =>
      _$WebSocketMessageFromJson(json);
}
