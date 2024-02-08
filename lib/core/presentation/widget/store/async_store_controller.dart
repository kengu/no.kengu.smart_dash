import 'dart:async';

import 'package:optional/optional.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/core/presentation/widget/load/async_load_controller.dart';

/// Type definition of [AsyncValue] save notifier provider
typedef AsyncStoreControllerProvider<Query, Data>
    = AutoDisposeAsyncNotifierProvider<AsyncStoreController<Query, Data>,
        Optional<Data>>;

/// [AsyncStoreController] interface (mixin). The method [build] MUST be
/// overridden by class using mixin. If not, riverpod_generator will throw
/// and error (mixins are not evaluated by it, only classes I guess).
mixin AsyncStoreController<Query, Data> on AsyncLoadController<Query, Data> {
  /// Save [Data] to store.
  @visibleForOverriding
  Future<bool> save(Data data);

  /// Submit [FormGroup.value] data.
  Future<Optional<Data>> submit(Data value) async {
    if (value != null) {
      state = AsyncLoading<Optional<Data>>();
      state = await AsyncValue.guard(() async {
        return await save(value) ? Optional.of(value) : latest;
      });
    }
    // ignore: invalid_use_of_visible_for_overriding_member
    return (latest = Optional.ofNullable(
      state.value?.orElseNull,
    ));
  }
}
