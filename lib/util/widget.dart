import 'package:flutter/material.dart';
import 'package:smart_dash/scaffold/presentation/app/smart_dash_app_theme_data.dart';

TextStyle getLegendTextStyle(BuildContext context) {
  final surfaceColor = Theme.of(context).navigationRailTheme.backgroundColor!;
  final legendTextColor = surfaceColor.lighten(0.2);
  return Theme.of(context)
      .textTheme
      .labelSmall!
      .copyWith(color: legendTextColor);
}
