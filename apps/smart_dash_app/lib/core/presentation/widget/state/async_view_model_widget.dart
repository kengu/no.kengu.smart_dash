import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash_app/core/presentation/widget/smart_dash_error_widget.dart';
import 'package:smart_dash_app/core/presentation/widget/smart_dash_progress_indicator.dart';
import 'package:smart_dash_app/core/presentation/widget/state/smart_dash_state.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

typedef AsyncViewModelWidgetBuilder<Data> = Widget Function(
  BuildContext context,
  WidgetRef ref,
  Optional<Data> data,
  Widget? child,
);

/// Widget for async load of data matching given query.
class AsyncViewModelWidget<Query, Data,
    Controller extends AsyncViewModelProvider<Data>> extends ConsumerWidget {
  const AsyncViewModelWidget({
    super.key,
    required this.query,
    required this.builder,
    required this.provider,
    this.child,
    this.onError,
  });

  /// Data query used buy [AsyncViewModel] to load data
  final Query query;

  /// Called when an error have occurred
  final ErrorCallback? onError;

  /// Builder called when [Data] returns from [angle].
  final AsyncViewModelWidgetBuilder<Data> builder;

  /// A provider of [AsyncValue] of type [Data] fetched async
  final AsyncViewModelProviderBuilder<Query, Data, Controller> provider;

  /// The screen content
  final Widget? child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(provider(query)).when(
          error: _onError,
          loading: SmartDashProgressIndicator.new,
          data: (state) => builder(context, ref, state, child),
        );
  }

  SmartDashErrorWidget _onError(Object cause, StackTrace stackTrace) {
    if (onError != null) {
      onError!(cause, stackTrace);
    }
    return SmartDashErrorWidget.from(
      cause,
      stackTrace,
    );
  }
}
