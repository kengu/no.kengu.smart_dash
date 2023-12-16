import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:flutter/material.dart';

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

  static bool isMobile(BuildContext context) =>
      getWindowType(context) <= AdaptiveWindowType.xsmall;

  static bool isMobileLarge(BuildContext context) =>
      getWindowType(context) <= AdaptiveWindowType.small;

  static bool isTablet(BuildContext context) =>
      getWindowType(context) <= AdaptiveWindowType.medium;

  static bool isDesktop(BuildContext context) =>
      getWindowType(context) >= AdaptiveWindowType.large;

  @override
  Widget build(BuildContext context) {
    if (isDesktop(context)) {
      return desktop;
    } else if (isMobileLarge(context)) {
      return (mobileLarge ?? mobile);
    } else if (isTablet(context)) {
      return tablet ?? desktop;
    }

    return mobile;
  }
}
