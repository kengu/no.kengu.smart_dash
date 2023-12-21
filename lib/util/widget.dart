import 'package:flutter/material.dart';
import 'package:smart_dash/scaffold/presentation/app/smart_dash_app_theme_data.dart';

Size calculateTextSize(
  BuildContext context, {
  required String text,
  required TextStyle style,
}) {
  final TextPainter textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    textDirection: Directionality.of(context),
    textScaler: MediaQuery.of(context).textScaler,
  )..layout(minWidth: 0, maxWidth: double.infinity);

  return textPainter.size;
}

TextStyle getLegendTextStyle(BuildContext context) {
  final surfaceColor = Theme.of(context).navigationRailTheme.backgroundColor!;
  final legendTextColor = surfaceColor.lighten(0.2);
  return Theme.of(context)
      .textTheme
      .labelSmall!
      .copyWith(color: legendTextColor);
}
