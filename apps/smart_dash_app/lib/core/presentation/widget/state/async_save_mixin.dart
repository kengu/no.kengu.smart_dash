import 'dart:async';

import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_app/core/presentation/widget/state/smart_dash_state.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

/// [AsyncSaveMixin] interface (mixin). The method [build] MUST be
/// overridden by class using mixin. If not, riverpod_generator will throw
/// and error (mixins are not evaluated by it, only classes I guess).
mixin AsyncSaveMixin<Query, Data> on AsyncViewModel<Query, Data> {
  /// Build [Data] from [JsonObject] data
  Data toData(JsonObject value);

  /// Save [Data] to store.
  @visibleForOverriding
  Future<bool> save(Data data);

  /// Submit [JsonObject] data to [save].
  /// If [save] returns true, [state] is updated.
  Future<Optional<Data>> submit(JsonObject? value) async {
    final current = state.value?.orElseNull;
    if (value != null) {
      state = AsyncLoading<Optional<Data>>();
      state = await AsyncValue.guard(() async {
        final data = toData(value);
        return await save(data)
            ? Optional.of(data)
            : Optional.ofNullable(current);
      });
    }
    return Optional.ofNullable(current);
  }
}
