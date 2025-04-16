// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_now_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeatherNowDevice _$WeatherNowDeviceFromJson(Map<String, dynamic> json) =>
    _WeatherNowDevice(
      service: json['service'] as String,
      state: WeatherState.fromJson(json['state'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherNowDeviceToJson(_WeatherNowDevice instance) =>
    <String, dynamic>{
      'service': instance.service,
      'state': instance.state.toJson(),
    };
