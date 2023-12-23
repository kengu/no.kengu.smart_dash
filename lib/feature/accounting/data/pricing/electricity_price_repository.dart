import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/accounting/domain/pricing/electricity_price.dart';
import 'package:smart_dash/util/guard.dart';

import 'drift/electricity_price_database.dart';

part 'electricity_price_repository.g.dart';

class ElectricityPriceRepository {
  ElectricityPriceRepository(this.ref, this.db);

  Ref ref;
  ElectricityPriceDatabase db;

  Future<Optional<List<ElectricityPrice>>> getPriceHourly(
    String area,
    DateTime when,
  ) =>
      guard(() async {
        final query = db.select(db.electricityPriceTable)
          ..where(
            (t) =>
                t.area.equals(area) &
                t.ts0.isBiggerOrEqualValue(when) &
                t.ts1.isSmallerOrEqualValue(when),
          );
        final result = await query.get();
        return Optional.of(result
            .map((p) => ElectricityPrice(
                nokPerKwh: p.nokPerKwh,
                eurPerKwh: p.eurPerKwh,
                eurToNokRate: p.eurToNokRate,
                begin: p.ts0,
                end: p.ts1))
            .toList());
      });

  Future<void> save(String area, List<ElectricityPrice> prices) =>
      guard(() async {
        await db.batch((batch) {
          for (var price in prices) {
            batch.insert(
              db.electricityPriceTable,
              ElectricityPriceTableCompanion(
                area: Value(area),
                ts0: Value(price.begin),
                ts1: Value(price.end),
                eurPerKwh: Value(price.eurPerKwh),
                nokPerKwh: Value(price.nokPerKwh),
                eurToNokRate: Value(price.eurToNokRate),
              ),
              mode: InsertMode.insertOrIgnore,
            );
          }
        });
      });

  Future<void> deleteAll() => guard(() async => await db.deleteAll());
}

@Riverpod(keepAlive: true)
ElectricityPriceRepository electricityPriceRepository(
    ElectricityPriceRepositoryRef ref) {
  return ElectricityPriceRepository(
    ref,
    ElectricityPriceDatabase(ref).autoDispose(ref),
  );
}
