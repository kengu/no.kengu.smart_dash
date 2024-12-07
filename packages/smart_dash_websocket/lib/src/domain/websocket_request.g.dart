// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'websocket_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WebSocketRequestImpl _$$WebSocketRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$WebSocketRequestImpl(
      action: $enumDecode(_$WebSocketActionEnumMap, json['action']),
      message:
          WebSocketMessage.fromJson(json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WebSocketRequestImplToJson(
        _$WebSocketRequestImpl instance) =>
    <String, dynamic>{
      'action': _$WebSocketActionEnumMap[instance.action]!,
      'message': instance.message.toJson(),
    };

const _$WebSocketActionEnumMap = {
  WebSocketAction.sub: 'sub',
  WebSocketAction.cmd: 'cmd',
  WebSocketAction.unsub: 'unsub',
};
