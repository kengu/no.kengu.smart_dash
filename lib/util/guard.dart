import 'package:flutter/foundation.dart';
import 'package:sentry/sentry.dart';

/// Perform guarded execution on main isolate
Future<T> guard<T>(Future<T> Function() execute,
    {String name = 'guard()',
    String task = 'execute',
    void Function()? done}) async {
  final transaction = Sentry.startTransaction(name, task);
  try {
    return await execute();
  } catch (e, stackTrace) {
    debugPrint(e.toString());
    debugPrint(stackTrace.toString());
    await Sentry.captureException(e, stackTrace: stackTrace);
    rethrow;
  } finally {
    await transaction.finish();
    if (done != null) {
      done();
    }
  }
}
