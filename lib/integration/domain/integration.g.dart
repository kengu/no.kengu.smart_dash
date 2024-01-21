// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'integration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IntegrationImpl _$$IntegrationImplFromJson(Map<String, dynamic> json) =>
    _$IntegrationImpl(
      key: json['key'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      instances: json['instances'] as int,
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
      'image': instance.image,
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
};

const _$IntegrationFeatureEnumMap = {
  IntegrationFeature.data: 'data',
  IntegrationFeature.device: 'device',
  IntegrationFeature.camera: 'camera',
};
