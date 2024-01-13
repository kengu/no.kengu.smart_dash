// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_definition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DriverDefinitionImpl _$$DriverDefinitionImplFromJson(
        Map<String, dynamic> json) =>
    _$DriverDefinitionImpl(
      key: json['key'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      instances: json['instances'] as int,
      category: json['category'] as String,
      description: json['description'] as String,
      fields:
          (json['fields'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$DriverDefinitionImplToJson(
        _$DriverDefinitionImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'image': instance.image,
      'instances': instance.instances,
      'category': instance.category,
      'description': instance.description,
      'fields': instance.fields,
    };
