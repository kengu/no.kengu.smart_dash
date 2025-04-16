// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeatherResponse _$WeatherResponseFromJson(Map<String, dynamic> json) =>
    _WeatherResponse(
      data: WeatherState.fromJson(json['data'] as Map<String, dynamic>),
      expires: DateTime.parse(json['expires'] as String),
      lastModified: DateTime.parse(json['last_modified'] as String),
    );

Map<String, dynamic> _$WeatherResponseToJson(_WeatherResponse instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
      'expires': instance.expires.toIso8601String(),
      'last_modified': instance.lastModified.toIso8601String(),
    };
