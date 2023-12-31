import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:drift_dev/api/migrations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:smart_dash/util/drift/connection.dart';

DatabaseConnection connectDrift(
  Ref ref,
  String dbName, {
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
        final dbFolder = await getApplicationDocumentsDirectory();
        final file = File(p.join(dbFolder.path, dbName));
        return DatabaseConnection(NativeDatabase.createInBackground(
          file,
          logStatements: logStatements,
        ));
      }),
    ),
  );
}

Future<void> validateDatabaseSchema(GeneratedDatabase database) async {
  // This method validates that the actual schema of the opened database matches
  // the tables, views, triggers and indices for which drift_dev has generated
  // code.
  // Validating the database's schema after opening it is generally a good idea,
  // since it allows us to get an early warning if we change a table definition
  // without writing a schema migration for it.
  //
  // For details, see: https://drift.simonbinder.eu/docs/advanced-features/migrations/#verifying-a-database-schema-at-runtime
  if (kDebugMode) {
    await VerifySelf(database).validateDatabaseSchema();

    final wrongForeignKeys =
        await database.customSelect('PRAGMA foreign_key_check').get();

    assert(wrongForeignKeys.isEmpty, '${wrongForeignKeys.map((e) => e.data)}');
  }
}
