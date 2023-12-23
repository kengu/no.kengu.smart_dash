import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Fails on unsupported platforms
DatabaseConnection connectDrift(
  Ref ref,
  String dbName, {
  bool logStatements = false,
  bool inMemory = false,
}) =>
    throw UnimplementedError();
