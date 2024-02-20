import 'package:flutter/material.dart';
import 'package:smart_dash/core/presentation/widget/load/async_load_controller.dart';
import 'package:smart_dash/core/presentation/widget/load/async_load_widget.dart';
import 'package:smart_dash/core/presentation/widget/smart_dash_screen.dart';
import 'package:smart_dash/util/typedefs.dart';

/// A async load fullscreen dialog with [Scaffold]
class AsyncLoadScreen<Query, Data> extends StatelessWidget {
  const AsyncLoadScreen({
    super.key,
    required this.title,
    required this.onClose,
    required this.builder,
    required this.provider,
    this.child,
    this.query,
    this.onError,
    this.physics,
    this.scrollable = false,
    this.actions = const [],
    this.constraints = const BoxConstraints(),
  });

  /// Screen title (shown on AppBar)
  final String title;

  /// Called when user cancels form
  final VoidCallback onClose;

  /// A list of Widgets to display in a row after the [title] widget.
  final List<Widget> actions;

  /// [SingleChildScrollView] is inserted above [child] if true
  final bool scrollable;

  /// How the scroll view should respond to user input.
  final ScrollPhysics? physics;

  /// Data query used buy [AsyncLoadController] to load data
  final Query? query;

  /// Called when an error have occurred
  final ErrorCallback? onError;

  /// Builder called when [Data] returns from [angle].
  final AsyncLoadWidgetBuilder<Data> builder;

  /// A provider of [AsyncValue] of type [Data] fetched async
  final AsyncLoadControllerProvider<Query, Data> provider;

  /// The screen content
  final Widget? child;

  /// Constraints of screen body
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return SmartDashScreen(
      title: title,
      actions: actions,
      onClose: onClose,
      physics: physics,
      scrollable: scrollable,
      constraints: constraints,
      child: AsyncLoadWidget<Query, Data>(
        query: query,
        provider: provider,
        builder: builder,
        onError: onError,
        child: child,
      ),
    );
  }
}
