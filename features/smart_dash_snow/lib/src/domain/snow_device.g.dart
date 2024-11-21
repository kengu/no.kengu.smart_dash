// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snow_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SnowDeviceImpl _$$SnowDeviceImplFromJson(Map<String, dynamic> json) =>
    _$SnowDeviceImpl(
      state: SnowState.fromJson(json['state'] as Map<String, dynamic>),
      service: json['service'] as String,
    );

Map<String, dynamic> _$$SnowDeviceImplToJson(_$SnowDeviceImpl instance) =>
    <String, dynamic>{
      'state': instance.state.toJson(),
      'service': instance.service,
    };
