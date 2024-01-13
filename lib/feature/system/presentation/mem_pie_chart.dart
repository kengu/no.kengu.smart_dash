import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pretty_bytes/pretty_bytes.dart';
import 'package:smart_dash/feature/system/domain/system_info.dart';
import 'package:smart_dash/core/presentation/theme/smart_dash_theme_data.dart';
import 'package:smart_dash/util/widget.dart';

class MemPieChart extends StatelessWidget {
  const MemPieChart({
    super.key,
    required this.info,
    this.scale = 0.5,
    this.radius = 120,
  });

  final SystemInfo info;

  final double scale;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final surfaceColor = Theme.of(context).navigationRailTheme.backgroundColor!;
    final circleColor = surfaceColor.lighten().withAlpha(120);
    final legendStyle = getLegendTextStyle(context);

    return Stack(
      children: [
        Center(
          child: Transform.scale(
            scale: scale,
            child: PieChart(
              swapAnimationDuration: const Duration(milliseconds: 500),
              PieChartData(
                borderData: FlBorderData(
                  show: false,
                ),
                sectionsSpace: 0, // No space between sections
                startDegreeOffset: -90,
                centerSpaceRadius: radius,
                centerSpaceColor: circleColor,
                // No space in the center
                sections: [
                  PieChartSectionData(
                    value: info.memApp.toDouble(), // Used memory
                    showTitle: false,
                    radius: 50,
                    color: Colors.green.withOpacity(0.3),
                  ),
                  PieChartSectionData(
                    value:
                        (info.memUsed - info.memApp).toDouble(), // Used memory
                    showTitle: false,
                    radius: 50,
                    color: Colors.lightGreen.withOpacity(0.6),
                  ),
                  PieChartSectionData(
                    value: info.memFree.toDouble(), // Available memory
                    showTitle: false,
                    color: circleColor,
                  )
                ],
              ),
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                prettyBytes(info.memFree.toDouble(), binary: false),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
                textScaler: const TextScaler.linear(
                  1.3,
                ),
              ),
              Text(
                'of ${prettyBytes(info.memTotal.toDouble(), binary: false)} available',
                style: legendStyle,
                textScaler: const TextScaler.linear(
                  0.90,
                ),
              ),
              Text(
                'Memory is ${info.memIsLow ? 'low' : 'healthy'}',
                style: legendStyle,
                textScaler: const TextScaler.linear(
                  0.90,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
