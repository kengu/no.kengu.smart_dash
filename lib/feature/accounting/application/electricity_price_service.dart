import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/accounting/data/pricing/electricity_price_client.dart';
import 'package:smart_dash/feature/accounting/data/pricing/electricity_price_repository.dart';
import 'package:smart_dash/feature/accounting/domain/pricing/electricity.dart';
import 'package:smart_dash/util/future.dart';
import 'package:smart_dash/util/guard.dart';

part 'electricity_price_service.g.dart';

class ElectricityPriceService {
  ElectricityPriceService(this.ref);

  final Ref ref;

  final _cache = FutureCache(prefix: '$ElectricityPriceService');

  Future<List<ElectricityPrice>> getPriceHourly(String area, DateTime when) =>
      guard(() async {
        // Try local db first
        final repo = ref.read(electricityPriceRepositoryProvider);
        final fetched = await repo.getPriceHourly(area, when);
        if (fetched.isPresent && fetched.value.isNotEmpty) {
          return fetched.value;
        }

        final key = '$area:$when';
        return _cache.getOrFetch(key, () async {
          final client = ref.read(electricityPriceClientProvider);
          final prices = await client.getPriceHourly(area, when);
          if (prices.isNotEmpty) {
            await repo.save(area, prices);
          }
          return prices;
        });
      });
}

@Riverpod(keepAlive: true)
ElectricityPriceService electricityPriceService(
        ElectricityPriceServiceRef ref) =>
    ElectricityPriceService(
      ref,
    );
