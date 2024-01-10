import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/accounting/data/pricing/electricity_price_client.dart';
import 'package:smart_dash/feature/accounting/data/pricing/electricity_price_repository.dart';
import 'package:smart_dash/feature/accounting/domain/pricing/electricity.dart';
import 'package:smart_dash/util/guard.dart';

part 'electricity_price_service.g.dart';

class ElectricityPriceService {
  ElectricityPriceService(this.ref);

  final Ref ref;

  final Map<String, Future<List<ElectricityPrice>>> cache = {};

  Future<List<ElectricityPrice>> getPriceHourly(String area, DateTime when) =>
      guard(() async {
        // Try local db first
        final repo = ref.read(electricityPriceRepositoryProvider);
        final fetched = await repo.getPriceHourly(area, when);
        if (fetched.isPresent && fetched.value.isNotEmpty) {
          return fetched.value;
        }

        // Check if a request is already opened
        final key = '$area:$when';
        final cached = cache[key];
        if (cached != null) {
          return cached;
        }

        // Create request and cache it to prevent race condition
        final client = ref.read(electricityPriceClientProvider);
        cache[key] = client.getPriceHourly(area, when);
        final prices = await cache[key]!;
        if (prices.isNotEmpty) {
          await repo.save(area, prices);
        }
        cache.remove(key);
        return prices;
      });
}

@Riverpod(keepAlive: true)
ElectricityPriceService electricityPriceService(
        ElectricityPriceServiceRef ref) =>
    ElectricityPriceService(
      ref,
    );
