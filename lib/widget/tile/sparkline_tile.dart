import 'package:flutter/material.dart';
import 'package:smart_dash/feature/analytics/domain/time_series.dart';
import 'package:smart_dash/widget/chart/smart_dash_sparkline.dart';
import 'package:smart_dash/widget/tile/smart_dash_tile.dart';
import 'package:smart_dash/util/time/time_series.dart';
import 'package:smart_dash/util/typedefs.dart';
import 'package:smart_dash/widget/smart_dash_animator_widget.dart';

class SparklineTile<T extends num> extends StatelessWidget {
  const SparklineTile({
    super.key,
    required this.history,
    required this.title,
    required this.leading,
    required this.subTitle,
    required this.valueBuilder,
    this.lineMin,
    this.lineMax,
    this.begin = 0,
    this.pointIndex,
    this.lineLabeler,
    this.lineStep = 1,
    this.pointsMode = PointsMode.last,
  });

  final int begin;
  final int lineStep;
  final int? lineMin;
  final int? lineMax;
  final String title;
  final Widget leading;
  final int? pointIndex;
  final String subTitle;
  final TimeSeries history;
  final PointsMode pointsMode;
  final ValueBuilder<String, List<T>> valueBuilder;
  final String Function(double value)? lineLabeler;

  @override
  Widget build(BuildContext context) {
    final data = history.isNotEmpty
        ? history.select<T>(begin: begin).firstColumn.cast<T>()
        : <T>[];
    return SmartDashAnimatorWidget<List<T>>(
      data: data,
      initialData: const [],
      forward: (begin, end) => SparklineTween<T>(
        begin: begin,
        end: end,
      ),
      builder: (context, animation, child) {
        return SmartDashTile(
          title: title,
          subTitle: subTitle,
          constraints: const BoxConstraints(
            minWidth: 270,
            minHeight: 150,
          ),
          leading: leading,
          trailing: Text(
            valueBuilder(data),
            style: const TextStyle(
              color: Colors.lightGreen,
              fontWeight: FontWeight.bold,
            ),
            textScaler: const TextScaler.linear(1.2),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: AnimatedSmartDashSparkline(
              data: data,
              minHeight: 130,
              showGrid: true,
              lineMin: lineMin,
              lineMax: lineMax,
              lineStep: lineStep,
              animation: animation,
              pointIndex: pointIndex,
              pointsMode: pointsMode,
              lineLabeler: lineLabeler,
            ),
          ),
        );
      },
    );
  }
}
