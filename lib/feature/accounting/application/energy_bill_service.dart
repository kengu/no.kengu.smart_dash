import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/accounting/application/electricity_price_service.dart';
import 'package:smart_dash/feature/accounting/domain/billing/energy_bill.dart';
import 'package:smart_dash/feature/accounting/domain/pricing/electricity.dart';
import 'package:smart_dash/feature/analytics/application/history_manager.dart';
import 'package:smart_dash/feature/analytics/domain/time_series.dart';
import 'package:smart_dash/feature/flow/tokens.dart';
import 'package:smart_dash/util/data/num.dart';
import 'package:smart_dash/util/future.dart';
import 'package:smart_dash/util/time/time_scale.dart';
import 'package:smart_dash/util/time/time_series.dart';

part 'energy_bill_service.g.dart';

class EnergyBillService {
  EnergyBillService(this.ref);

  final Ref ref;

  final _cache = FutureCache(prefix: '$EnergyBillService');

  ElectricityPriceService get priceService =>
      ref.read(electricityPriceServiceProvider);

  HistoryManager get historyManager => ref.read(historyManagerProvider);

  /// Get current [ElectricityTariff].
  Future<ElectricityTariff> getTariff({
    Duration ttl = const Duration(seconds: 4),
  }) async {
    return _cache.getOrFetch(
      'tariff',
      () async => ElectricityTariff.fromJson(jsonDecode(
        await rootBundle.loadString(
          'assets/data/electricity_tariff.json',
        ),
      )),
      ttl: ttl,
    );
  }

  /// Get daily [EnergyBillDay] for month [when].
  Future<EnergyBillMonth> getBillMonth(
    String area,
    DateTime when, {
    Duration ttl = const Duration(seconds: 4),
  }) async {
    final now = DateTime.now();
    const step = Duration(days: 1);
    final firstInMonth = DateTime(when.year, when.month, 1);
    final key = 'month:$area:$firstInMonth';

    return _cache.getOrFetch(
      key,
      () async {
        final days = <EnergyBillDay>[];
        DateTime next = firstInMonth;
        while (next.month <= firstInMonth.month &&
            !now.difference(next).isNegative) {
          final bill = await getBillDay(area, next);
          next = next.add(step);
          days.add(bill);
        }
        return EnergyBillMonth(begin: firstInMonth, daily: days);
      },
      ttl: ttl,
    );
  }

  Optional<EnergyBillMonth> getCachedBillMonth(String area, DateTime when) {
    final firstInMonth = DateTime(when.year, when.month, 1);
    return _cache.get('month:$area:$firstInMonth');
  }

  /// Get hourly [EnergyBillHour] for month [when].
  Future<EnergyBillDay> getBillDay(
    String area,
    DateTime when, {
    Duration ttl = const Duration(seconds: 4),
  }) async {
    final day = HistoryManager.toOffset(when);

    // Check if a request is already opened
    return _cache.getOrFetch(
      'day:$area:$day',
      () async {
        final tariff = await getTariff();
        final prices = await priceService.getPriceHourly(area, day);
        final history = await historyManager.get(Tokens.power, when: day);

        final lines = <EnergyBillHour>[];
        if (history.isPresent) {
          final hourly = toEnergy(history.value, when);

          var minEnergy = double.maxFinite;
          var maxEnergy = double.minPositive;

          for (int i = 0; i < hourly.length; i++) {
            final ts = hourly.tsAt(i);
            final energy = hourly.rowAt(i).first.toDouble();
            minEnergy = min(minEnergy, energy);
            maxEnergy = max(maxEnergy, energy);
            final price = prices.firstWhereOptional((p) =>
                p.begin.millisecondsSinceEpoch <= ts.millisecondsSinceEpoch &&
                p.end.millisecondsSinceEpoch >= ts.millisecondsSinceEpoch);
            if (price.isPresent) {
              lines.add(EnergyBillHour(
                vat: 25,
                begin: ts,
                tariff: tariff,
                price: price.value,
                end: ts.add(hourly.span),
                energy: hourly.rowAt(i).first.toDouble(),
              ));
            }
          }
        }
        return EnergyBillDay(begin: day, hourly: lines);
      },
      ttl: ttl,
    );
  }

  Optional<EnergyBillDay> getCachedBillDay(String area, DateTime when) {
    final day = HistoryManager.toOffset(when);
    return _cache.get('day:$area:$day');
  }

  /// Calculate energy = power * hour (power history is per minute)
  static TimeSeries toEnergy(TimeSeries power, DateTime when) {
    assert(
      TimeScale.from(power.span).isMinutes,
      'expected power history is per minute, '
      'was ${TimeScale.from(power.span).name}',
    );

    final begin = max(0, power.indexAt(when));

    return power.fold<double>(
      (_, __, ___, inner) => inner.sum() / 60,
      span: TimeScale.hours.to(),
      begin: begin,
    );
  }
}

@Riverpod(keepAlive: true)
EnergyBillService energyBillService(EnergyBillServiceRef ref) =>
    EnergyBillService(
      ref,
    );
