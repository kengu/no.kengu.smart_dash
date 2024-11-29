import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_analytics/smart_dash_analytics.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_energy/smart_dash_energy.dart';
import 'package:smart_dash_energy/src/data/pricing/electricity_price_client.dart';

part 'electricity_price_service.g.dart';

class ElectricityPriceService {
  ElectricityPriceService(this.ref);

  final Ref ref;

  final _cache = FutureCache(prefix: '$ElectricityPriceService');

  Future<List<ElectricityPrice>> getPriceHourly(
    String area,
    DateTime when, {
    Duration ttl = const Duration(minutes: 1),
  }) {
    final day = when.toDateOnly();
    final key = '$area:$day';
    return _cache.getOrFetch(key, () async {
      // Try local db first
      final repo = ref.read(electricityPriceRepositoryProvider);
      final fetched = await repo.getPriceHourly(area, when);
      if (fetched.isPresent && fetched.value.isNotEmpty) {
        return fetched.value;
      }
      final client = ref.read(electricityPriceClientProvider);
      final prices = await client.getPriceHourly(area, when);
      if (prices.isNotEmpty) {
        await repo.save(area, prices);
      }
      return prices;
    }, ttl: ttl);
  }
}

@Riverpod(keepAlive: true)
ElectricityPriceService electricityPriceService(
        ElectricityPriceServiceRef ref) =>
    ElectricityPriceService(ref);
