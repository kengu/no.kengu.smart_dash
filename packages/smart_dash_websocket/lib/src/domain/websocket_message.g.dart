// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'websocket_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WebSocketMessageImpl _$$WebSocketMessageImplFromJson(
        Map<String, dynamic> json) =>
    _$WebSocketMessageImpl(
      type: json['type'] as String,
      channel: json['channel'] as String,
      payload: json['payload'],
    );

Map<String, dynamic> _$$WebSocketMessageImplToJson(
        _$WebSocketMessageImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'channel': instance.channel,
      'payload': instance.payload,
    };
