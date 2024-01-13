import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:charts_painter/chart.dart';
import 'package:intl/intl.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/feature/accounting/application/energy_bill_service.dart';
import 'package:smart_dash/feature/accounting/domain/billing/energy_bill.dart';
import 'package:smart_dash/feature/analytics/domain/data_array.dart';
import 'package:smart_dash/feature/analytics/domain/time_series.dart';
import 'package:smart_dash/scaffold/presentation/app/smart_dash_app_theme_data.dart';
import 'package:smart_dash/util/data/num.dart';
import 'package:smart_dash/util/time/time_scale.dart';
import 'package:smart_dash/util/widget.dart';
import 'package:smart_dash/widget/tile/smart_dash_tile.dart';
import 'package:smart_dash/util/data/units.dart';

class EnergyBillMonthTile extends ConsumerWidget {
  const EnergyBillMonthTile({
    super.key,
    required this.when,
    required this.area,
  });

  final String area;

  final DateTime when;

  static const double minItemWidth = 72;

  static final df = DateFormat('MMMM');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final service = ref.watch(
      energyBillServiceProvider,
    );
    return FutureBuilder(
      future: service.getBillMonth(area, when),
      builder: (context, snapshot) {
        final surfaceColor =
            Theme.of(context).navigationRailTheme.backgroundColor!;
        final lineColor = surfaceColor.lighten(0.05);
        final textStyle = getLegendTextStyle(context);

        final bill = Optional.ofNullable(snapshot.data);
        final daily = _toDaily(bill);
        final details = bill.orElseNull?.daily ?? [];

        final at = DateTime.now();

        final sums = daily.isEmpty ? <double>[0] : daily.firstColumn;
        final total = sums.sum().toPrice('kr', 0);

        final constraints = BoxConstraints(
          minWidth: 270,
          minHeight: 180,
          maxWidth: (minItemWidth + 6) * sums.length,
        ).normalize();

        return SmartDashTile(
          key: const ValueKey('energy_bill_month'),
          title: 'Energy Bill ${df.format(at)}',
          subTitle: 'Last ${at.day} days ($area)',
          constraints: constraints,
          leading: const Icon(
            Icons.summarize_outlined,
            color: Colors.lightGreen,
          ),
          trailing: Text(
            total,
            style: const TextStyle(
              color: Colors.lightGreen,
              fontWeight: FontWeight.bold,
            ),
            textScaler: const TextScaler.linear(1.2),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SingleChildScrollView(
              reverse: true,
              scrollDirection: Axis.horizontal,
              child: Chart<double>(
                key: const ValueKey('energy_bill_month_chart'),
                width: constraints.minWidth,
                height: constraints.minHeight,
                //duration: const Duration(seconds: 2),
                state: ChartState<double>(
                  behaviour: const ChartBehaviour(
                    scrollSettings: ScrollSettings(
                      visibleItems: 6,
                    ),
                  ),
                  data: ChartData.fromList(sums
                      .map((e) => ChartItem<double>(e.toDouble()))
                      .toList()),
                  itemOptions: WidgetItemOptions(
                    minBarWidth: minItemWidth,
                    maxBarWidth: minItemWidth,
                    widgetItemBuilder: (data) {
                      final energy = details.length > data.itemIndex
                          ? details[data.itemIndex].energy.toEnergy()
                          : '-';
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3.0)
                            .copyWith(top: 16, bottom: 4.0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                        ),
                        foregroundDecoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                          color: Colors.lightGreen.withOpacity(0.6),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 8.0,
                                left: 0.0,
                                right: 0.0,
                                child: Text(
                                  energy,
                                  style: textStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  backgroundDecorations: [
                    GridDecoration(
                      verticalAxisStep: 1,
                      gridColor: lineColor,
                      textStyle: textStyle,
                      showVerticalGrid: false,
                      showVerticalValues: true,
                      showHorizontalGrid: false,
                      endWithChartVertical: false,
                      verticalAxisValueFromIndex: (index) {
                        return "${daily.tsAt(index, false).day}";
                      },
                    ),
                  ],
                  foregroundDecorations: [
                    // ignore: deprecated_member_use
                    ValueDecoration(
                      textStyle: textStyle,
                      hideZeroValues: true,
                      alignment: Alignment.center,
                      labelGenerator: (item) {
                        return (item.max as num).toPrice('kr');
                      },
                      valueGenerator: (item) {
                        // HACK: Adjust vertical alignment of text above bar
                        return (item.max ?? 0) * 0.97;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
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
