// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelImpl _$$NotificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationModelImpl(
      id: json['id'] as int,
      shown: json['shown'] as bool,
      body: json['body'] as String,
      title: json['title'] as String,
      isAcked: json['isAcked'] as bool,
      when: DateTime.parse(json['when'] as String),
    );

Map<String, dynamic> _$$NotificationModelImplToJson(
        _$NotificationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shown': instance.shown,
      'body': instance.body,
      'title': instance.title,
      'isAcked': instance.isAcked,
      'when': instance.when.toIso8601String(),
    };
