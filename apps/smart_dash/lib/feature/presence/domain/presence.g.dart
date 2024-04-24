// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PresenceImpl _$$PresenceImplFromJson(Map<String, dynamic> json) =>
    _$PresenceImpl(
      token: Token.fromJson(json['token'] as Map<String, dynamic>),
      isHome: json['isHome'] as bool,
      when: DateTime.parse(json['when'] as String),
      members: (json['members'] as List<dynamic>)
          .map((e) => Token.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PresenceImplToJson(_$PresenceImpl instance) =>
    <String, dynamic>{
      'token': instance.token.toJson(),
      'isHome': instance.isHome,
      'when': instance.when.toIso8601String(),
      'members': instance.members.map((e) => e.toJson()).toList(),
    };
