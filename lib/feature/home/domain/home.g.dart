// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeImpl _$$HomeImplFromJson(Map<String, dynamic> json) => _$HomeImpl(
      name: json['name'] as String,
      members: (json['members'] as List<dynamic>)
          .map((e) => HomeMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      services: (json['services'] as List<dynamic>)
          .map((e) => ServiceConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      address: json['address'] as String?,
    );

Map<String, dynamic> _$$HomeImplToJson(_$HomeImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'members': instance.members.map((e) => e.toJson()).toList(),
      'services': instance.services.map((e) => e.toJson()).toList(),
      'address': instance.address,
    };

_$CurrentHomeImpl _$$CurrentHomeImplFromJson(Map<String, dynamic> json) =>
    _$CurrentHomeImpl(
      name: json['name'] as String,
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$$CurrentHomeImplToJson(_$CurrentHomeImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'userId': instance.userId,
    };

_$HomeMemberImpl _$$HomeMemberImplFromJson(Map<String, dynamic> json) =>
    _$HomeMemberImpl(
      key: json['key'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$HomeMemberImplToJson(_$HomeMemberImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
    };
