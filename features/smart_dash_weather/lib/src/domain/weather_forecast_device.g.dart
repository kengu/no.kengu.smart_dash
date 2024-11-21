// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherForecastDeviceImpl _$$WeatherForecastDeviceImplFromJson(
        Map<String, dynamic> json) =>
    _$WeatherForecastDeviceImpl(
      service: json['service'] as String,
      state: WeatherState.fromJson(json['state'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WeatherForecastDeviceImplToJson(
        _$WeatherForecastDeviceImpl instance) =>
    <String, dynamic>{
      'service': instance.service,
      'state': instance.state.toJson(),
    };
