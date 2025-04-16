// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'websocket_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WebSocketMessage _$WebSocketMessageFromJson(Map<String, dynamic> json) =>
    _WebSocketMessage(
      type: json['type'] as String,
      channel: json['channel'] as String,
      payload: json['payload'],
    );

Map<String, dynamic> _$WebSocketMessageToJson(_WebSocketMessage instance) =>
    <String, dynamic>{
      'type': instance.type,
      'channel': instance.channel,
      'payload': instance.payload,
    };
