import 'dart:async';

import 'package:optional/optional_internal.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_app/core/presentation/widget/state/smart_dash_state.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_datasource/smart_dash_datasource.dart';

part 'repository_view_model.g.dart';

abstract class RepositoryQuery<I, T> {
  Future<Optional<RepositoryState<I, T>>> get(
      ConnectionAwareRepository<I, T> repo);
  bool handles(RepositoryEvent<I, RepositoryState<I, T>> event);
}

@Riverpod(keepAlive: true)
abstract class RepositoryViewModel<I, T, Q extends RepositoryQuery<I, T>>
    extends _$RepositoryViewModel<I, T, Q>
    with
        AsyncViewModel<Q, RepositoryState<I, T>>,
        AsyncSaveMixin<Q, RepositoryState<I, T>> {
  RepositoryViewModel(this.repo) {
    ref.onDispose(() {
      for (final it in _subscriptions) {
        it.cancel();
      }
    });
  }

  final ConnectionAwareRepository<I, T> repo;
  final List<StreamSubscription> _subscriptions = [];

  @override
  FutureOr<Optional<RepositoryState<I, T>>> build(Q query) async {
    // Listen for changes to the repository and update state
    _subscriptions.add(repo.events.listen((event) {
      if (query.handles(event)) {
        // Trigger UI update when repository changes
        state = AsyncValue.data(
          event.item.toOptional,
        );
      }
    }));
    return super.build(query);
  }

  @override
  FutureOr<Optional<RepositoryState<I, T>>> load(Q query) {
    return query.get(repo);
  }

  @visibleForOverriding
  T fromJson(JsonObject value);

  @override
  RepositoryState<I, T> toData(JsonObject value) {
    final data = fromJson(value);
    return RepositoryState<I, T>.modified(data);
  }

  @override
  Future<bool> save(RepositoryState<I, T> data) async {
    final result = await repo.addOrUpdate(data.data);
    return result.isNotEmpty;
  }
}
