// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Camera _$CameraFromJson(Map<String, dynamic> json) => _Camera(
      name: json['name'] as String,
      service: json['service'] as String,
      motion: json['motion'] == null
          ? null
          : MotionDetectConfig.fromJson(json['motion'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CameraToJson(_Camera instance) => <String, dynamic>{
      'name': instance.name,
      'service': instance.service,
      'motion': instance.motion?.toJson(),
    };

_MotionDetectConfig _$MotionDetectConfigFromJson(Map<String, dynamic> json) =>
    _MotionDetectConfig(
      enabled: json['enabled'] as bool,
      sensitivity: $enumDecode(
          _$MotionDetectSensitivityLevelEnumMap, json['sensitivity']),
    );

Map<String, dynamic> _$MotionDetectConfigToJson(_MotionDetectConfig instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'sensitivity':
          _$MotionDetectSensitivityLevelEnumMap[instance.sensitivity]!,
    };

const _$MotionDetectSensitivityLevelEnumMap = {
  MotionDetectSensitivityLevel.low: 'low',
  MotionDetectSensitivityLevel.normal: 'normal',
  MotionDetectSensitivityLevel.high: 'high',
  MotionDetectSensitivityLevel.lower: 'lower',
  MotionDetectSensitivityLevel.lowest: 'lowest',
};
