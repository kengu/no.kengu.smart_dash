// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountImpl _$$AccountImplFromJson(Map<String, dynamic> json) =>
    _$AccountImpl(
      userId: json['userId'] as String,
      services: (json['services'] as List<dynamic>)
          .map((e) => ServiceDefinition.fromJson(e as Map<String, dynamic>))
          .toSet(),
      fname: json['fname'] as String?,
      lname: json['lname'] as String?,
    );

Map<String, dynamic> _$$AccountImplToJson(_$AccountImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'services': instance.services.map((e) => e.toJson()).toList(),
      'fname': instance.fname,
      'lname': instance.lname,
    };
