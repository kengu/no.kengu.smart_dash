import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

abstract class DioClient {
  DioClient(this.api);

  final Dio api;

  Logger get log => Logger('$runtimeType');

  void close({bool force = false}) {
    api.close(force: force);
  }
}
