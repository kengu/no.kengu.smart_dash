// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snow_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SnowDevice _$SnowDeviceFromJson(Map<String, dynamic> json) => _SnowDevice(
      state: SnowState.fromJson(json['state'] as Map<String, dynamic>),
      service: json['service'] as String,
    );

Map<String, dynamic> _$SnowDeviceToJson(_SnowDevice instance) =>
    <String, dynamic>{
      'state': instance.state.toJson(),
      'service': instance.service,
    };
