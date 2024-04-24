import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/accounting/application/electricity_price_service.dart';
import 'package:smart_dash/feature/accounting/domain/billing/energy_bill.dart';
import 'package:smart_dash/feature/accounting/domain/pricing/electricity.dart';
import 'package:smart_dash_analytics/smart_dash_analytics.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

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
    Duration? ttl,
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

  /// Get hourly [EnergyBillHour] for month [when].
  Future<EnergyBillDay> getBillDay(
    Token power,
    String area,
    DateTime when, {
    Duration? ttl,
  }) async {
    final day = HistoryManager.toOffset(when);

    // Check if a request is already opened
    return _cache.getOrFetch(
      _toCacheKey(power, area, 'day', day),
      () async {
        final tariff = await getTariff();
        final prices = await priceService.getPriceHourly(area, day);
        final history = await historyManager.get(power, when: day, ttl: ttl);

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

  Optional<EnergyBillDay> getCachedBillDay(
      Token power, String area, DateTime when) {
    final day = HistoryManager.toOffset(when);
    return _cache.get(_toCacheKey(power, area, 'day', day));
  }

  String _toCacheKey(Token token, String area, String period, DateTime when) {
    assert(token.isPower, 'Token must have unit [power]');
    return '${token.name}:$period:$area:$when';
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

  /// Get daily [EnergyBillDay] for month [when].
  Future<EnergyBillMonth> getBillMonth(
    Token power,
    String area,
    DateTime when, {
    Duration? ttl,
    bool ttlOnAll = false,
  }) async {
    final now = DateTime.now();
    const step = Duration(days: 1);
    final firstInMonth = when.firstInMonth;
    return _cache.getOrFetch(
      _toCacheKey(power, area, 'month', firstInMonth),
      () async {
        final days = <EnergyBillDay>[];
        DateTime next = firstInMonth;
        while (next.month <= firstInMonth.month &&
            !now.difference(next).isNegative) {
          // Always apply given ttl if last day in month is today.
          // When ttl is given this is a  reasonable behavior, as
          // today typically has power history updates since last
          // cached result, that now needs to be processed and new
          // daily bill calculated for. If a complete update of all
          // calculations is needed because one or more daily power
          // histories have changed, ttlOnAll must be true.
          final ttlDay = ttlOnAll ? ttl : (next.day == now.day ? ttl : null);
          final bill = await getBillDay(power, area, next, ttl: ttlDay);
          next = next.add(step);
          days.add(bill);
        }
        return EnergyBillMonth(begin: firstInMonth, daily: days);
      },
      ttl: ttl,
    );
  }

  Optional<EnergyBillMonth> getCachedBillMonth(
    Token power,
    String area,
    DateTime when,
  ) {
    return _cache.get(
      _toCacheKey(power, area, 'month', when.firstInMonth),
    );
  }
}

@Riverpod(keepAlive: true)
EnergyBillService energyBillService(EnergyBillServiceRef ref) =>
    EnergyBillService(
      ref,
    );
