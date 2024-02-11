// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountImpl _$$AccountImplFromJson(Map<String, dynamic> json) =>
    _$AccountImpl(
      userId: json['userId'] as String,
      services: (json['services'] as List<dynamic>)
          .map((e) => ServiceConfig.fromJson(e as Map<String, dynamic>))
          .toSet(),
      fname: json['fname'] as String?,
      lname: json['lname'] as String?,
      presence: json['presence'] == null
          ? null
          : Presence.fromJson(json['presence'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AccountImplToJson(_$AccountImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'services': instance.services.map((e) => e.toJson()).toList(),
      'fname': instance.fname,
      'lname': instance.lname,
      'presence': instance.presence?.toJson(),
    };

_$PresenceImpl _$$PresenceImplFromJson(Map<String, dynamic> json) =>
    _$PresenceImpl(
      ipAddress: json['ipAddress'] as String,
      deviceName: json['deviceName'] as String,
      macAddress: json['macAddress'] as String?,
    );

Map<String, dynamic> _$$PresenceImplToJson(_$PresenceImpl instance) =>
    <String, dynamic>{
      'ipAddress': instance.ipAddress,
      'deviceName': instance.deviceName,
      'macAddress': instance.macAddress,
    };
