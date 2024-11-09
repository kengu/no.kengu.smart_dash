// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeImpl _$$HomeImplFromJson(Map<String, dynamic> json) => _$HomeImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      members: (json['members'] as List<dynamic>)
          .map((e) => HomeMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      services: (json['services'] as List<dynamic>)
          .map((e) => ServiceConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$HomeImplToJson(_$HomeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'members': instance.members.map((e) => e.toJson()).toList(),
      'services': instance.services.map((e) => e.toJson()).toList(),
      'location': instance.location.toJson(),
    };

_$CurrentHomeImpl _$$CurrentHomeImplFromJson(Map<String, dynamic> json) =>
    _$CurrentHomeImpl(
      homeId: json['homeId'] as String,
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$$CurrentHomeImplToJson(_$CurrentHomeImpl instance) =>
    <String, dynamic>{
      'homeId': instance.homeId,
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
