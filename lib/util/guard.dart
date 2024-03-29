import 'package:flutter/foundation.dart';
import 'package:sentry/sentry.dart';

/// Perform guarded execution on main isolate
Future<T> guard<T>(
  Future<T> Function() execute, {
  String name = 'guard()',
  String task = 'execute',
  void Function()? done,
  bool transaction = false,
}) async {
  final trx = transaction ? Sentry.startTransaction(name, task) : null;
  try {
    return await execute();
  } catch (e, stackTrace) {
    debugPrint(e.toString());
    debugPrint(stackTrace.toString());
    await Sentry.captureException(e, stackTrace: stackTrace);
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
}) {
  final trx = transaction ? Sentry.startTransaction(name, task) : null;
  try {
    return execute();
  } catch (e, stackTrace) {
    debugPrint(e.toString());
    debugPrint(stackTrace.toString());
    Sentry.captureException(e, stackTrace: stackTrace);
    rethrow;
  } finally {
    trx?.finish();
    if (done != null) {
      done();
    }
  }
}
