import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:riverpod/riverpod.dart';
import 'package:smart_dash_account/smart_dash_account.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_datasource/smart_dash_datasource.dart';

part 'account_database.g.dart';

@DriftDatabase(include: {'account.drift'})
class AccountDatabase extends _$AccountDatabase
    with ConnectionDisposer<AccountDatabase> {
  AccountDatabase(Ref ref, String dbPath)
      : super(connectDrift(ref, dbName: 'account.sqlite', dbPath: dbPath));
  @override
  int get schemaVersion => 1;

  Future<void> deleteAll() async {
    await customStatement('PRAGMA foreign_keys = OFF');
    try {
      transaction(() async {
        for (final table in allTables) {
          await delete(table).go();
        }
      });
    } finally {
      await customStatement('PRAGMA foreign_keys = ON');
    }
  }
}

class UsersConverter extends TypeConverter<List<User>, String>
    with JsonTypeConverter<List<User>, String> {
  const UsersConverter();

  @override
  List<User> fromSql(String fromDb) {
    final items = jsonDecode(fromDb) as List<JsonObject>;
    return items.map(User.fromJson).toList();
  }

  @override
  String toSql(List<User> value) {
    return json.encode(value.map((e) => e.toJson()));
  }
}

class HomesConverter extends TypeConverter<List<Home>, String>
    with JsonTypeConverter<List<Home>, String> {
  const HomesConverter();

  @override
  List<Home> fromSql(String fromDb) {
    final items = jsonDecode(fromDb) as List<JsonObject>;
    return items.map(Home.fromJson).toList();
  }

  @override
  String toSql(List<Home> value) {
    return json.encode(value.map((e) => e.toJson()));
  }
}
