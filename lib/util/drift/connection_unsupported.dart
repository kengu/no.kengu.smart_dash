import 'package:drift/drift.dart';

// Fails on unsupported platforms
DatabaseConnection connectDrift(
  String dbName, {
  bool logStatements = false,
  bool inMemory = false,
}) =>
    throw UnimplementedError();
