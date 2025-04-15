import 'package:dio/dio.dart';
import 'package:logging/logging.dart';
import 'package:sentry/sentry.dart';

typedef GuardErrorHandler<T> = GuardError<T> Function(Object error,
    [StackTrace? stackTrace]);

class GuardError<T> {
  GuardError(this.cause, this.fatal, this.value);
  final T? value;
  final bool fatal;
  final Object cause;
}

/// Perform guarded execution on main isolate
Future<T> guard<T>(
  Future<T> Function() execute, {
  String name = 'guard()',
  String task = 'execute',
  void Function()? done,
  bool transaction = false,
  GuardErrorHandler<T>? onError,
}) async {
  final trx = transaction ? Sentry.startTransaction(name, task) : null;
  try {
    return await execute();
  } catch (error, stackTrace) {
    Logger(name).severe('error captured', error, stackTrace);
    if (onError != null) {
      final handle = onError(error, stackTrace);
      if (!handle.fatal && handle.value != null) {
        return Future.value(handle.value);
      }
    }
    await Sentry.captureException(error, stackTrace: stackTrace);
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
GuardError<T> check_client_error<T>(Object error,
    [StackTrace? stackTrace, T? use]) {
  switch (error) {
    case DioException _:
      return switch (error.type) {
        // Connectivity cases (not captured)
        DioExceptionType.cancel => GuardError<T>(error, false, use),
        DioExceptionType.sendTimeout => GuardError<T>(error, false, use),
        DioExceptionType.receiveTimeout => GuardError<T>(error, false, use),
        DioExceptionType.connectionError => GuardError<T>(error, false, use),
        DioExceptionType.connectionTimeout => GuardError<T>(error, false, use),
        // Reported error cases (captured)
        DioExceptionType.unknown => GuardError<T>(error, true, use),
        DioExceptionType.badResponse => GuardError<T>(error, true, use),
        DioExceptionType.badCertificate => GuardError<T>(error, true, use),
      };
  }
  return GuardError<T>(error, true, use);
}
