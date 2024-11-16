// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceConfigImpl _$$ServiceConfigImplFromJson(Map<String, dynamic> json) =>
    _$ServiceConfigImpl(
      key: json['key'] as String,
      name: json['name'] as String,
      data: (json['data'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry($enumDecode(_$IntegrationFieldEnumMap, k), e as String),
      ),
    );

Map<String, dynamic> _$$ServiceConfigImplToJson(_$ServiceConfigImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'data': instance.data
          .map((k, e) => MapEntry(_$IntegrationFieldEnumMap[k]!, e)),
    };

const _$IntegrationFieldEnumMap = {
  IntegrationField.id: 'id',
  IntegrationField.host: 'host',
  IntegrationField.port: 'port',
  IntegrationField.username: 'username',
  IntegrationField.password: 'password',
  IntegrationField.topics: 'topics',
};
