import 'package:drift/drift.dart';
import 'package:smart_dash/util/drift/connection.dart';

part 'electricity_price_database.g.dart';

@DriftDatabase(include: {'electricity_price.drift'})
class ElectricityPriceDatabase extends _$ElectricityPriceDatabase {
  ElectricityPriceDatabase() : super(connectDrift('electricity_price.sqlite'));

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

  @override
  int get schemaVersion => 1;
}
