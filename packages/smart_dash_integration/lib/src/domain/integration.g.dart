// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'integration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Integration _$IntegrationFromJson(Map<String, dynamic> json) => _Integration(
      key: json['key'] as String,
      name: json['name'] as String,
      system: json['system'] as bool,
      image: json['image'] as String,
      enabled: json['enabled'] as bool,
      instances: (json['instances'] as num).toInt(),
      category: json['category'] as String,
      description: json['description'] as String,
      type: $enumDecode(_$IntegrationTypeEnumMap, json['type']),
      dependsOn:
          (json['dependsOn'] as List<dynamic>).map((e) => e as String).toList(),
      fields: (json['fields'] as List<dynamic>)
          .map((e) => $enumDecode(_$IntegrationFieldEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$IntegrationToJson(_Integration instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'system': instance.system,
      'image': instance.image,
      'enabled': instance.enabled,
      'instances': instance.instances,
      'category': instance.category,
      'description': instance.description,
      'type': _$IntegrationTypeEnumMap[instance.type]!,
      'dependsOn': instance.dependsOn,
      'fields':
          instance.fields.map((e) => _$IntegrationFieldEnumMap[e]!).toList(),
    };

const _$IntegrationTypeEnumMap = {
  IntegrationType.mqtt: 'mqtt',
  IntegrationType.device: 'device',
  IntegrationType.location: 'location',
  IntegrationType.camera: 'camera',
  IntegrationType.weather: 'weather',
  IntegrationType.snow: 'snow',
};

const _$IntegrationFieldEnumMap = {
  IntegrationField.id: 'id',
  IntegrationField.host: 'host',
  IntegrationField.port: 'port',
  IntegrationField.username: 'username',
  IntegrationField.password: 'password',
  IntegrationField.topics: 'topics',
};
