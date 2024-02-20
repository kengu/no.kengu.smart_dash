import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:flutter/material.dart';

enum ResponsiveType {
  mobile,
  mobileLarge,
  tablet,
  desktop,
}

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget? mobileLarge;
  final Widget? tablet;
  final Widget desktop;

  const ResponsiveWidget({
    super.key,
    required this.mobile,
    required this.desktop,
    this.tablet,
    this.mobileLarge,
  });

  static EdgeInsets toHeaderMargin(BuildContext context) => EdgeInsets.only(
        bottom: ResponsiveWidget.toBodyTop(context) - 108,
        left: 20,
        right: 20,
      );

  static double toBodyTop(BuildContext context) =>
      MediaQuery.of(context).size.height - AppBar().preferredSize.height;

  static bool isAnyMobile(BuildContext context) =>
      isMobile(context) || isMobileLarge(context);

  static bool isNotMobile(BuildContext context) => !isAnyMobile(context);

  static bool isMobile(BuildContext context) =>
      getWindowType(context) <= AdaptiveWindowType.xsmall;

  static bool isMobileLarge(BuildContext context) {
    final type = getWindowType(context);
    return type > AdaptiveWindowType.xsmall && type <= AdaptiveWindowType.small;
  }

  static bool isTablet(BuildContext context) {
    final type = getWindowType(context);
    return type > AdaptiveWindowType.small && type <= AdaptiveWindowType.medium;
  }

  static bool isDesktop(BuildContext context) =>
      getWindowType(context) >= AdaptiveWindowType.large;

  static ResponsiveType toType(BuildContext context) {
    if (isDesktop(context)) {
      return ResponsiveType.desktop;
    } else if (isMobileLarge(context)) {
      return ResponsiveType.mobileLarge;
    } else if (isTablet(context)) {
      return ResponsiveType.tablet;
    }
    return ResponsiveType.mobile;
  }

  @override
  Widget build(BuildContext context) {
    return switch (toType(context)) {
      ResponsiveType.mobile => mobile,
      ResponsiveType.desktop => desktop,
      ResponsiveType.tablet => tablet ?? desktop,
      ResponsiveType.mobileLarge => mobileLarge ?? mobile,
    };
  }
}
