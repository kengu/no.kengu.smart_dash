import 'dart:async';

import 'package:optional/optional.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/core/presentation/widget/load/async_load_controller.dart';
import 'package:stream_transform/stream_transform.dart';

/// Type definition of [AsyncValue] save notifier provider
typedef AsyncFormControllerProvider<Query, Data>
    = AutoDisposeAsyncNotifierProvider<AsyncFormController<Query, Data>,
        Optional<Data>>;

/// [AsyncFormController] interface (mixin). The method [build] MUST be
/// overridden by class using mixin. If not, riverpod_generator will throw
/// and error (mixins are not evaluated by it, only classes I guess).
mixin AsyncFormController<Query, Data> on AsyncLoadController<Query, Data> {
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
  Data buildData(Map<String, Object?> value);

  /// Save [Data] to store.
  @visibleForOverriding
  Future<bool> save(Data data);

  /// Submit [FormGroup.value] data.
  Future<Optional<Data>> submit(Map<String, Object?>? value) async {
    if (value != null) {
      state = AsyncLoading<Optional<Data>>();
      state = await AsyncValue.guard(() async {
        final data = buildData(value);
        return await save(data) ? Optional.of(data) : latest;
      });
      if (_shouldNotify) {
        _autoSubmits.add(state.value!.value);
      }
    }
    // ignore: invalid_use_of_visible_for_overriding_member
    return (latest = Optional.ofNullable(
      state.value?.orElseNull,
    ));
  }

  bool get _shouldNotify =>
      isAutoSubmitting && _autoSubmits.hasListener && latest.isPresent;
}
