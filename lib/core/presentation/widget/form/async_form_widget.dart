import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:smart_dash/core/presentation/widget/load/async_load_controller.dart';
import 'package:smart_dash/util/typedefs.dart';
import 'package:smart_dash/core/presentation/widget/load/async_load_widget.dart';
import 'package:smart_dash/core/presentation/widget/form/async_form_controller.dart';

typedef AsyncFormWidgetBuilder<Data> = Widget Function(
  BuildContext context,
  WidgetRef ref,
  Optional<Data> data,
  FormGroup formGroup,
  Widget? child,
);

/// [ReactiveForm] wrapped with [Scaffold].
class AsyncFormWidget<Query, Data,
        Controller extends AsyncLoadControllerProvider<Data>>
    extends ConsumerStatefulWidget {
  const AsyncFormWidget({
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

  /// Data query used buy [AsyncFormController] to load data
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
  final AsyncFormWidgetBuilder<Data>? builder;

  /// The screen content
  final Widget? child;

  @override
  ConsumerState<AsyncFormWidget<Query, Data, Controller>> createState() =>
      _AsyncSaveWidgetState<Query, Data, Controller>();
}

class _AsyncSaveWidgetState<Query, Data,
        Controller extends AsyncLoadControllerProvider<Data>>
    extends ConsumerState<AsyncFormWidget<Query, Data, Controller>> {
  /// Reference to stream of auto submitted [Data] changes
  StreamSubscription<Data>? _autoSubmitSubscription;

  @override
  void dispose() {
    _autoSubmitSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AsyncLoadWidget<Query, Data, Controller>(
      query: widget.query,
      provider: widget.provider,
      builder: (context, ref, data, _) {
        return ReactiveFormBuilder(
          form: () => AsyncFormController.of(
            ref,
            widget.provider,
            widget.query,
          ).buildForm(data),
          builder: (context, formGroup, _) {
            _initAutoCommitIfEnabled(formGroup);
            return widget.builder == null
                ? widget.child!
                : widget.builder!(context, ref, data, formGroup, widget.child);
          },
        );
      },
    );
  }

  void _initAutoCommitIfEnabled(FormGroup formGroup) {
    if (widget.autoSubmit) {
      _autoSubmitSubscription?.cancel();
      _autoSubmitSubscription = AsyncFormController.of<Query, Data>(
        ref,
        widget.provider,
        widget.query,
      ).autoSubmit(formGroup).listen(widget.onSubmitted);
    }
  }
}
