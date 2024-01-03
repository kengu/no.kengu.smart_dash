import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:smart_dash/feature/system/model/system_info.dart';
import 'package:smart_dash/scaffold/presentation/app/smart_dash_app_theme_data.dart';
import 'package:smart_dash/util/widget.dart';

class CpuPieChart extends StatelessWidget {
  const CpuPieChart({
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
                    value: info.cpuTotal, // Total load
                    showTitle: false,
                    radius: 50,
                    color: Colors.lightGreen.withOpacity(0.6),
                  ),
                  PieChartSectionData(
                    value: 100 - info.cpuTotal, // Available memory
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
                '${info.cpuTotal.toStringAsFixed(1)} %',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
                textScaler: const TextScaler.linear(
                  1.3,
                ),
              ),
              Text(
                'total CPU load',
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
