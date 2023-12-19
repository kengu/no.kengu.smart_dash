import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_dash/feature/accounting/application/electricity_price_service.dart';
import 'package:smart_dash/feature/accounting/domain/pricing/electricity_price.dart';
import 'package:smart_dash/feature/analytics/domain/data_array.dart';
import 'package:smart_dash/feature/analytics/domain/time_series.dart';
import 'package:smart_dash/util/time/time_scale.dart';
import 'package:smart_dash/widget/tile/sparkline_tile.dart';
import 'package:smart_dash/util/data/units.dart';

class HourlyElectricityPriceTile<T extends num> extends ConsumerWidget {
  const HourlyElectricityPriceTile({
    super.key,
    required this.when,
    required this.area,
  });

  final String area;
  final DateTime when;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final service = ref.watch(electricityPriceServiceProvider);
    return FutureBuilder<List<ElectricityPrice>>(
      future: service.getPriceHourly(area, when),
      builder: (context, snapshot) {
        final history = _prices(snapshot);
        final at = DateTime.now();
        final now = history.indexNow(false);
        return SparklineTile<double>(
          key: const ValueKey('hourly_electricity_price'),
          history: history,
          title: 'Electricity Price',
          subTitle: 'Today @ ${at.hour} - ${at.hour + 1} ($area)',
          lineMin: 1,
          lineMax: -1,
          lineStep: 3,
          pointIndex: now,
          pointsMode: PointsMode.atIndex,
          leading: const Icon(
            Icons.attach_money,
            color: Colors.lightGreen,
          ),
          valueBuilder: (data) => data.toPrice('kr', now),
          lineLabeler: (double index) => '${history.tsAt(index.ceil()).hour}',
        );
      },
    );
  }

  TimeSeries _prices(AsyncSnapshot<List<ElectricityPrice>> snapshot) {
    final prices = snapshot.hasData
        ? DataArray(
            [snapshot.data!.map((e) => e.nokPerKwh).toList()],
            coords: List.generate(
              snapshot.data!.length,
              (index) => {'hour': index},
            ),
            dims: [{}],
          )
        : DataArray.size(1, [{}]);
    return TimeSeries(
      name: 'price',
      array: prices,
      offset: when,
      span: TimeScale.hours.to(),
    );
  }
}
