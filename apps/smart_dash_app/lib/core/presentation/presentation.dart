import 'package:flutter/material.dart';

import 'theme/smart_dash_theme_data.dart';

export 'dialog.dart';
export 'routes.dart';
export 'smart_dash_icons_icons.dart';
export 'widget/badge_stream_widget.dart';
export 'widget/chart/axis_painter.dart';
export 'widget/chart/smart_dash_sparkline.dart';
export 'widget/circle_blip.dart';
export 'widget/list/expansion_list.dart';
export 'widget/list/multi_selector.dart';
export 'widget/list/route_selector.dart';
export 'widget/page_view.dart';
export 'widget/responsive_widget.dart';
export 'widget/selectable_box_widget.dart';
export 'widget/selectable_row_widget.dart';
export 'widget/smart_dash_animator_widget.dart';
export 'widget/smart_dash_error_widget.dart';
export 'widget/smart_dash_progress_indicator.dart';
export 'widget/smart_dash_screen.dart';
export 'widget/smart_dash_toolbar.dart';
export 'widget/smart_knob.dart';
export 'widget/snackbar/snackbar_controller.dart';
export 'widget/state/smart_dash_state.dart';
export 'widget/tile/barchart_tile.dart';
export 'widget/tile/smart_dash_tile.dart';
export 'widget/tile/sparkline_tile.dart';

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
