import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_dash/util/data/list.dart';
import 'package:smart_dash/util/drift/connection.dart';

part 'time_series_database.g.dart';

enum DataVectorType {
  int,
  double;

  static DataVectorType from(List<num> list) {
    return list.isListInt ? DataVectorType.int : DataVectorType.double;
  }
}

@DriftDatabase(include: {'time_series.drift'})
class TimeSeriesDatabase extends _$TimeSeriesDatabase
    with ConnectionDisposer<TimeSeriesDatabase> {
  TimeSeriesDatabase(Ref ref) : super(connectDrift(ref, 'time_series.sqlite'));

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
