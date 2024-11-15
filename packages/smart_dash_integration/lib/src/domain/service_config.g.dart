// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceConfigImpl _$$ServiceConfigImplFromJson(Map<String, dynamic> json) =>
    _$ServiceConfigImpl(
      key: json['key'] as String,
      name: json['name'] as String,
      fields: (json['fields'] as List<dynamic>)
          .map((e) => $enumDecode(_$ServiceFieldEnumMap, e))
          .toList(),
      port: (json['port'] as num?)?.toInt(),
      host: json['host'] as String?,
      device: json['device'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
      topics: json['topics'] as String?,
    );

Map<String, dynamic> _$$ServiceConfigImplToJson(_$ServiceConfigImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'fields': instance.fields.map((e) => _$ServiceFieldEnumMap[e]!).toList(),
      'port': instance.port,
      'host': instance.host,
      'device': instance.device,
      'username': instance.username,
      'password': instance.password,
      'topics': instance.topics,
    };

const _$ServiceFieldEnumMap = {
  ServiceField.device: 'device',
  ServiceField.host: 'host',
  ServiceField.port: 'port',
  ServiceField.username: 'username',
  ServiceField.password: 'password',
  ServiceField.topics: 'topics',
};
