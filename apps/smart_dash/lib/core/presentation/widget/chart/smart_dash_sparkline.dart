import 'dart:math';
import 'dart:ui';

import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:smart_dash/core/presentation/widget/chart/axis_painter.dart';
import 'package:smart_dash/core/presentation/theme/smart_dash_theme_data.dart';
import 'package:smart_dash/util/data/list.dart';
import 'package:smart_dash/util/data/num.dart';

export 'package:chart_sparkline/chart_sparkline.dart';

class SmartDashSparkline<T extends num> extends StatelessWidget {
  const SmartDashSparkline({
    super.key,
    required this.data,
    required this.showGrid,
    this.kLine,
    this.lineMin,
    this.lineMax,
    this.minValue,
    this.maxValue,
    this.pointIndex,
    this.lineLabeler,
    this.lineSelector,
    this.pointLabeler,
    this.pointSelector,
    this.lineStep = 1,
    this.minWidth = 300.0,
    this.minHeight = 100.0,
    this.pointsMode = PointsMode.atIndex,
  });

  final int? lineMin;
  final int? lineMax;
  final int lineStep;
  final bool showGrid;
  final int? pointIndex;
  final double minWidth;
  final double minHeight;
  final double? minValue;
  final double? maxValue;
  final List<String>? kLine;
  final PointsMode pointsMode;
  final bool Function(int index)? lineSelector;
  final String Function(double value)? lineLabeler;
  final String Function(double value)? pointLabeler;
  final bool Function(int index, String? kLine)? pointSelector;

  /// List of values to be represented by the sparkline.
  ///
  /// Each data entry represents an individual point on the chart, with a path
  /// drawn connecting the consecutive points to form the sparkline.
  ///
  /// The values are normalized to fit within the bounds of the chart.
  final List<T> data;

  @override
  Widget build(BuildContext context) {
    final surfaceColor = Theme.of(context).navigationRailTheme.backgroundColor!;
    return LayoutBuilder(builder: (context, constraints) {
      return ClipRRect(
        clipBehavior: Clip.hardEdge,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            if (showGrid) _buildGrid(context),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
              ),
              child: Opacity(
                opacity: 0.9,
                child: Sparkline(
                  min: minValue,
                  max: maxValue,
                  data: data.to<double>().toList(),
                  pointsMode: pointsMode,
                  pointIndex: pointIndex,
                  pointLabel: pointLabeler,
                  pointShown: pointSelector,
                  pointsDraw: (canvas, points, kLine) {
                    final isMinMax =
                        const [Sparkline.kMax, Sparkline.kMin].contains(kLine);
                    Paint pointsPaint = Paint()
                      ..strokeWidth = 12.0
                      ..strokeCap = StrokeCap.round
                      ..color = isMinMax ? Colors.lightGreen : Colors.amber;
                    canvas.drawPoints(PointMode.points, points, pointsPaint);
                  },
                  kLine: kLine,
                  lineWidth: 2.0,
                  sharpCorners: false,
                  thresholdSize: 0.05,
                  enableThreshold: true,
                  useCubicSmoothing: false,
                  pointColor: Colors.amber,
                  cubicSmoothingFactor: 0.12,
                  fallbackWidth: minWidth,
                  fallbackHeight: minHeight,
                  lineColor: Colors.lightGreen,
                  fillMode: FillMode.below,
                  fillGradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      surfaceColor.lighten().withAlpha(120),
                      surfaceColor
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildGrid(BuildContext context) {
    final surfaceColor = Theme.of(context).navigationRailTheme.backgroundColor!;
    final lineColor = surfaceColor.lighten(0.05);
    final lineLabelColor = surfaceColor.lighten(0.2);
    final points = data.to<double>().toList();
    return LimitedBox(
      maxWidth: minWidth,
      maxHeight: minHeight,
      child: CustomPaint(
        size: Size.infinite,
        painter: AxisPainter(
          points,
          AxisType.x,
          lineWidth: 2,
          lineMin: lineMin,
          lineMax: lineMax,
          lineStep: lineStep,
          lineColor: lineColor,
          lineLabeler: lineLabeler,
          lineSelector: lineSelector,
          lineLabelColor: lineLabelColor,
          lineGradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              surfaceColor.lighten().withAlpha(120),
              surfaceColor,
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedSmartDashSparkline<T extends num> extends AnimatedWidget {
  const AnimatedSmartDashSparkline({
    super.key,
    required this.data,
    required this.showGrid,
    required Animation<List<T>> animation,
    this.kLine,
    this.lineMin,
    this.lineMax,
    this.maxValue,
    this.minValue,
    this.pointIndex,
    this.lineLabeler,
    this.pointLabeler,
    this.pointSelector,
    this.lineStep = 1,
    this.lineSelector,
    this.minWidth = 300.0,
    this.minHeight = 100.0,
    this.curve = Curves.decelerate,
    this.pointsMode = PointsMode.atIndex,
  }) : super(listenable: animation);

  final Curve curve;
  final int? lineMin;
  final int? lineMax;
  final List<T> data;
  final int lineStep;
  final bool showGrid;
  final int? pointIndex;
  final double minWidth;
  final double minHeight;
  final double? minValue;
  final double? maxValue;
  final List<String>? kLine;
  final PointsMode pointsMode;
  final bool Function(int index)? lineSelector;
  final String Function(double value)? lineLabeler;
  final String Function(double value)? pointLabeler;
  final bool Function(int index, String? kLine)? pointSelector;

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<List<T>>;
    return SmartDashSparkline<T>(
      data: animation.value,
      kLine: kLine,
      lineMin: lineMin,
      lineMax: lineMax,
      lineStep: lineStep,
      showGrid: showGrid,
      minWidth: minWidth,
      minHeight: minHeight,
      pointsMode: pointsMode,
      pointIndex: pointIndex,
      lineLabeler: lineLabeler,
      lineSelector: lineSelector,
      pointLabeler: pointLabeler,
      pointSelector: pointSelector,
      minValue: minValue ?? data.min().toDouble(),
      maxValue: maxValue ?? data.max().toDouble(),
    );
  }
}

class SparklineTween<T extends num> extends Animatable<List<T>> {
  SparklineTween({
    required List<T> begin,
    required List<T> end,
    this.curve = Curves.decelerate,
  })  : _begin = begin.toList(),
        _end = end.toList();

  List<T> _begin;
  final List<T> _end;
  final Curve curve;

  @override
  List<T> transform(double t) {
    final next = <T>[];
    final deltas = <double>[];

    _clamp();

    for (int i = 0; i < _end.length; i++) {
      final delta = clamp(_end, i) - clamp(_begin, i);
      final step = clamp(_begin, i) + delta * curve.transform(t);
      deltas.add(delta);
      next.add(step.cast<T>());
    }
    return next;
  }

  double clamp(List<T> list, int index) => list.isEmpty
      ? 0.0
      : (index > list.length - 1 ? 0.0 : list[index].toDouble());

  void _clamp() {
    final delta = _end.length - _begin.length;
    if (delta > 0) {
      _begin = _begin.padAt(0, delta, 0.cast<T>());
    } else if (delta < 0) {
      _begin.removeRange(0, min(_begin.length, delta.abs()));
    }
  }
}
