import 'package:optional/optional.dart';
import 'package:smart_dash/feature/camera/domain/camera.dart';

abstract class CameraClient {
  Future<Optional<Camera>> getCamera();

  Future<Optional<MotionDetectConfig>> getMotionConfig();

  Future<Optional<MotionDetectConfig>> setMotionConfig(
      String name, MotionDetectConfig config);

  Future<Optional<CameraSnapshot>> getSnapshot();

  void close();
}
