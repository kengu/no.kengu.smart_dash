import 'package:drift/drift.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
    debugPrint('Disposing connections: ${_connections.length}');
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
