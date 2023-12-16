import 'dart:async';

import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';
import 'package:logging/logging.dart';

DatabaseConnection connectDrift(
  String dbName, {
  bool logStatements = false,
  bool inMemory = false,
}) {
  return DatabaseConnection.delayed(Future.sync(() async {
    final result = await WasmDatabase.open(
      databaseName: dbName, // prefer to only use valid identifiers here
      sqlite3Uri: Uri.parse('sqlite3.wasm'),
      driftWorkerUri: Uri.parse('drift_worker.dart.js'),
    );

    if (result.missingFeatures.isNotEmpty) {
      // Depending how central local persistence is to your app, you may want
      // to show a warning to the user if only unreliable implementations
      // are available.
      final logger = Logger('Drift');

      logger.warning(
        'Using ${result.chosenImplementation} '
        'due to missing browser features: ${result.missingFeatures}',
      );
    }

    return result.resolvedExecutor;
  }));
}
