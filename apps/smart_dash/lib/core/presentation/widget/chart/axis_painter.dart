import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smart_dash/util/data/num.dart';

enum AxisType {
  x,
  y;

  bool get isY => this == y;
  bool get isX => this == x;
}

class AxisPainter extends CustomPainter {
  AxisPainter(
    this.dataPoints,
    this.type, {
    required this.lineWidth,
    required this.lineColor,
    required this.lineLabelColor,
    required this.lineStep,
    int? lineMin,
    int? lineMax,
    this.lineLabeler,
    this.lineGradient,
    this.lineSelector,
    this.lineLabelPrefix = '',
    this.lineLabelFontSize = 10.0,
    this.lineLabelPrecision = 0,
  })  : _lineMin = lineMin ?? 0,
        _lineMax = _calcLineMax(
          lineMax,
          lineStep,
          dataPoints,
        ),
        _maxDataValue = dataPoints.max().toDouble(),
        _minDataValue = dataPoints.min().toDouble();

  static int _calcLineMax(int? lineMax, int lineStep, List<double> dataPoints) {
    final end = dataPoints.length ~/ lineStep;
    final max = lineMax ?? dataPoints.length ~/ lineStep;
    return max < 0 ? end + max : max;
  }

  List<double> dataPoints;

  final double _minDataValue;
  final double _maxDataValue;

  final AxisType type;

  final Color lineColor;
  final double lineWidth;
  final bool Function(int index)? lineSelector;
  final String Function(double value)? lineLabeler;

  final int _lineMin;
  final int _lineMax;
  final int lineStep;
  final Color lineLabelColor;
  final String lineLabelPrefix;
  final int lineLabelPrecision;
  final Gradient? lineGradient;
  final double lineLabelFontSize;

  List<TextPainter> gridLineTextPainters = [];

  update() {
    for (int i = 0; i < dataPoints.length; i++) {
      // Label grid lines
      double lineValue = type.isY ? _lineToValue(i) : i.toDouble();
      String lineText = lineLabeler != null
          ? lineLabeler!(lineValue)
          : lineValue.toStringAsFixed(lineLabelPrecision);

      gridLineTextPainters.add(TextPainter(
        text: TextSpan(
          text: lineLabelPrefix + lineText,
          style: TextStyle(
            fontSize: lineLabelFontSize,
            color: lineLabelColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        textDirection: TextDirection.ltr,
      ));
      gridLineTextPainters[i].layout();
    }
  }

  double _lineToValue(int index) {
    return _maxDataValue -
        (((_maxDataValue - _minDataValue) / max(1, dataPoints.length)) * index);
  }

  bool _isLineWithin(int line) {
    return line >= _lineMin && line <= _lineMax;
  }

  bool _showLine(int index) {
    if (lineSelector != null) {
      return lineSelector!(index);
    }
    return index % lineStep == 0;
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (dataPoints.isEmpty) {
      dataPoints = [0.0, 0.0];
    }
    if (dataPoints.length == 1) {
      dataPoints = [dataPoints[0], dataPoints[0]];
    }

    if (gridLineTextPainters.isEmpty) {
      update();
    }

    final gridPaint = Paint()
      ..color = lineColor
      ..strokeWidth = lineWidth;

    if (lineGradient != null) {
      final height = size.height - lineWidth;
      final width = size.width - lineWidth;
      final Rect lineRect = Rect.fromLTWH(0.0, 0.0, width, height);
      gridPaint.shader = lineGradient!.createShader(lineRect);
    }

    double lineOffset = 0.0;
    final height = size.height - lineWidth;
    final steps = type.isY
        // Steps between min and max data values
        ? _maxDataValue - _minDataValue
        // Steps between first and last data value index
        : dataPoints.length - 1;

    var line = 0;
    final double lineGap = (type.isY ? height : size.width) / steps;

    // Draw grid lines aligned with points
    for (int i = 0; i < dataPoints.length; i += lineStep) {
      if (_showLine(i)) {
        if (_isLineWithin(line)) {
          final textPainter = gridLineTextPainters[i];
          final textSize = textPainter.size;
          final width = size.width - (type.isY ? textSize.width : 0.0);
          lineOffset = lineGap * i;
          canvas.drawLine(
            type.isY ? Offset(0.0, lineOffset) : Offset(lineOffset, -16.0),
            type.isY
                ? Offset(width, lineOffset)
                : Offset(lineOffset, height - 16.0),
            gridPaint,
          );

          // Label grid lines
          textPainter.paint(
            canvas,
            type.isY
                ? Offset(width + 2.0, lineOffset - 6.0)
                : Offset(
                    lineOffset - textSize.width / 2,
                    height - textSize.height,
                  ),
          );
        }
        line++;
      }
    }
  }

  @override
  bool shouldRepaint(AxisPainter oldDelegate) {
    return dataPoints != oldDelegate.dataPoints ||
        lineWidth != oldDelegate.lineWidth ||
        lineColor != oldDelegate.lineColor ||
        lineStep != oldDelegate.lineStep ||
        lineGradient != oldDelegate.lineGradient ||
        lineLabelColor != oldDelegate.lineLabelColor ||
        lineLabelPrefix != oldDelegate.lineLabelPrefix ||
        lineLabelPrecision != oldDelegate.lineLabelPrecision;
  }
}
