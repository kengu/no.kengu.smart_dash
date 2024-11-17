import 'package:optional/optional.dart';
import 'package:smart_dash_account/smart_dash_account.dart';
import 'package:smart_dash_app/feature/camera/domain/camera.dart';

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
