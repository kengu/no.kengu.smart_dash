import 'package:flutter/material.dart';
import 'package:smart_dash_app/core/presentation/widget/responsive_widget.dart';
import 'package:smart_dash_app/core/presentation/widget/smart_dash_toolbar.dart';

/// A fullscreen dialog with [Scaffold].
class SmartDashScreen extends StatelessWidget {
  const SmartDashScreen({
    super.key,
    required this.title,
    required this.child,
    required this.onClose,
    this.physics,
    this.scrollable = true,
    this.actions = const [],
    this.icon = Icons.close,
    this.constraints = const BoxConstraints(),
  });

  /// Screen title (shown on AppBar)
  final String title;

  final IconData icon;

  /// Called when user cancels form
  final VoidCallback onClose;

  /// A list of Widgets to display in a row after the [title] widget.
  final List<Widget> actions;

  /// How the scroll view should respond to user input.
  final ScrollPhysics? physics;

  /// The screen content
  final Widget child;

  /// Constraints of screen body
  final BoxConstraints constraints;

  /// If true [child] is wrapped in a [SingleChildScrollView]
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.canvasColor,
      body: SafeArea(
        child: ResponsiveScreenViewWidget(
          toolbar: SmartDashToolbar(
            title: title,
            leading: IconButton(
              icon: Icon(icon),
              onPressed: onClose,
            ),
            actions: actions,
          ),
          constraints: constraints,
          child: scrollable
              ? SingleChildScrollView(
                  child: child,
                )
              : child,
        ),
      ),
    );
  }
}

class ResponsiveScreenViewWidget extends StatelessWidget {
  const ResponsiveScreenViewWidget({
    super.key,
    required this.child,
    this.toolbar,
    this.constraints,
  });

  /// The screen content
  final Widget child;

  /// The screen toolbar
  final Widget? toolbar;

  /// Constraints of screen body
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      // Scaffold with bottom navigation bar
      mobile: MobileScreenBodyWidget(
        constraints: constraints,
        toolbar: toolbar,
        child: child,
      ),
      // Scaffold with navigation rail
      desktop: DesktopScreenViewWidget(
        constraints: constraints,
        toolbar: toolbar,
        child: child,
      ),
    );
  }
}

class MobileScreenBodyWidget extends StatelessWidget {
  const MobileScreenBodyWidget({
    super.key,
    required this.child,
    this.toolbar,
    this.constraints,
  });

  /// Child widget to be scrolled
  final Widget child;

  /// The screen toolbar
  final Widget? toolbar;

  /// Constraints of screen body
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: constraints,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (toolbar != null) toolbar!,
            Expanded(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}

class DesktopScreenViewWidget extends StatelessWidget {
  const DesktopScreenViewWidget({
    super.key,
    required this.child,
    this.toolbar,
    this.constraints,
  });

  /// Child widget to be scrolled
  final Widget child;

  /// The screen toolbar
  final Widget? toolbar;

  /// Constraints of screen body
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: constraints,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (toolbar != null) toolbar!,
            Expanded(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
