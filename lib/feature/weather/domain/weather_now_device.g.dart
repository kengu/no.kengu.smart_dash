// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_now_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherNowDeviceImpl _$$WeatherNowDeviceImplFromJson(
        Map<String, dynamic> json) =>
    _$WeatherNowDeviceImpl(
      state: Weather.fromJson(json['state'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WeatherNowDeviceImplToJson(
        _$WeatherNowDeviceImpl instance) =>
    <String, dynamic>{
      'state': instance.state.toJson(),
    };
