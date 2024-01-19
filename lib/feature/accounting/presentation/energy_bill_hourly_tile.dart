import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/core/presentation/widget/tile/barchart_tile.dart';
import 'package:smart_dash/feature/accounting/application/energy_bill_service.dart';
import 'package:smart_dash/feature/accounting/domain/billing/energy_bill.dart';
import 'package:smart_dash/feature/analytics/domain/data_array.dart';
import 'package:smart_dash/feature/analytics/domain/time_series.dart';
import 'package:smart_dash/feature/flow/domain/token.dart';
import 'package:smart_dash/util/time/time_scale.dart';
import 'package:smart_dash/util/time/time_series.dart';
import 'package:smart_dash/util/data/units.dart';

class EnergyBillHourlyTile extends ConsumerWidget {
  const EnergyBillHourlyTile({
    super.key,
    required this.area,
    required this.when,
    required this.power,
  });

  final String area;

  final DateTime when;

  final Optional<Token> power;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final at = DateTime.now();
    if (!power.isPresent) {
      return BarChartTile(
        total: '-',
        items: const [0],
        icon: CupertinoIcons.sum,
        title: 'Energy Bill Today',
        subtitle: 'Last ${at.hour} hours ($area)',
        axisLabelBuilder: (axisIndex) => '',
        itemValueBuilder: (itemIndex) => '-',
        itemLabelBuilder: (index, item) => '- kr',
      );
    }
    final service = ref.watch(energyBillServiceProvider);
    return FutureBuilder(
      future: service.getBillDay(power.value, area, when),
      initialData: service.getCachedBillDay(power.value, area, when).orElseNull,
      builder: (context, snapshot) {
        final bill = Optional.ofNullable(snapshot.data);
        final hourly = _toHourly(bill);
        final details = bill.orElseNull?.hourly ?? [];
        return BarChartTile(
          icon: CupertinoIcons.sum,
          title: 'Energy Bill Today',
          subtitle: 'Last ${at.hour} hours ($area)',
          items: hourly.isNotEmpty
              ? hourly.firstColumn.cast<double>()
              : <double>[0],
          total: hourly.sum().lastRow.toPrice('kr', fractionDigits: 0),
          axisLabelBuilder: (axisIndex) =>
              "${hourly.tsAt(axisIndex, false).hour}",
          itemValueBuilder: (itemIndex) => details.length > itemIndex
              ? details[itemIndex].energy.toEnergy()
              : '-',
          itemLabelBuilder: (index, item) => (item.max ?? 0).toPrice('kr'),
        );
      },
    );
  }

  TimeSeries _toHourly(Optional<EnergyBillDay> bill) {
    if (!bill.isPresent) {
      return TimeSeries(
        name: 'price',
        offset: when,
        span: TimeScale.hours.to(),
        array: DataArray.empty([]),
      );
    }
    final details = [
      bill.value.hourly.map((e) => e.inNokIncVat).toList(),
    ];
    final prices = DataArray(
      details,
      coords: List.generate(
        bill.value.hourly.length,
        (index) => {'hour': index},
      ),
      dims: [{}],
    );
    return TimeSeries(
      name: 'price',
      array: prices,
      offset: bill.value.begin,
      span: TimeScale.hours.to(),
    );
  }
}
