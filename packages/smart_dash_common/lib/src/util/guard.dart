import 'package:dio/dio.dart';
import 'package:logging/logging.dart';
import 'package:sentry/sentry.dart';

/// Perform guarded execution on main isolate
Future<T> guard<T>(
  Future<T> Function() execute, {
  String name = 'guard()',
  String task = 'execute',
  void Function()? done,
  bool transaction = false,
  bool Function(Object error, [StackTrace? stackTrace])? error,
}) async {
  final trx = transaction ? Sentry.startTransaction(name, task) : null;
  try {
    return await execute();
  } catch (e, stackTrace) {
    Logger(name).severe('error captured', e, stackTrace);
    if (error == null || error(e, stackTrace)) {
      await Sentry.captureException(e, stackTrace: stackTrace);
    }
    rethrow;
  } finally {
    await trx?.finish();
    if (done != null) {
      done();
    }
  }
}

T guardSync<T>(
  T Function() execute, {
  String name = 'guardSync()',
  String task = 'execute',
  void Function()? done,
  bool transaction = false,
  bool Function(Object error, [StackTrace? stackTrace])? error,
}) {
  final trx = transaction ? Sentry.startTransaction(name, task) : null;
  try {
    return execute();
  } catch (e, stackTrace) {
    Logger(name).severe('error captured', e, stackTrace);
    if (error == null || error(e, stackTrace)) {
      Sentry.captureException(e, stackTrace: stackTrace);
    }
    rethrow;
  } finally {
    trx?.finish();
    if (done != null) {
      done();
    }
  }
}

// TODO: Move to smart_dash_common?
bool check_client_error(Object error, [StackTrace? stackTrace]) {
  switch (error) {
    case DioException _:
      return switch (error.type) {
        // Connectivity cases (not captured)
        DioExceptionType.cancel => false,
        DioExceptionType.sendTimeout => false,
        DioExceptionType.receiveTimeout => false,
        DioExceptionType.connectionError => false,
        DioExceptionType.connectionTimeout => false,
        // Reported error cases (captured)
        DioExceptionType.unknown => true,
        DioExceptionType.badResponse => true,
        DioExceptionType.badCertificate => true,
      };
  }
  return true;
}
