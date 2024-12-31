import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

/// Type definition of [AsyncValue] load notifier
typedef AsyncViewModelProvider<Data>
    // TODO: Try to find another way to do this with riverpod
    // ignore: invalid_use_of_internal_member
    = BuildlessAutoDisposeAsyncNotifier<Optional<Data>>;

/// Type definition of [AsyncValue] load notifier builder
typedef AsyncViewModelProviderBuilder<Query, Data,
        Controller extends AsyncViewModelProvider<Data>>
    // TODO: Try to find another way to do this with riverpod
    // ignore: invalid_use_of_internal_member
    = AutoDisposeAsyncNotifierProviderImpl<Controller, Optional<Data>> Function(
        Query query);

/// [AsyncViewModel] interface (mixin).
mixin AsyncViewModel<Query, Data> {
  late final Query query;

  AsyncValue<Optional<Data>> get state;
  set state(AsyncValue<Optional<Data>> newState);

  FutureOr<Optional<Data>> build(Query query) {
    return load(query);
  }

  FutureOr<Optional<Data>> load(Query query);
}
