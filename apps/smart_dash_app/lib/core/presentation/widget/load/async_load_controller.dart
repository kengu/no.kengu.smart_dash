import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

/*


The argument type 'AccountFormScreenControllerProvider Function(AccountQuery)'
 can't be assigned to the parameter type
 'AutoDisposeAsyncNotifierProviderImpl<AutoDisposeAsyncNotifier<dynamic>, dynamic> Function(AccountQuery)'.

AutoDisposeAsyncNotifierProviderImpl<AccountFormScreenController,
    Optional<Account>>


 */

/// Type definition of [AsyncValue] load notifier
typedef AsyncLoadControllerProvider<Data>
    // TODO: Try to find another way to do this with riverpod
    // ignore: invalid_use_of_internal_member
    = BuildlessAutoDisposeAsyncNotifier<Optional<Data>>;

/// Type definition of [AsyncValue] load notifier builder
typedef AsyncLoadControllerProviderBuilder<Query, Data,
        Controller extends AsyncLoadControllerProvider<Data>>
    // TODO: Try to find another way to do this with riverpod
    // ignore: invalid_use_of_internal_member
    = AutoDisposeAsyncNotifierProviderImpl<Controller, Optional<Data>> Function(
        Query query);

/// [AsyncLoadController] interface (mixin).
mixin AsyncLoadController<Query, Data> {
  late final Query query;

  AsyncValue<Optional<Data>> get state;
  set state(AsyncValue<Optional<Data>> newState);

  FutureOr<Optional<Data>> build(Query query) {
    return load(query);
  }

  FutureOr<Optional<Data>> load(Query query);
}

/*
/// Delegate class for implementing [AsyncNotifier]
class AsyncNotifierDelegate<Data, Query> {
  Query? _query;
  Data? _latest;
  final _queryCompleter = Completer();

  /// Get [query] currently in use.
  Query? get query => _query;

  /// Get latest value. Not available until first [build]
  Optional<Data> get latest => Optional.ofNullable(_latest);

  @visibleForOverriding
  set latest(Optional<Data> data) => _latest = data.orElseNull;

  /// Set [query] for
  bool select(Query query) {
    final old = _query;
    final dirty = old != query;
    _query = query;
    if (dirty) {
      _complete(query);
    }
    return dirty;
  }

  void _complete(query) {
    if (!_queryCompleter.isCompleted) {
      _queryCompleter.complete(query);
    }
  }

  /// {@template select_query_before_build}
  /// Async initializer of [state].
  ///
  /// This method guards against uninitialized [query].
  /// Initialize [query] with[select] before [AsyncValue.watch]
  /// is called.
  ///
  /// Example
  /// ```dart
  ///   @override
  ///   Widget build(BuildContext context, WidgetRef ref) {
  ///    // 1 >> select data to load ...
  ///    if (ref.read(provider.notifier).select(this.query)) {
  ///      ref.invalidate(provider);
  ///    }
  ///    // 2 >> ... before you watch for data
  ///    return ref.watch(provider).when(
  ///        data: (data) {
  ///          return builder(context, ref, data, child);
  ///        },
  ///        loading: SmartDashProgressIndicator.new,
  ///        error: (e, stackTrace) {
  ///          _onError(e, stackTrace);
  ///          return SmartDashErrorWidget.from(e, stackTrace);
  ///        });
  ///  }
  /// ```
  ///
  /// A [TimeoutException] is thrown if [select] is
  /// not called within given [timeout] (default is 100ms).
  /// {@endtemplate}
  FutureOr<Optional<Data>> build(
    Query query,
    Future<Optional<Data>> Function(Query query) load, {
    Duration timeout = const Duration(milliseconds: 100),
  }) async {
    final state = _queryCompleter.isCompleted
        ? await AsyncValue.guard(() => load(query))
        : await _queryCompleter.future.then(
            (_) {
              return AsyncValue.guard(() => load(query));
            },
          ).timeout(timeout);
    if (state.hasValue) {
      _latest = state.value?.orElseNull;
    }
    return Optional.ofNullable(
      _latest,
    );
  }
}
 */
