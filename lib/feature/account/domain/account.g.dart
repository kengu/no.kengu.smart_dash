// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountImpl _$$AccountImplFromJson(Map<String, dynamic> json) =>
    _$AccountImpl(
      userId: json['userId'] as String,
      fname: json['fname'] as String?,
      lname: json['lname'] as String?,
      homes: (json['homes'] as List<dynamic>?)
          ?.map((e) => AccountHome.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AccountImplToJson(_$AccountImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'fname': instance.fname,
      'lname': instance.lname,
      'homes': instance.homes?.map((e) => e.toJson()).toList(),
    };

_$AccountHomeImpl _$$AccountHomeImplFromJson(Map<String, dynamic> json) =>
    _$AccountHomeImpl(
      name: json['name'] as String,
      services: (json['services'] as List<dynamic>)
          .map((e) => ServiceConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      members: (json['members'] as List<dynamic>)
          .map((e) => AccountHomeMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      address: json['address'] as String?,
    );

Map<String, dynamic> _$$AccountHomeImplToJson(_$AccountHomeImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'services': instance.services.map((e) => e.toJson()).toList(),
      'members': instance.members.map((e) => e.toJson()).toList(),
      'address': instance.address,
    };

_$AccountHomeMemberImpl _$$AccountHomeMemberImplFromJson(
        Map<String, dynamic> json) =>
    _$AccountHomeMemberImpl(
      key: json['key'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$AccountHomeMemberImplToJson(
        _$AccountHomeMemberImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
    };
