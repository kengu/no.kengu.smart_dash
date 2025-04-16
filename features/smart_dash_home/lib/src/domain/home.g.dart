// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Home _$HomeFromJson(Map<String, dynamic> json) => _Home(
      id: json['id'] as String,
      name: json['name'] as String,
      members: (json['members'] as List<dynamic>)
          .map((e) => HomeMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      services: (json['services'] as List<dynamic>)
          .map((e) => ServiceConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      baseUrl: json['baseUrl'] as String?,
    );

Map<String, dynamic> _$HomeToJson(_Home instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'members': instance.members.map((e) => e.toJson()).toList(),
      'services': instance.services.map((e) => e.toJson()).toList(),
      'location': instance.location.toJson(),
      'baseUrl': instance.baseUrl,
    };

_CurrentHome _$CurrentHomeFromJson(Map<String, dynamic> json) => _CurrentHome(
      homeId: json['homeId'] as String,
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$CurrentHomeToJson(_CurrentHome instance) =>
    <String, dynamic>{
      'homeId': instance.homeId,
      'userId': instance.userId,
    };

_HomeMember _$HomeMemberFromJson(Map<String, dynamic> json) => _HomeMember(
      key: json['key'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$HomeMemberToJson(_HomeMember instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
    };
