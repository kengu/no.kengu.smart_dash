import 'dart:math';
import 'package:flutter/material.dart';

class SmartKnob extends StatefulWidget {
  const SmartKnob({super.key});

  @override
  SmartKnobState createState() => SmartKnobState();
}

class SmartKnobState extends State<SmartKnob> {
  double _value = 20; // Initial value

  void _updateValue(Offset localPosition) {
    final double angle = atan2(localPosition.dy - 150, localPosition.dx - 150);
    final double angleInDegrees = angle * 180 / pi;
    // Convert angle to temperature value or selection value as needed
    // This requires mapping the angle range to your value range.
    _value = angleInDegrees;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        _updateValue(details.localPosition);
      },
      child: SizedBox(
        width: 300,
        height: 300,
        child: CustomPaint(
          painter: KnobPainter(_value),
        ),
      ),
    );
  }
}

class KnobPainter extends CustomPainter {
  final double value;

  KnobPainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..color = Colors.blue;

    final Paint knobPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2) - 10;

    // Draw the arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi / 6,
      2 * pi * (value - 16) / (30 - 16),
      false,
      paint,
    );

    // Draw the knob
    final knobAngle = 2 * pi * (value - 16) / (30 - 16) + pi / 6;
    final knobX = cos(knobAngle) * radius + center.dx;
    final knobY = sin(knobAngle) * radius + center.dy;
    canvas.drawCircle(Offset(knobX, knobY), 15, knobPaint);

    // Add more painting (like the temperature text) as needed
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
