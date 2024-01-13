// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CameraImpl _$$CameraImplFromJson(Map<String, dynamic> json) => _$CameraImpl(
      name: json['name'] as String,
      motion: json['motion'] == null
          ? null
          : MotionDetectConfig.fromJson(json['motion'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CameraImplToJson(_$CameraImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'motion': instance.motion?.toJson(),
    };

_$MotionDetectConfigImpl _$$MotionDetectConfigImplFromJson(
        Map<String, dynamic> json) =>
    _$MotionDetectConfigImpl(
      enabled: json['enabled'] as bool,
      sensitivity: $enumDecode(
          _$MotionDetectSensitivityLevelEnumMap, json['sensitivity']),
    );

Map<String, dynamic> _$$MotionDetectConfigImplToJson(
        _$MotionDetectConfigImpl instance) =>
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
