import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_app/core/presentation/widget/state/smart_dash_state.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:stream_transform/stream_transform.dart';

/// [AsyncFormViewModel] interface (mixin). The method [build] MUST be
/// overridden by class using mixin. If not, riverpod_generator will throw
/// and error (mixins are not evaluated by it, only classes I guess).
mixin AsyncFormViewModel<Query, Data>
    implements AsyncViewModel<Query, Data>, AsyncSaveMixin<Query, Data> {
  static AsyncFormViewModel<Query, Data> of<Query, Data>(
      WidgetRef ref,
      AsyncViewModelProviderBuilder<Query, Data, AsyncViewModelProvider<Data>>
          provider,
      Query query) {
    return ref.read(provider(query).notifier)
        as AsyncFormViewModel<Query, Data>;
  }

  /// Reference to [FormGroup.valueChanges],
  /// closed on [autoSubmit] with refresh
  StreamSubscription? _subscription;

  /// Stream of [Data] automatically submitted
  final StreamController<Data> _autoSubmits =
      StreamController<Data>.broadcast();

  /// True if [FormGroup.valueChanges] are automatically submitted
  bool get isAutoSubmitting => _subscription != null;

  /// Build [FormGroup] from given [data]
  FormGroup buildForm(Optional<Data> data);

  /// Subscribes to [FormGroup.valueChanges] stream
  /// and submits every one automatically.
  /// Use [duration] (default 200 ms) to suppresses events
  /// with less inter-event spacing than given by [duration]
  /// Returns a stream of
  Stream<Data> autoSubmit(
    FormGroup formGroup, [
    Duration duration = const Duration(milliseconds: 200),
  ]) {
    _subscription?.cancel();
    _subscription = formGroup.valueChanges.debounce(duration).listen(
          submit,
        );
    return _autoSubmits.stream;
  }

  /// Build [Data] from [FormGroup.value] data
  @override
  Data toData(JsonObject value);

  /// Save [Data] to persistent storage.
  @override
  @visibleForOverriding
  Future<bool> save(Data data);

  /// Submit [FormGroup.value] data.
  @override
  Future<Optional<Data>> submit(JsonObject? value) async {
    if (value != null) {
      state = AsyncLoading<Optional<Data>>();
      state = await AsyncValue.guard(() async {
        final data = toData(value);
        return await save(data)
            ? Optional.of(data)
            : Optional.ofNullable(
                state.value?.orElseNull,
              );
      });
      if (_shouldNotify) {
        _autoSubmits.add(state.value!.value);
      }
    }
    // ignore: invalid_use_of_visible_for_overriding_member
    return Optional.ofNullable(
      state.value?.orElseNull,
    );
  }

  bool get _shouldNotify =>
      isAutoSubmitting &&
      _autoSubmits.hasListener &&
      state.valueOrNull?.isPresent == true;
}
