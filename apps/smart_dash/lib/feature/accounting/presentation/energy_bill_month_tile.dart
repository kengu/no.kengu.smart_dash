import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/core/presentation/widget/tile/barchart_tile.dart';
import 'package:smart_dash/feature/accounting/application/energy_bill_service.dart';
import 'package:smart_dash/feature/accounting/domain/billing/energy_bill.dart';
import 'package:smart_dash_analytics/smart_dash_analytics.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

class EnergyBillMonthTile extends ConsumerWidget {
  const EnergyBillMonthTile({
    super.key,
    required this.when,
    required this.area,
    required this.power,
  });

  final String area;

  final DateTime when;

  final Optional<Token> power;

  static final df = DateFormat('MMMM');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final at = DateTime.now();
    if (!power.isPresent) {
      return BarChartTile<double>(
        total: '-',
        items: const [0],
        icon: CupertinoIcons.sum,
        title: 'Energy Bill ${df.format(at)}',
        subtitle: 'Last ${at.hour} hours ($area)',
        axisLabelBuilder: (axisIndex) => '',
        itemValueBuilder: (itemIndex) => '-',
        itemLabelBuilder: (index, item) => '- kr',
      );
    }
    final service = ref.watch(energyBillServiceProvider);
    return FutureBuilder(
      future: service.getBillMonth(power.value, area, when,
          // Update bill today every 4 seconds when is this month
          ttl: when.isThisMonth ? const Duration(seconds: 1) : null),
      initialData:
          service.getCachedBillMonth(power.value, area, when).orElseNull,
      builder: (context, snapshot) {
        final bill = Optional.ofNullable(snapshot.data);
        final daily = _toDaily(bill);
        final details = bill.orElseNull?.daily ?? [];
        return BarChartTile<double>(
          icon: CupertinoIcons.sum,
          title: 'Energy Bill ${df.format(at)}',
          subtitle: 'Last ${at.hour} hours ($area)',
          items:
              daily.isNotEmpty ? daily.firstColumn.cast<double>() : <double>[0],
          total: daily.sum().lastRow.toPrice('kr', fractionDigits: 0),
          axisLabelBuilder: (axisIndex) =>
              '${daily.tsAt(axisIndex, false).day}d',
          itemValueBuilder: (itemIndex) => details.length > itemIndex
              ? details[itemIndex].energy.toEnergy()
              : '-',
          itemLabelBuilder: (index, item) => (item.max ?? 0).toPrice('kr', 0),
        );
      },
    );
  }

  TimeSeries _toDaily(Optional<EnergyBillMonth> bill) {
    if (!bill.isPresent) {
      return TimeSeries(
        name: 'price',
        offset: when,
        span: TimeScale.days.to(),
        array: DataArray.empty([]),
      );
    }
    final details = [
      bill.value.daily.map((e) => e.inNokIncVat).toList(),
    ];
    final prices = DataArray(
      details,
      coords: List.generate(
        bill.value.daily.length,
        (index) => {'day': index},
      ),
      dims: [{}],
    );
    return TimeSeries(
      name: 'price',
      array: prices,
      offset: bill.value.begin,
      span: TimeScale.days.to(),
    );
  }
}
