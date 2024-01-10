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

  /// Get [EnergyBill] history per hour.
  Future<List<EnergyBill>> getBillHourly(String area, DateTime when) =>
      guard(() async {
        final tariff = ElectricityTariff.fromJson(
          jsonDecode(
            await rootBundle.loadString(
              'assets/data/electricity_tariff.json',
            ),
          ),
        );
        final prices = await ref
            .read(electricityPriceServiceProvider)
            .getPriceHourly(area, when);
        final history =
            await ref.read(historyManagerProvider).get(Tokens.power);

        final bill = <EnergyBill>[];
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
              bill.add(EnergyBill(
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
        return bill;
      });

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
