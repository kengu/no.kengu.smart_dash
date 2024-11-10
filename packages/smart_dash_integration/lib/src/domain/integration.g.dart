// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'integration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IntegrationImpl _$$IntegrationImplFromJson(Map<String, dynamic> json) =>
    _$IntegrationImpl(
      key: json['key'] as String,
      name: json['name'] as String,
      system: json['system'] as bool,
      image: json['image'] as String,
      enabled: json['enabled'] as bool,
      instances: (json['instances'] as num).toInt(),
      category: json['category'] as String,
      description: json['description'] as String,
      fields: (json['fields'] as List<dynamic>)
          .map((e) => $enumDecode(_$ServiceFieldEnumMap, e))
          .toList(),
      features: (json['features'] as List<dynamic>)
          .map((e) => $enumDecode(_$IntegrationFeatureEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$$IntegrationImplToJson(_$IntegrationImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'system': instance.system,
      'image': instance.image,
      'enabled': instance.enabled,
      'instances': instance.instances,
      'category': instance.category,
      'description': instance.description,
      'fields': instance.fields.map((e) => _$ServiceFieldEnumMap[e]!).toList(),
      'features': instance.features
          .map((e) => _$IntegrationFeatureEnumMap[e]!)
          .toList(),
    };

const _$ServiceFieldEnumMap = {
  ServiceField.device: 'device',
  ServiceField.host: 'host',
  ServiceField.port: 'port',
  ServiceField.username: 'username',
  ServiceField.password: 'password',
  ServiceField.topics: 'topics',
};

const _$IntegrationFeatureEnumMap = {
  IntegrationFeature.data: 'data',
  IntegrationFeature.device: 'device',
  IntegrationFeature.camera: 'camera',
  IntegrationFeature.weather: 'weather',
  IntegrationFeature.snow: 'snow',
};
