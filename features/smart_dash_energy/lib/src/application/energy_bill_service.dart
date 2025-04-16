import 'dart:convert';
import 'dart:math';

import 'package:optional/optional.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_analytics/smart_dash_analytics.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_energy/smart_dash_energy.dart';

part 'energy_bill_service.g.dart';

class EnergyBillService {
  EnergyBillService(this.ref);

  final Ref ref;

  final _cache = FutureCache(prefix: '$EnergyBillService');

  /// Get current [ElectricityTariff].
  Future<ElectricityTariff> getTariff({
    Duration? ttl,
  }) async {
    return _cache.getOrFetch(
      'tariff',
      // TODO: Implement electricity tariff service
      () async => ElectricityTariff.fromJson(_tariffs.first),
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
        final service = ref.read(electricityPriceServiceProvider);
        final prices = await service.getPriceHourly(area, day);
        final manager = ref.read(historyManagerProvider);
        final history = await manager.get(power, when: day, ttl: ttl);

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
EnergyBillService energyBillService(Ref ref) => EnergyBillService(
      ref,
    );

// TODO: Move to electricity tariff service
List<JsonObject> get _tariffs {
  final json = jsonDecode(
    '''
{
  "provider": "Stannum",
  "validUntil": "2024-12-31T23:59:59.999",
  "capacity": [
    {
      "from_kWh": 0.0,
      "to_kWh": 2.0,
      "NOK_per_month": 244.16666666666666
    },
    {
      "from_kWh": 2.0,
      "to_kWh": 5.0,
      "NOK_per_month": 292.9166666666667
    },
    {
      "from_kWh": 5.0,
      "to_kWh": 10.0,
      "NOK_per_month": 317.3333333333333
    },
    {
      "from_kWh": 10.0,
      "to_kWh": 15.0,
      "NOK_per_month": 341.75
    },
    {
      "from_kWh": 15.0,
      "to_kWh": 20.0,
      "NOK_per_month": 366.1666666666667
    },
    {
      "from_kWh": 20.0,
      "to_kWh": 25.0,
      "NOK_per_month": 427.25
    },
    {
      "from_kWh": 25.0,
      "to_kWh": 50.0,
      "NOK_per_month": 463.8333333333333
    },
    {
      "from_kWh": 50.0,
      "to_kWh": 75.0,
      "NOK_per_month": 512.6666666666666
    }
  ],
  "consumption": [
    {
      "NOK_per_kWh": 0.2545,
      "from_hour": 0,
      "to_hour": 6
    },
    {
      "NOK_per_kWh": 0.2681,
      "from_hour": 7,
      "to_hour": 21
    },
    {
      "NOK_per_kWh": 0.2545,
      "from_hour": 22,
      "to_hour": 24
    }
  ]
}
''',
  );
  return [json];
}
