// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nysny_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NySnySensor _$NySnySensorFromJson(Map<String, dynamic> json) => _NySnySensor(
      id: json['id'] as String,
      data: NySnySensorData.fromJson(json['data'] as Map<String, dynamic>),
      meta: NySnySensorMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NySnySensorToJson(_NySnySensor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'data': instance.data.toJson(),
      'meta': instance.meta.toJson(),
    };

_NySnySensorMeta _$NySnySensorMetaFromJson(Map<String, dynamic> json) =>
    _NySnySensorMeta(
      name: json['locationname'] as String,
      active: _boolFromString(json['active']),
      road: json['road'] as String,
      lat: json['lat'] as String,
      lon: json['lon'] as String,
      alt: json['moh'] as String,
    );

Map<String, dynamic> _$NySnySensorMetaToJson(_NySnySensorMeta instance) =>
    <String, dynamic>{
      'locationname': instance.name,
      'active': _boolToString(instance.active),
      'road': instance.road,
      'lat': instance.lat,
      'lon': instance.lon,
      'moh': instance.alt,
    };

_NySnySensorData _$NySnySensorDataFromJson(Map<String, dynamic> json) =>
    _NySnySensorData(
      time: DateTime.parse(json['time'] as String),
      depth: (json['snowdept'] as num).toDouble(),
      load: (json['loadsqm'] as num).toDouble(),
      airtemp: (json['airtemp'] as num).toDouble(),
      voltage: (json['voltage'] as num).toDouble(),
      nextTime: DateTime.parse(json['nexttime'] as String),
      valid: _boolFromString(json['valid']),
      badReading: _boolFromString(json['badreading']),
    );

Map<String, dynamic> _$NySnySensorDataToJson(_NySnySensorData instance) =>
    <String, dynamic>{
      'time': instance.time.toIso8601String(),
      'snowdept': instance.depth,
      'loadsqm': instance.load,
      'airtemp': instance.airtemp,
      'voltage': instance.voltage,
      'nexttime': instance.nextTime.toIso8601String(),
      'valid': _boolToString(instance.valid),
      'badreading': _boolToString(instance.badReading),
    };
