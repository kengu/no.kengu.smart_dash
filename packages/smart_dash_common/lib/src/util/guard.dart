import 'dart:async';

import 'package:logging/logging.dart';
import 'package:sentry/sentry.dart';

typedef GuardErrorHandler<T> = GuardError<T> Function(Object error,
    [StackTrace? stackTrace]);

class GuardError<T> implements Exception {
  GuardError(this.cause, this.fatal, this.capture, this.value);
  final T? value;
  final bool fatal;
  final Object cause;
  final bool capture;

  @override
  String toString() {
    return '$cause';
  }
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
    bool capture = true;
    if (onError == null) {
      Logger('$name:$task').severe(error, stackTrace);
    } else {
      final checked = onError(error, stackTrace);
      final value = checked.value;
      if (!checked.fatal && value != null) {
        return value;
      }
      capture = checked.capture;
    }
    if (capture) {
      unawaited(
        Sentry.captureException(error, stackTrace: stackTrace),
      );
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
  GuardErrorHandler<T>? onError,
}) {
  final trx = transaction ? Sentry.startTransaction(name, task) : null;
  try {
    return execute();
  } catch (error, stackTrace) {
    bool capture = true;
    Logger('$name:$task').severe(error, stackTrace);
    if (onError != null) {
      final checked = onError(error, stackTrace);
      final value = checked.value;
      if (!checked.fatal && value != null) {
        return value;
      }
      capture = checked.capture;
    }
    if (capture) {
      unawaited(
        Sentry.captureException(error, stackTrace: stackTrace),
      );
    }
    rethrow;
  } finally {
    trx?.finish();
    if (done != null) {
      done();
    }
  }
}
