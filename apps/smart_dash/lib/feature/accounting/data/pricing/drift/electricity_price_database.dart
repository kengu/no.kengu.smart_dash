import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_dash_datasource/smart_dash_datasource.dart';

part 'electricity_price_database.g.dart';

@DriftDatabase(include: {'electricity_price.drift'})
class ElectricityPriceDatabase extends _$ElectricityPriceDatabase
    with ConnectionDisposer<ElectricityPriceDatabase> {
  ElectricityPriceDatabase(Ref ref)
      : super(connectDrift(
          ref,
          dbName: 'electricity_price.sqlite',
        ));
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
