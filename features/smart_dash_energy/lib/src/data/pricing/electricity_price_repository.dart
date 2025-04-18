import 'package:drift/drift.dart';
import 'package:optional/optional.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_energy/smart_dash_energy.dart';

import 'drift/electricity_price_database.dart';

part 'electricity_price_repository.g.dart';

class ElectricityPriceRepository {
  ElectricityPriceRepository(this.ref, this.db);

  Ref ref;
  ElectricityPriceDatabase db;

  Future<Optional<List<ElectricityPrice>>> getPriceHourly(
    String area,
    DateTime when,
  ) {
    return guard(() async {
      final query = db.getFromExactNameAndDate(
        area,
        when,
        when.add(const Duration(days: 1)),
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
  }

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
ElectricityPriceRepository electricityPriceRepository(Ref ref) {
  return ElectricityPriceRepository(
    ref,
    ElectricityPriceDatabase(ref).autoDispose(ref),
  );
}
