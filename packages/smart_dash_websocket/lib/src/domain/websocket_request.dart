import 'package:freezed_annotation/freezed_annotation.dart';

import 'websocket_message.dart';

part 'websocket_request.freezed.dart';
part 'websocket_request.g.dart';

@freezed
class WebSocketRequest with _$WebSocketRequest {
  const WebSocketRequest._();

  const factory WebSocketRequest({
    required WebSocketAction action,
    required WebSocketMessage message,
  }) = _WebSocketRequest;

  factory WebSocketRequest.fromJson(Map<String, Object?> json) =>
      _$WebSocketRequestFromJson(json);
}
