import 'package:optional/optional_internal.dart';
import 'package:smart_dash/feature/account/domain/service_config.dart';
import 'package:smart_dash/feature/camera/domain/camera.dart';

abstract class CameraService {
  CameraService({required this.key});

  final String key;

  Optional<List<ServiceConfig>> getCachedConfigs();

  Future<List<ServiceConfig>> getConfigs(
      {Duration ttl = const Duration(seconds: 4)});

  Future<List<Camera>> getCameras({
    Duration ttl = const Duration(seconds: 4),
  });

  Optional<List<Camera>> getCachedCameras();

  Future<Optional<Camera>> getCamera(
    String name, {
    Duration ttl = const Duration(seconds: 4),
  });

  Optional<Camera> getCachedCamera(String name);

  Future<Optional<CameraSnapshot>> getSnapshot(
    Camera device, {
    Duration ttl = const Duration(seconds: 4),
  });

  Optional<CameraSnapshot> getCachedSnapshot(Camera device);

  Future<Optional<MotionDetectConfig>> getMotionConfig(String name);

  Future<Optional<MotionDetectConfig>> setMotionConfig(
    String name, {
    bool? enabled,
    MotionDetectSensitivityLevel? sensitivity,
  });
}
