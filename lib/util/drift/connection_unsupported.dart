import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Never _unsupported() {
  throw UnsupportedError(
      'No suitable database implementation was found on this platform.');
}

// Fails on unsupported platforms
DatabaseConnection connectDrift(
  Ref ref,
  String dbName, {
  bool logStatements = false,
  bool inMemory = false,
}) =>
    _unsupported();

Future<void> validateDatabaseSchema(GeneratedDatabase database) async {
  _unsupported();
}
