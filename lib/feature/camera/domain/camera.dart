import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'camera.freezed.dart';
part 'camera.g.dart';

@freezed
class Camera with _$Camera {
  const Camera._();
  const factory Camera({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'motion') required MotionDetectConfig? motion,
  }) = _Camera;

  factory Camera.fromJson(Map<String, Object?> json) => _$CameraFromJson(json);
}

class CameraSnapshot {
  CameraSnapshot(this.bytes);
  final Uint8List bytes;
}

@freezed
class MotionDetectConfig with _$MotionDetectConfig {
  const MotionDetectConfig._();
  const factory MotionDetectConfig({
    @JsonKey(name: 'enabled') required bool enabled,
    @JsonKey(name: 'sensitivity')
    required MotionDetectSensitivityLevel sensitivity,
  }) = _MotionDetectConfig;

  factory MotionDetectConfig.fromJson(Map<String, Object?> json) =>
      _$MotionDetectConfigFromJson(json);
}

enum MotionDetectSensitivityLevel {
  low(0),
  normal(1),
  high(2),
  lower(3),
  lowest(4);

  const MotionDetectSensitivityLevel(this.value);
  final int value;
}
