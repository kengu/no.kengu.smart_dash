import 'dart:math';

import 'package:charts_painter/chart.dart';
import 'package:flutter/material.dart';
import 'package:smart_dash/core/presentation/theme/smart_dash_theme_data.dart';
import 'package:smart_dash/core/presentation/widget/tile/smart_dash_tile.dart';
import 'package:smart_dash/util/data/num.dart';
import 'package:smart_dash/util/widget.dart';

class BarChartTile<T extends num> extends StatelessWidget {
  const BarChartTile({
    super.key,
    required this.icon,
    required this.items,
    required this.title,
    required this.total,
    required this.subtitle,
    required this.itemValueBuilder,
    required this.itemLabelBuilder,
    required this.axisLabelBuilder,
    this.minItemWidth = 72,
    this.hideZeroValues = true,
    this.chartMargin = defaultChartMargin,
  });

  static const defaultChartMargin =
      EdgeInsets.only(left: 3.0, right: 3.0, top: 16, bottom: 4.0);

  final String title;
  final String total;
  final List<T> items;
  final IconData icon;
  final String subtitle;
  final double minItemWidth;
  final bool hideZeroValues;
  final EdgeInsets chartMargin;
  final String Function(int itemIndex) itemValueBuilder;
  final String Function(int axisIndex) axisLabelBuilder;
  final String Function(int index, ChartItem<T> item) itemLabelBuilder;

  @override
  Widget build(BuildContext context) {
    // HACK: Chart does not handle values below 1 well
    final min = items.min();
    final valuePadding =
        (items.max() < 1.0 ? 1.0 : 1.5) + (min < 0 ? min.abs() : 0);

    final foregroundColor = Colors.lightGreen.withOpacity(0.6);
    final surfaceColor = Theme.of(context).navigationRailTheme.backgroundColor!;
    final lineColor = surfaceColor.lighten(0.05);
    final textStyle = getLegendTextStyle(context);

    final constraints = BoxConstraints(
      minWidth: 270,
      minHeight: 180,
      maxWidth: (minItemWidth + 6) * items.length,
    ).normalize();

    int valueIndex = 0;

    return SmartDashTile(
      title: title,
      subtitle: subtitle,
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
      body: items.isEmpty
          ? Stack(
              children: [
                Center(
                  child: Text(
                    'No data',
                    style: textStyle,
                  ),
                ),
              ],
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SingleChildScrollView(
                reverse: true,
                scrollDirection: Axis.horizontal,
                child: Chart<T>(
                  width: constraints.minWidth,
                  height: constraints.minHeight,
                  state: ChartState<T>(
                    behaviour: const ChartBehaviour(
                      scrollSettings: ScrollSettings(
                        visibleItems: 6,
                      ),
                    ),
                    data: ChartData.fromList(
                      items
                          .map((e) => ChartItem<T>(
                                e.toDouble() + valuePadding,
                              ))
                          .toList(),
                      axisMax: 10,
                    ),
                    itemOptions: WidgetItemOptions(
                      minBarWidth: minItemWidth,
                      maxBarWidth: minItemWidth,
                      widgetItemBuilder: (data) {
                        return Container(
                          margin: chartMargin,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(0),
                            ),
                          ),
                          foregroundDecoration: BoxDecoration(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            color: foregroundColor,
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 8.0,
                                left: 0.0,
                                right: 0.0,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 2.0,
                                  ),
                                  child: Text(
                                    itemValueBuilder(data.itemIndex),
                                    style: textStyle,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
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
                        verticalAxisValueFromIndex: axisLabelBuilder,
                        verticalValuesPadding: const EdgeInsets.only(top: 4.0),
                      ),
                    ],
                    foregroundDecorations: [
                      // ignore: deprecated_member_use
                      ValueDecoration(
                        textStyle: textStyle,
                        alignment: Alignment.center,
                        hideZeroValues: hideZeroValues,
                        valueGenerator: (item) {
                          // HACK: Adjust vertical alignment of text above bar
                          return max(1, (item.max ?? 0) * 0.97);
                        },
                        labelGenerator: (item) {
                          if (hideZeroValues && item.value == 0) return '';
                          return itemLabelBuilder(
                            (valueIndex++) % items.length,
                            ChartItem<T>(
                              item.max == null
                                  ? null
                                  : item.max! - valuePadding,
                              min: item.min == null
                                  ? null
                                  : item.min! - valuePadding,
                              value: item.value == null
                                  ? null
                                  : item.value! - valuePadding,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
