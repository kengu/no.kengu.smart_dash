// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_definition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceDefinitionImpl _$$ServiceDefinitionImplFromJson(
        Map<String, dynamic> json) =>
    _$ServiceDefinitionImpl(
      key: json['key'] as String,
      name: json['name'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      fields:
          (json['fields'] as List<dynamic>).map((e) => e as String).toList(),
      port: json['port'] as int?,
      host: json['host'] as String?,
      device: json['device'] as String?,
    );

Map<String, dynamic> _$$ServiceDefinitionImplToJson(
        _$ServiceDefinitionImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'username': instance.username,
      'password': instance.password,
      'fields': instance.fields,
      'port': instance.port,
      'host': instance.host,
      'device': instance.device,
    };
