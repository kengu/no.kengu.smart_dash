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

GuardError<T> checkDioError<T>(Object error,
    [StackTrace? stackTrace, bool capture = true, T? use]) {
  if (error is GuardError<T>) {
    return error;
  }

  final nge = GuardError<T>.new;
  switch (error) {
    case DioException _:
      return switch (error.type) {
        // Connectivity cases (not captured)
        DioExceptionType.cancel => nge(error, false, capture, use),
        DioExceptionType.sendTimeout => nge(error, false, capture, use),
        DioExceptionType.receiveTimeout => nge(error, false, capture, use),
        DioExceptionType.connectionError => nge(error, false, capture, use),
        DioExceptionType.connectionTimeout => nge(error, false, capture, use),
        // Reported error cases (captured)
        DioExceptionType.unknown => nge(error, true, capture, use),
        DioExceptionType.badResponse => nge(error, true, capture, use),
        DioExceptionType.badCertificate => nge(error, true, capture, use),
      };
  }
  return nge(error, true, capture, use);
}
