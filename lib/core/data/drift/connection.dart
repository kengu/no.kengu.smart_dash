import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry/sentry.dart';

export 'connection_unsupported.dart'
    if (dart.library.ffi) 'connection_native.dart'
    if (dart.library.html) 'connection_web.dart';

part 'connection.g.dart';

@Riverpod(keepAlive: true)
ConnectionManager connectionManager(ConnectionManagerRef ref) {
  return ConnectionManager();
}

class ConnectionManager {
  final _connections = <DatabaseConnection>{};

  DatabaseConnection add(DatabaseConnection cnn) {
    _connections.add(cnn);
    return cnn;
  }

  Future<void> dispose() {
    Logger('$ConnectionManager').info(
      'Disposing connections: ${_connections.length}',
    );
    return Future.wait(_connections.map(
      (e) => e.close(),
    ));
  }
}

mixin ConnectionDisposer<T extends GeneratedDatabase> on GeneratedDatabase {
  T autoDispose(Ref ref) {
    ref.onDispose(close);
    return this as T;
  }
}

mixin DatabaseHelper<T extends GeneratedDatabase> on GeneratedDatabase {
  void logOnUpgrade(int from, int to) {
    if (kDebugMode) {
      Logger('$ConnectionManager').info(
        '$T: Migration [v$from->v$to] started',
      );
    } else {
      Sentry.captureMessage(
        '$T: Migration [v$from->v$to] started',
      );
    }
  }

  void logHadUpgrade(OpeningDetails details, int modifications) {
    if (kDebugMode) {
      Logger('$ConnectionManager').info(
        '$T: Migration '
        '[v${details.versionBefore}->v${details.versionNow}] '
        'modified $modifications rows',
      );
    } else {
      Sentry.captureMessage(
        '$T: Migration '
        '[v${details.versionBefore}->v${details.versionNow}] '
        'modified $modifications rows',
      );
    }
  }
}
