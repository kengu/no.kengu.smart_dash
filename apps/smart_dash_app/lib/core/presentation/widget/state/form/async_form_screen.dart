import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:smart_dash_app/core/presentation/widget/smart_dash_screen.dart';
import 'package:smart_dash_app/core/presentation/widget/state/smart_dash_state.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

/// A async Fullscreen dialog form widget with [Scaffold].
class AsyncFormScreen<Query, Data,
    Controller extends AsyncViewModelProvider<Data>> extends StatelessWidget {
  const AsyncFormScreen({
    super.key,
    required this.title,
    required this.query,
    required this.child,
    required this.onClose,
    required this.provider,
    required this.onSubmitted,
    this.onError,
    this.physics,
    this.builder,
    this.submitText = 'SAVE',
    this.autoSubmit = false,
    this.scrollable = false,
    this.constraints = const BoxConstraints(),
  });

  /// Screen title (shown on AppBar)
  final String title;

  /// Called when user cancels form
  final VoidCallback onClose;

  /// Called when an error have occurred
  final ErrorCallback? onError;

  /// Called when user submitted form successfully
  final ValueChanged<Data> onSubmitted;

  /// Data query used buy [AsyncFormViewModel] to load data
  final Query query;

  /// A provider of [AsyncValue] of type [Data] fetched async
  final AsyncViewModelProviderBuilder<Query, Data, Controller> provider;

  /// [SingleChildScrollView] is inserted above [child] if true
  final bool scrollable;

  /// How the scroll view should respond to user input.
  final ScrollPhysics? physics;

  /// Every change is submitted automatically (default false)
  /// No manual 'SAVE' action is shown when auto submitting.
  final bool autoSubmit;

  final String submitText;

  /// Constraints of form body
  final BoxConstraints constraints;

  /// Builder called after [FormGroup] is built.
  final AsyncFormWidgetBuilder<Data>? builder;

  /// The form content inserted below [ReactiveFormBuilder] in [AsyncFormWidget]
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      child: child,
      builder: (context, ref, _) {
        return AsyncFormWidget<Query, Data, Controller>(
          query: query,
          onError: onError,
          builder: builder,
          provider: provider,
          autoSubmit: autoSubmit,
          onSubmitted: onSubmitted,
          child: SmartDashScreen(
            title: title,
            onClose: onClose,
            physics: physics,
            scrollable: scrollable,
            constraints: constraints,
            actions: [
              if (!autoSubmit)
                ReactiveFormConsumer(
                  builder: (_, FormGroup formGroup, __) {
                    return TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                      ),
                      onPressed: () => _onSubmit(ref, formGroup),
                      child: Text(submitText),
                    );
                  },
                ),
            ],
            child: child,
          ),
        );
      },
    );
  }

  void _onSubmit(WidgetRef ref, FormGroup formGroup) {
    if (formGroup.valid) {
      AsyncFormViewModel.of(ref, provider, query)
          .submit(formGroup.value)
          .then((value) => onSubmitted(value.value), onError: onError);
    } else {
      formGroup.markAllAsTouched();
    }
  }
}
