import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:charts_painter/chart.dart';
import 'package:smart_dash/feature/accounting/application/energy_bill_service.dart';
import 'package:smart_dash/feature/accounting/domain/billing/energy_bill.dart';
import 'package:smart_dash/feature/analytics/domain/data_array.dart';
import 'package:smart_dash/feature/analytics/domain/time_series.dart';
import 'package:smart_dash/scaffold/presentation/app/smart_dash_app_theme_data.dart';
import 'package:smart_dash/util/time/time_scale.dart';
import 'package:smart_dash/util/time/time_series.dart';
import 'package:smart_dash/widget/tile/smart_dash_tile.dart';
import 'package:smart_dash/util/data/units.dart';

class EnergyBillTile extends ConsumerWidget {
  const EnergyBillTile({
    super.key,
    required this.when,
    required this.area,
  });

  final String area;
  final DateTime when;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final service = ref.watch(
      energyBillServiceProvider,
    );
    return FutureBuilder(
      future: service.getBillHourly(area, when),
      builder: (context, snapshot) {
        final surfaceColor =
            Theme.of(context).navigationRailTheme.backgroundColor!;
        final lineColor = surfaceColor.lighten(0.05);
        final legendTextColor = surfaceColor.lighten(0.2);
        final textStyle = Theme.of(context)
            .textTheme
            .labelSmall!
            .copyWith(color: legendTextColor);

        final bills = snapshot.hasData ? snapshot.data! : <EnergyBill>[];
        final hourly = _toHourly(bills);

        final at = DateTime.now();
        final now = hourly.indexNow(false);
        final today = hourly.sum();

        final total = today.lastRow.toPrice('kr', now);
        final sums = hourly.isEmpty ? <double>[0] : hourly.firstColumn;

        return SmartDashTile(
          key: const ValueKey('energy_bill'),
          title: 'Energy Bill',
          subTitle: 'Today @ ${at.hour} hours ($area)',
          constraints: const BoxConstraints(
            minWidth: 270,
            minHeight: 150,
          ),
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
          body: SingleChildScrollView(
            physics: const RangeMaintainingScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: AnimatedChart<double>(
                height: 150,
                duration: const Duration(seconds: 1),
                state: ChartState<double>(
                  behaviour: ChartBehaviour(
                    scrollSettings: ScrollSettings(
                      visibleItems: bills.length.clamp(1, 6).toDouble(),
                    ),
                  ),
                  data: ChartData.fromList(sums
                      .map((e) => ChartItem<double>(e.toDouble()))
                      .toList()),
                  itemOptions: WidgetItemOptions(
                    widgetItemBuilder: (data) {
                      final energy = bills.length > data.itemIndex
                          ? bills[data.itemIndex].energy.toEnergy()
                          : '-';
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3.0),
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
                      endWithChartVertical: false,
                      showVerticalValues: true,
                      showHorizontalGrid: false,
                      verticalAxisValueFromIndex: (index) {
                        return "${hourly.tsAt(index, false).hour}";
                      },
                    ),
                  ],
                  foregroundDecorations: [
                    ValueDecoration(
                      textStyle: textStyle,
                      hideZeroValues: false,
                      labelGenerator: (item) {
                        return (item.max as num).toPrice('kr');
                      },
                      valueGenerator: (item) {
                        return item.max ?? 0;
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

  TimeSeries _toHourly(List<EnergyBill> bills) {
    final prices = DataArray(
      [bills.map((e) => e.inNok).toList()],
      coords: List.generate(
        bills.length,
        (index) => {'hour': index},
      ),
      dims: [{}],
    );
    return TimeSeries(
      name: 'price',
      array: prices,
      offset: bills.isEmpty ? when : bills.first.begin,
      span: TimeScale.hours.to(),
    );
  }
}
