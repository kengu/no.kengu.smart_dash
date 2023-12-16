import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:smart_dash/util/typedefs.dart';
import 'package:smart_dash/widget/smart_dash_error_widget.dart';
import 'package:smart_dash/widget/smart_dash_progress_indicator.dart';
import 'package:smart_dash/widget/load/async_load_controller.dart';

typedef AsyncLoadWidgetBuilder<Data> = Widget Function(
  BuildContext context,
  WidgetRef ref,
  Optional<Data> data,
  Widget? child,
);

/// [ReactiveForm] wrapped with [Scaffold].
class AsyncLoadWidget<Query, Data> extends ConsumerWidget {
  const AsyncLoadWidget({
    super.key,
    required this.builder,
    required this.provider,
    this.query,
    this.child,
    this.onError,
  });

  /// Data query used buy [AsyncLoadController] to load data
  final Query? query;

  /// Called when an error have occurred
  final ErrorCallback? onError;

  /// Builder called when [Data] returns from [value].
  final AsyncLoadWidgetBuilder<Data> builder;

  /// A provider of [AsyncValue] of type [Data] fetched async
  final AsyncLoadControllerProvider<Query, Data> provider;

  /// The screen content
  final Widget? child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _invalidate(ref).watch(provider).when(
          error: _onError,
          loading: SmartDashProgressIndicator.new,
          data: (data) => builder(context, ref, data, child),
        );
  }

  WidgetRef _invalidate(WidgetRef ref) {
    if (query != null) {
      if (ref.read(provider.notifier).select(query as Query)) {
        ref.invalidate(provider);
      }
    }
    return ref;
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
