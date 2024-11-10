import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_dev/api/migrations.dart';
import 'package:path/path.dart' as p;
import 'package:riverpod/riverpod.dart';

import 'connection.dart';

DatabaseConnection connectDrift(
  Ref ref, {
  required String dbName,
  required String dbPath,
  bool logStatements = false,
  bool inMemory = false,
}) {
  return ref.read(connectionManagerProvider).add(
    DatabaseConnection.delayed(
      Future.sync(() async {
        if (inMemory) {
          return DatabaseConnection(
            NativeDatabase.memory(logStatements: logStatements),
          );
        }
        final file = File(p.join(dbPath, dbName));
        return DatabaseConnection(NativeDatabase.createInBackground(
          file,
          logStatements: logStatements,
        ));
      }),
    ),
  );
}

Future<void> validateDatabaseSchema(GeneratedDatabase database,
    [bool debug = false]) async {
  // This method validates that the actual schema of the opened database matches
  // the tables, views, triggers and indices for which drift_dev has generated
  // code.
  // Validating the database's schema after opening it is generally a good idea,
  // since it allows us to get an early warning if we change a table definition
  // without writing a schema migration for it.
  //
  // For details, see: https://drift.simonbinder.eu/docs/advanced-features/migrations/#verifying-a-database-schema-at-runtime
  if (debug) {
    await VerifySelf(database).validateDatabaseSchema();

    final wrongForeignKeys =
        await database.customSelect('PRAGMA foreign_key_check').get();

    assert(wrongForeignKeys.isEmpty, '${wrongForeignKeys.map((e) => e.data)}');
  }
}
