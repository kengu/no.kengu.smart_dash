import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_dash/util/data/list.dart';
import 'package:smart_dash/util/data/num.dart';
import 'package:smart_dash/util/drift/connection.dart';
import 'package:smart_dash/util/time/date_time.dart';

import 'schemas/versions.dart';

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
    with
        DatabaseHelper<TimeSeriesDatabase>,
        ConnectionDisposer<TimeSeriesDatabase> {
  TimeSeriesDatabase(DatabaseConnection super.cnn);
  @override
  int get schemaVersion => 2;

  static DateTime toOffset(DateTime when) => when.toDateOnly();

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onUpgrade: (m, from, to) async {
        logOnUpgrade(from, to);
        // Following the advice from https://drift.simonbinder.eu/docs/advanced-features/migrations/#tips
        await customStatement('PRAGMA foreign_keys = OFF');

        await transaction(
          () => m.runMigrationSteps(
            from: from,
            to: to,
            steps: _upgradeSchema,
          ),
        );
      },
      beforeOpen: (details) async {
        if (details.hadUpgrade) {
          Future<int> Function()? modify = _upgradeData(
            details.versionNow,
            this,
          );
          if (modify != null) {
            // Perform changes
            final modifications = await transaction(modify);
            logHadUpgrade(details, modifications);
            if (kDebugMode) {
              final wrongForeignKeys =
                  await customSelect('PRAGMA foreign_key_check').get();
              assert(wrongForeignKeys.isEmpty,
                  '${wrongForeignKeys.map((e) => e.data)}');
            }
          }
        }

        // Make sure that foreign keys are enabled
        await customStatement('PRAGMA foreign_keys = ON');

        // This follows the recommendation to validate that the database schema
        // matches what drift expects (https://drift.simonbinder.eu/docs/advanced-features/migrations/#verifying-a-database-schema-at-runtime).
        // It allows catching bugs in the migration logic early.
        await validateDatabaseSchema(this);
      },
    );
  }

  static final _upgradeSchema = migrationSteps(
    from1To2: (m, schema) async {
      // Use default offset as default ts value in new columns
      final when = DateTime.now();
      final offset = toOffset(when);

      // In version 2, the following changes was made
      // 1. id column was deleted from TimeSeriesTable and replaced by PRIMARY KEY (name,ts)
      // 2. ts column was added to DataVectorTable, DataCoordsTable and dataDimsTable
      // 3. proper foreign keys was added to DataVectorTable, DataCoordsTable and dataDimsTable
      await m.alterTable(
        TableMigration(
          schema.timeSeriesTable,
        ),
      );
      await m.alterTable(
        TableMigration(
          schema.dataVectorTable,
          columnTransformer: {
            schema.dataVectorTable.ts: Constant<DateTime>(offset),
          },
          newColumns: [schema.dataVectorTable.ts],
        ),
      );
      await m.alterTable(
        TableMigration(
          schema.dataCoordsTable,
          columnTransformer: {
            schema.dataCoordsTable.ts: Constant<DateTime>(offset),
          },
          newColumns: [schema.dataCoordsTable.id, schema.dataCoordsTable.ts],
        ),
      );
      await m.alterTable(
        TableMigration(
          schema.dataDimsTable,
          columnTransformer: {
            schema.dataDimsTable.ts: Constant<DateTime>(offset),
          },
          newColumns: [schema.dataDimsTable.ts],
        ),
      );
    },
  );

  static Future<int> Function()? _upgradeData(
      int version, TimeSeriesDatabase db) {
    switch (version) {
      // VERSION 1 -> 2
      // Column ts is added to primary key of timeSeriesTable to allow
      // multiple timeseries of same name with different offsets,
      // typically one timeseries for each name each day. This requires
      // updates to foreign keys in DataVectorTable, DataCoordsTable and
      // DataDimsTable to prevent existing references breaking.
      case 2:
        return () async {
          List<int> modifications = [];
          // Update ts fields from time_series
          final result = await db.select(db.timeSeriesTable).get();
          for (var row in result) {
            // Use date offset (time is 00:00:00)
            // NOTE: This assumes that there only exists one
            // timeseries for each name and ts date in current database.
            final name = row.name;
            final ts = toOffset(row.ts);
            // Update ts with offset in timeseries, vectors, coords and dims table
            final results = await Future.wait([
              _setTs(
                db,
                db.timeSeriesTable.actualTableName,
                db.timeSeriesTable.ts.name,
                db.timeSeriesTable.name.name,
                ts,
                name,
              ),
              _setTs(
                db,
                db.dataVectorTable.actualTableName,
                db.dataVectorTable.ts.name,
                db.dataVectorTable.name.name,
                ts,
                name,
              ),
              _setTs(
                db,
                db.dataCoordsTable.actualTableName,
                db.dataCoordsTable.ts.name,
                db.dataCoordsTable.name.name,
                ts,
                name,
              ),
              _setTs(
                db,
                db.dataDimsTable.actualTableName,
                db.dataDimsTable.ts.name,
                db.dataDimsTable.name.name,
                ts,
                name,
              ),
            ]);
            modifications.addAll(results);
          }
          return modifications.sum();
        };
    }
    return null;
  }

  static Future<int> _setTs(TimeSeriesDatabase db, String table, String tsField,
      String tokenField, DateTime offset, String token) async {
    final rows = await db.customUpdate(
        'UPDATE `$table`'
        'SET `$tsField` = ?'
        'WHERE `$tokenField`= ?',
        variables: [
          Variable<DateTime>(offset),
          Variable<String>(token),
        ]);
    assert(rows > 0, 'data vector for token $token not found');
    assert(rows == 1, 'found $rows data vectors for token $token, expected 1');
    return rows;
  }

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
