import 'package:optional/optional.dart';
import 'package:smart_dash_camera/smart_dash_camera.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

abstract class CameraClient {
  CameraClient({required this.config});

  final ServiceConfig config;

  Future<Optional<Camera>> getCamera();

  Future<Optional<CameraSnapshot>> getSnapshot();

  Future<Optional<MotionDetectConfig>> getMotionConfig();

  Future<Optional<MotionDetectConfig>> setMotionConfig(
      MotionDetectConfig config);

  void close();
}
