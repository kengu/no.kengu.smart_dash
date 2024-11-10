import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:smart_dash_app/core/presentation/widget/load/async_load_controller.dart';
import 'package:smart_dash_app/core/presentation/widget/load/async_load_widget.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

import 'async_store_controller.dart';

typedef AsyncStoreWidgetBuilder<Data> = Widget Function(
  BuildContext context,
  WidgetRef ref,
  Optional<Data> data,
  Widget? child,
);

/// Widget for async store of data matching given query.
class AsyncStoreWidget<Query, Data,
        Controller extends AsyncLoadControllerProvider<Data>>
    extends ConsumerStatefulWidget {
  const AsyncStoreWidget({
    super.key,
    required this.query,
    required this.provider,
    required this.onSubmitted,
    this.builder,
    this.onError,
    this.child,
    this.autoSubmit = false,
  }) : assert(
          child != null || builder != null,
          'builder or child must be given',
        );

  /// Data query used buy [AsyncStoreController] to load data
  final Query query;

  /// Called when an error have occurred
  final ErrorCallback? onError;

  /// Called when user submitted form successfully
  final ValueChanged<Data> onSubmitted;

  /// A provider of [AsyncValue] of type [Data] fetched async
  final AsyncLoadControllerProviderBuilder<Query, Data, Controller> provider;

  /// Every change is submitted automatically (default false)
  /// No manual 'SAVE' action is shown when auto submitting.
  final bool autoSubmit;

  /// Builder called after [FormGroup] is built.
  final AsyncStoreWidgetBuilder<Data>? builder;

  /// The screen content
  final Widget? child;

  @override
  ConsumerState<AsyncStoreWidget<Query, Data, Controller>> createState() =>
      _AsyncSaveWidgetState<Query, Data, Controller>();
}

class _AsyncSaveWidgetState<Query, Data,
        Controller extends AsyncLoadControllerProvider<Data>>
    extends ConsumerState<AsyncStoreWidget<Query, Data, Controller>> {
  @override
  Widget build(BuildContext context) {
    return AsyncLoadWidget<Query, Data, Controller>(
      query: widget.query,
      provider: widget.provider,
      builder: (context, ref, data, _) {
        return widget.builder == null
            ? widget.child!
            : widget.builder!(context, ref, data, widget.child);
      },
    );
  }
}
