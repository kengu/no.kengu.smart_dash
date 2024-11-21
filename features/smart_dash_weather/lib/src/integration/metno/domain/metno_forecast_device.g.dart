// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metno_forecast_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MetNoForecastDeviceImpl _$$MetNoForecastDeviceImplFromJson(
        Map<String, dynamic> json) =>
    _$MetNoForecastDeviceImpl(
      state: WeatherState.fromJson(json['state'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MetNoForecastDeviceImplToJson(
        _$MetNoForecastDeviceImpl instance) =>
    <String, dynamic>{
      'state': instance.state.toJson(),
    };
