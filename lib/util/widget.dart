import 'package:flutter/material.dart';
import 'package:smart_dash/core/presentation/theme/smart_dash_theme_data.dart';

TextStyle getLegendTextStyle(BuildContext context) {
  final surfaceColor = Theme.of(context).navigationRailTheme.backgroundColor!;
  final legendTextColor = surfaceColor.lighten(0.3);
  return Theme.of(context)
      .textTheme
      .labelSmall!
      .copyWith(color: legendTextColor);
}

MaterialColor toMaterial(Color color) {
  return MaterialColor(
    color.value,
    {
      50: color.lighten(0.5),
      100: color.lighten(0.4),
      200: color.lighten(0.3),
      300: color.lighten(0.2),
      400: color.lighten(0.1),
      500: color,
      600: color.darken(0.1),
      700: color.darken(0.2),
      800: color.darken(0.3),
      900: color.darken(0.4)
    },
  );
}
