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
