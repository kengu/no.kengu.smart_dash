// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    _NotificationModel(
      id: (json['id'] as num).toInt(),
      shown: json['shown'] as bool,
      body: json['body'] as String,
      title: json['title'] as String,
      isAcked: json['isAcked'] as bool,
      when: DateTime.parse(json['when'] as String),
    );

Map<String, dynamic> _$NotificationModelToJson(_NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shown': instance.shown,
      'body': instance.body,
      'title': instance.title,
      'isAcked': instance.isAcked,
      'when': instance.when.toIso8601String(),
    };
