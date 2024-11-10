import 'package:drift/drift.dart';
import 'package:riverpod/riverpod.dart';

Never _unsupported() {
  throw UnsupportedError(
      'No suitable database implementation was found on this platform.');
}

// Fails on unsupported platforms
DatabaseConnection connectDrift(
  Ref ref, {
  required String dbName,
  required String dbPath,
  bool logStatements = false,
  bool inMemory = false,
}) =>
    _unsupported();

Future<void> validateDatabaseSchema(GeneratedDatabase database) async {
  _unsupported();
}
