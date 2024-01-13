import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dash/feature/camera/domain/camera.dart';

part 'camera_response.freezed.dart';
part 'camera_response.g.dart';

@freezed
class CameraResponse with _$CameraResponse {
  const factory CameraResponse({
    @JsonKey(name: 'data') required Camera data,
  }) = _CameraResponse;

  factory CameraResponse.fromJson(Map<String, Object?> json) =>
      _$CameraResponseFromJson(json);
}
