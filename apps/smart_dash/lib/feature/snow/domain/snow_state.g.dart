// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snow_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SnowStateImpl _$$SnowStateImplFromJson(Map<String, dynamic> json) =>
    _$SnowStateImpl(
      location: json['location'] as String,
      depth: (json['depth'] as num).toInt(),
      elevation: (json['elevation'] as num).toInt(),
      equivalent: (json['equivalent'] as num).toInt(),
      temperature: (json['temperature'] as num).toDouble(),
      nextUpdate: DateTime.parse(json['nextUpdate'] as String),
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$SnowStateImplToJson(_$SnowStateImpl instance) =>
    <String, dynamic>{
      'location': instance.location,
      'depth': instance.depth,
      'elevation': instance.elevation,
      'equivalent': instance.equivalent,
      'temperature': instance.temperature,
      'nextUpdate': instance.nextUpdate.toIso8601String(),
      'lastUpdated': instance.lastUpdated.toIso8601String(),
    };
