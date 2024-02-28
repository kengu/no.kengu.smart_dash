import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:optional/optional.dart';

/// Type definition of [AsyncValue] load notifier provider
typedef AsyncLoadControllerProvider<Query, Data>
    = AutoDisposeAsyncNotifierProvider<AsyncLoadController<Query, Data>,
        Optional<Data>>;

/// [AsyncLoadController] interface (mixin). The method [build] MUST be
/// overridden by class using mixin. If not, riverpod_generator will throw
/// and error (mixins are not evaluated by it, only classes I guess).
mixin AsyncLoadController<Query, Data>
    on AutoDisposeAsyncNotifier<Optional<Data>> {
  final _delegate = AsyncNotifierDelegate<Data, Query>();

  /// Load [Data] from storage
  @visibleForOverriding
  Future<Optional<Data>> load();

  /// Get latest value.
  /// Not available until first [build]
  Optional<Data> get latest => _delegate.latest;

  @visibleForOverriding
  set latest(Optional<Data> data) => _delegate.latest = data;

  /// Get [query] currently in use.
  Query? get query => _delegate.query;

  /// Select data using given [query]
  bool select(Query query) => _delegate.select(query);

  /// {@macro select_query_before_build}
  ///
  /// This method MUST be overridden by class using this mixin. If not,
  /// riverpod_generator will output
  /// ```text
  /// No "build" method found. Classes annotated with @riverpod must define a method named "build".
  /// ```
  @override
  @mustCallSuper
  FutureOr<Optional<Data>> build() async {
    await _delegate.build(load);
    return _delegate.latest;
  }
}

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
    Future<Optional<Data>> Function() load, {
    Duration timeout = const Duration(milliseconds: 100),
  }) async {
    final state = _queryCompleter.isCompleted
        ? await AsyncValue.guard(load)
        : await _queryCompleter.future.then(
            (_) {
              return AsyncValue.guard(load);
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
