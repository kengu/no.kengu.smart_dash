// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeatherForecastDevice _$WeatherForecastDeviceFromJson(
        Map<String, dynamic> json) =>
    _WeatherForecastDevice(
      service: json['service'] as String,
      state: WeatherState.fromJson(json['state'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherForecastDeviceToJson(
        _WeatherForecastDevice instance) =>
    <String, dynamic>{
      'service': instance.service,
      'state': instance.state.toJson(),
    };
