// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metno_forecast_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MetNoForecastDevice _$MetNoForecastDeviceFromJson(Map<String, dynamic> json) =>
    _MetNoForecastDevice(
      state: WeatherState.fromJson(json['state'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MetNoForecastDeviceToJson(
        _MetNoForecastDevice instance) =>
    <String, dynamic>{
      'state': instance.state.toJson(),
    };
