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
import 'package:smart_dash/util/guard.dart';
import 'package:smart_dash/util/time/time_scale.dart';
import 'package:smart_dash/util/time/time_series.dart';

part 'energy_bill_service.g.dart';

class EnergyBillService {
  EnergyBillService(this.ref);

  final Ref ref;

  final Map<String, Future<EnergyBillDay>> cacheDays = {};

  final Map<String, Future<EnergyBillMonth>> cacheMonths = {};

  final Map<String, Future<ElectricityTariff>> cacheTariffs = {};

  ElectricityPriceService get priceService =>
      ref.read(electricityPriceServiceProvider);

  HistoryManager get historyManager => ref.read(historyManagerProvider);

  Future<ElectricityTariff> getTariff() async {
    // Check if a request is already opened
    const key = 'stannum';
    final cached = cacheTariffs[key];
    if (cached != null) {
      return cached;
    }
    request() async {
      return ElectricityTariff.fromJson(
        jsonDecode(
          await rootBundle.loadString(
            'assets/data/electricity_tariff.json',
          ),
        ),
      );
    }

    cacheTariffs[key] = request();
    final tariff = await cacheTariffs[key]!;
    cacheTariffs.remove(key);
    return tariff;
  }

  /// Get hourly [EnergyBillHour] for month [when].
  Future<EnergyBillMonth> getBillMonth(String area, DateTime when) async {
    final now = DateTime.now();
    const step = Duration(days: 1);
    final firstInMonth = DateTime(when.year, when.month, 1);

    // Check if a request is already opened
    final key = '$area:$firstInMonth';
    final cached = cacheMonths[key];
    if (cached != null) {
      return cached;
    }

    cacheMonths[key] = guard(() async {
      final days = <EnergyBillDay>[];
      DateTime next = firstInMonth;
      while (next.month <= firstInMonth.month &&
          !now.difference(next).isNegative) {
        final bill = await getBillDay(area, next);
        next = next.add(step);
        days.add(bill);
      }
      return EnergyBillMonth(daily: days);
    });

    final bill = await cacheMonths[key]!;
    cacheMonths.remove(key);
    return bill;
  }

  /// Get [EnergyBillHour] for day [when].
  Future<EnergyBillDay> getBillDay(String area, DateTime when) async {
    final day = HistoryManager.toOffset(when);

    // Check if a request is already opened
    final key = 'day:$area:$day';
    final cached = cacheDays[key];
    if (cached != null) {
      return cached;
    }

    cacheDays[key] = guard(() async {
      final tariff = await getTariff();
      final prices = await priceService.getPriceHourly(area, day);
      final history = await historyManager.get(Tokens.power, day);

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
      return EnergyBillDay(hourly: lines);
    });

    final bill = await cacheDays[key]!;
    cacheDays.remove(key);
    return bill;
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
