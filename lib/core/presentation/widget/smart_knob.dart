import 'dart:math';
import 'package:flutter/material.dart';
import 'package:smart_dash/core/presentation/theme/smart_dash_theme_data.dart';
import 'package:smart_dash/util/data/units.dart';

typedef SmartKnobValueBuilder = Widget Function(double value);

class SmartKnob extends StatefulWidget {
  const SmartKnob({
    super.key,
    double? value,
    this.size = 150,
    this.valueBuilder,
    this.tickLabelBuilder,
    required this.minValue,
    required this.maxValue,
    this.sections = const [],
  }) : value = value ?? minValue;

  final double size;
  final double value;
  final List<SmartKnobSectionData> sections;
  final double minValue;
  final double maxValue;

  final SmartKnobValueBuilder? valueBuilder;
  final SmartKnobTickLabelBuilder? tickLabelBuilder;

  @override
  SmartKnobState createState() => SmartKnobState();
}

class SmartKnobState extends State<SmartKnob> {
  double _value = 0;

  double _range = 0;

  double _angle = 0.0;

  late SmartKnobValueBuilder _valueBuilder;

  @override
  void initState() {
    _setFromWidget();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SmartKnob oldWidget) {
    _setFromWidget();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final surfaceColor = Theme.of(context).navigationRailTheme.backgroundColor!;
    final lineColor = surfaceColor.lighten(0.05);
    return SizedBox(
      width: widget.size + 100,
      height: widget.size + 120,
      child: GestureDetector(
        onTapUp: (details) => _onUpdate(details.globalPosition),
        onPanUpdate: (details) => _onUpdate(details.globalPosition),
        child: Container(
          padding: const EdgeInsets.only(top: 24),
          child: Stack(
            clipBehavior: Clip.antiAlias,
            alignment: Alignment.center,
            children: [
              CustomPaint(
                painter: KnobSectionPainter(
                  minAngle: pi,
                  color: widget.sections.first.color,
                  angle: _toAngle(
                    widget.sections.first.value,
                    _range,
                  ),
                ), // Adjust the radius as needed
                child: SizedBox(
                  width: widget.size - 18,
                  height: widget.size - 18,
                ),
              ),
              CustomPaint(
                painter: SmartKnobTicksPainter(
                  minAngle: pi,
                  tickLength: 6,
                  tickPaint: Paint()
                    ..color = lineColor
                    ..strokeWidth = 2,
                  radius: widget.size ~/ 2 + 12,
                  numberOfTicks: _range.toInt(),
                  tickLabelBuilder: _tickLabelBuilder(),
                  selectAngles: [
                    _toAngle(_value, _range) + 2 * pi,
                    _toAngle(widget.sections.first.value, _range) + 2 * pi,
                  ],
                ), // Adjust the radius as needed
                child: SizedBox(
                  width: widget.size,
                  height: widget.size,
                ),
              ),
              Container(
                width: widget.size + 16,
                height: widget.size + 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: surfaceColor.lighten().withAlpha(180),
                ),
                alignment: Alignment.center,
              ),
              Material(
                elevation: 8.0,
                color: Colors.blue,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.size + 8),
                ),
                child: Container(
                  width: widget.size - 16,
                  height: widget.size - 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.lightGreen.shade600,
                  ),
                  alignment: Alignment.center,
                ),
              ),
              CustomPaint(
                foregroundPainter: SmartKnobIndicatorPainter(
                  _angle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: widget.size - 32,
                    height: widget.size - 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.lightGreen.shade700,
                    ),
                    alignment: Alignment.center,
                  ),
                ),
              ),
              _valueBuilder(_value),
            ],
          ),
        ),
      ),
    );
  }

  void _setFromWidget() {
    _value = widget.value.clamp(
      widget.minValue,
      widget.maxValue,
    );
    _valueBuilder = _setValueBuilder();
    _range = widget.maxValue - widget.minValue;
    _angle = _toAngle(
      _value,
      _range,
    );
  }

  double _toAngle(double value, double range) {
    return _snapTo(
      pi * (value - widget.minValue - range) / range,
    );
  }

  SmartKnobValueBuilder _setValueBuilder() {
    return widget.valueBuilder ??
        (value) => Text(_value.toTemperature(0),
            style: const TextStyle(color: Colors.white),
            textScaler: const TextScaler.linear(1.4));
  }

  void _onUpdate(Offset point) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final center = Offset(
      renderBox.size.width / 2,
      renderBox.size.height / 2,
    );

    final Offset localPoint = renderBox.globalToLocal(point);

    // Normalize the x and y coordinates at origin of circle
    final dx = localPoint.dx - center.dx;
    final dy = localPoint.dy - center.dy;

    // In upper quadrants?
    double angle = atan2(dy, dx);

    // Snap angle to closes value step
    angle = _snapTo(angle);

    if (angle >= 0) {
      angle = angle > pi / 2 ? -pi : 0;
    }

    if (_angle != angle) {
      setState(() {
        _angle = angle;
        _value = _toValue(angle);
      });
    }
  }

  double _toValue(double angle) {
    return widget.minValue + _range / pi * (angle + pi);
  }

  double _snapTo(double angle) {
    final steps = pi / _range;
    final residue = angle % steps;
    final base = angle - residue;
    angle = residue.abs() < steps / 2 ? base : angle + steps - residue;
    return angle;
  }

  SmartKnobTickLabelBuilder? _tickLabelBuilder() {
    if (widget.tickLabelBuilder != null) {
      return (index, count, angle) {
        return widget.tickLabelBuilder!(index, count, _value);
      };
    }
    return null;
  }
}

class SmartKnobSectionData {
  SmartKnobSectionData({
    required this.value,
    this.color = Colors.blue,
  });
  final Color color;
  final double value;
}

class SmartKnobIndicatorPainter extends CustomPainter {
  final double angle;

  SmartKnobIndicatorPainter(this.angle);

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = size.width / 2;
    final Paint paint = Paint()
      ..color = Colors.white54
      ..style = PaintingStyle.fill;

    // Calculate the position of the indicator dot on the edge of the circle
    final double dx = cos(angle) * (radius - 20);
    final double dy = sin(angle) * (radius - 20);
    final Offset dotPosition = center + Offset(dx, dy);

    // Draw the dot
    canvas.drawCircle(dotPosition, 5.0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

typedef SmartKnobTickLabelBuilder = String Function(
    int tick, int count, double value);

class SmartKnobTicksPainter extends CustomPainter {
  SmartKnobTicksPainter({
    required this.radius,
    required this.tickPaint,
    this.tickLabelBuilder,
    this.minAngle = 0.0,
    this.maxAngle = 2 * pi,
    this.tickLength = 10.0,
    this.numberOfTicks = 10,
    this.selectAngles = const [],
  }); // Thickness of the tick marks

  final double radius;
  final double minAngle;
  final double maxAngle;
  final Paint tickPaint;
  final double tickLength;
  final int numberOfTicks;
  final List<double> selectAngles;
  final SmartKnobTickLabelBuilder? tickLabelBuilder;

  @override
  void paint(Canvas canvas, Size size) {
    final delta = maxAngle - minAngle;
    final color = tickPaint.color;
    final strokeWidth = tickPaint.strokeWidth;
    // Get center of circle
    final Offset origo = Offset(size.width / 2, size.height / 2);

    for (int i = 0; i <= numberOfTicks; i++) {
      // Calculate the angle for each tick mark
      final angle = minAngle + i * delta / numberOfTicks;

      // Starting point of the tick mark (on the circle)
      final Offset start = origo + Offset(cos(angle), sin(angle)) * radius;

      // Ending point of the tick mark (outside the circle)
      final Offset end =
          origo + Offset(cos(angle), sin(angle)) * (radius + tickLength);

      if (selectAngles.contains(angle)) {
        tickPaint.color = color.lighten();
        tickPaint.strokeWidth = strokeWidth * 2;
      } else {
        tickPaint.color = color;
        tickPaint.strokeWidth = strokeWidth;
      }

      // Draw the tick mark
      canvas.drawLine(start, end, tickPaint);

      if (tickLabelBuilder != null) {
        final text = tickLabelBuilder!(i, numberOfTicks, angle);
        if (text.isNotEmpty) {
          final textPainter = TextPainter(
            text: TextSpan(
              // text: labelPrefix + gridLineText,
              text: text,
              style: TextStyle(
                fontSize: 10.0,
                color: tickPaint.color,
                fontWeight: FontWeight.bold,
              ),
            ),
            textDirection: TextDirection.ltr,
          );
          textPainter.layout();
          final box = textPainter.size;
          // Calculate intersection with box
          final intersect = _intersect(end, box, origo);
          final distance = (end - intersect).distance;
          Offset labelPos = end + Offset.fromDirection(angle, distance + 5);

          textPainter.paint(
            canvas,
            labelPos - Offset(box.width / 2, box.height / 2),
          );
        }
      }
    }
  }

  // Adapted from https://stackoverflow.com/a/70581013
  Offset _intersect(Offset center, Size box, Offset origo) {
    double w = box.width / 2;
    double h = box.height / 2;

    double dx = origo.dx - center.dx;
    double dy = origo.dy - center.dy;

    // If A=B, return B itself
    if (dx == 0 && dy == 0) {
      return center;
    }

    double tanPhi = h / w;
    double tanTheta = (dy / dx).abs();

    // Determine in which quadrant the A point is
    double qx = dx.sign;
    double qy = dy.sign;

    double xI, yI;

    if (tanTheta > tanPhi) {
      xI = center.dx + (h / tanTheta) * qx;
      yI = center.dy + h * qy;
    } else {
      xI = center.dx + w * qx;
      yI = center.dy + w * tanTheta * qy;
    }

    return Offset(xI, yI);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class KnobSectionPainter extends CustomPainter {
  KnobSectionPainter({
    required this.angle,
    required this.color, // Length of each tick mark
    this.minAngle = 0.0, // Length of each tick mark
    this.maxAngle = 2 * pi,
  });

  final double angle;
  final Color color;
  final double minAngle;
  final double maxAngle;

  static const strokeWidth = 15.0;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = color
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.round;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2) + strokeWidth - 6;

    // Draw the arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      minAngle,
      pi + angle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
