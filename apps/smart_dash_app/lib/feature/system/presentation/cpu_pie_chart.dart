import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:smart_dash_app/core/presentation/presentation.dart';
import 'package:smart_dash_app/core/presentation/theme/smart_dash_theme_data.dart';
import 'package:smart_dash_app/feature/system/domain/system_info.dart';

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
                    value: info.cpuApp, // App load
                    showTitle: false,
                    radius: 50,
                    color: info.isAppUsage
                        ? Colors.lightGreen.withAlpha(153)
                        : Colors.green.withAlpha(76),
                  ),
                  PieChartSectionData(
                    value: info.cpuTotal - (info.cpuApp ?? 0), // Total load
                    showTitle: false,
                    radius: 50,
                    color: Colors.lightGreen.withAlpha(153),
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
                '${(info.isAppUsage ? info.cpuApp ?? 0 : info.cpuAppPercentOfTotal).toStringAsFixed(0)} %',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
                textScaler: const TextScaler.linear(
                  1.3,
                ),
              ),
              if (!info.isAppUsage)
                Text(
                  'of ${info.cpuTotal.toStringAsFixed(0)} % CPU load',
                  style: legendStyle,
                  textScaler: const TextScaler.linear(
                    0.90,
                  ),
                ),
              Text(
                'Cpu is ${info.cpuIsHigh ? 'high' : 'healthy'}',
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
