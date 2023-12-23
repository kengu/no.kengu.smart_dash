import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
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
