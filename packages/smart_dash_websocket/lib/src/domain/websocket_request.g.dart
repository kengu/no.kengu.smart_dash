// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'websocket_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WebSocketRequest _$WebSocketRequestFromJson(Map<String, dynamic> json) =>
    _WebSocketRequest(
      action: $enumDecode(_$WebSocketActionEnumMap, json['action']),
      message:
          WebSocketMessage.fromJson(json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WebSocketRequestToJson(_WebSocketRequest instance) =>
    <String, dynamic>{
      'action': _$WebSocketActionEnumMap[instance.action]!,
      'message': instance.message.toJson(),
    };

const _$WebSocketActionEnumMap = {
  WebSocketAction.sub: 'sub',
  WebSocketAction.cmd: 'cmd',
  WebSocketAction.unsub: 'unsub',
};
