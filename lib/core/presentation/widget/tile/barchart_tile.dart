import 'package:charts_painter/chart.dart';
import 'package:flutter/material.dart';
import 'package:smart_dash/core/presentation/theme/smart_dash_theme_data.dart';
import 'package:smart_dash/core/presentation/widget/tile/smart_dash_tile.dart';
import 'package:smart_dash/util/widget.dart';

class BarChartTile extends StatelessWidget {
  const BarChartTile({
    super.key,
    required this.icon,
    required this.items,
    required this.title,
    required this.total,
    required this.subtitle,
    required this.minItemWidth,
    required this.itemValueBuilder,
    required this.itemLabelBuilder,
    required this.axisLabelBuilder,
  });

  final String title;
  final String total;
  final IconData icon;
  final String subtitle;
  final List<double> items;
  final double minItemWidth;
  final String Function(double value) itemLabelBuilder;
  final String Function(int itemIndex) itemValueBuilder;
  final String Function(int axisIndex) axisLabelBuilder;

  @override
  Widget build(BuildContext context) {
    final surfaceColor = Theme.of(context).navigationRailTheme.backgroundColor!;
    final lineColor = surfaceColor.lighten(0.05);
    final textStyle = getLegendTextStyle(context);

    final constraints = BoxConstraints(
      minWidth: 270,
      minHeight: 180,
      maxWidth: (minItemWidth + 6) * items.length,
    ).normalize();

    return SmartDashTile(
      title: title,
      subTitle: subtitle,
      constraints: constraints,
      leading: Icon(
        icon,
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
            width: constraints.minWidth,
            height: constraints.minHeight,
            //duration: const Duration(seconds: 2),
            state: ChartState<double>(
              behaviour: const ChartBehaviour(
                scrollSettings: ScrollSettings(
                  visibleItems: 6,
                ),
              ),
              data: ChartData.fromList(
                items.map((e) => ChartItem<double>(e.toDouble())).toList(),
              ),
              itemOptions: WidgetItemOptions(
                minBarWidth: minItemWidth,
                maxBarWidth: minItemWidth,
                widgetItemBuilder: (data) {
                  final energy = itemValueBuilder(data.itemIndex);
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
                  endWithChartVertical: false,
                  showVerticalValues: true,
                  showHorizontalGrid: false,
                  verticalAxisValueFromIndex: axisLabelBuilder,
                ),
              ],
              foregroundDecorations: [
                // ignore: deprecated_member_use
                ValueDecoration(
                  textStyle: textStyle,
                  hideZeroValues: true,
                  alignment: Alignment.center,
                  valueGenerator: (item) {
                    // HACK: Adjust vertical alignment of text above bar
                    return (item.max ?? 0) * 0.97;
                  },
                  labelGenerator: (item) => itemLabelBuilder(
                    item.max as double,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
