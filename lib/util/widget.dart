import 'package:flutter/widgets.dart';

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
