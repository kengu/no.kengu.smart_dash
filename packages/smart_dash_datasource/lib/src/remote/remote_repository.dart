import 'dart:async';

import 'package:async/async.dart';
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_datasource/smart_dash_datasource.dart';

abstract class RemoteRepository<I, T> extends Repository<I, T> {
  RemoteRepository(super.ref);

  RepositoryClient<I, T> get client;

  @override
  Future<bool> exists(I id) => client.exists(id);

  @override
  Future<Optional<T>> get(I id) => client.get(id);

  @override
  Future<List<T>> getAll([List<I> ids = const []]) => client.getAll(ids);

  @override
  Future<SingleRepositoryResult<I, T>> upsert(T item) async {
    final result = await client.update(item);
    return result.isNotEmpty ? raise(result) : result;
  }

  @override
  Future<SingleRepositoryResult<I, T>> remove(T item) async {
    final result = await client.remove(item);
    return result.isNotEmpty ? raise(result) : result;
  }
}

mixin BulkRemoteRepositoryMixin<I, T> on RemoteRepository<I, T>
    implements BulkWriteRepositoryMixin<I, T> {
  @override
  Future<BulkRepositoryResult<I, T>> updateAll(Iterable<T> items) async {
    final result = await client.updateAll(items);
    return result.isNotEmpty ? raise(result) : result;
  }

  @override
  Future<BulkRepositoryResult<I, T>> removeAll(Iterable<T> items) async {
    final result = await client.removeAll(items);
    return result.isNotEmpty ? raise(result) : result;
  }
}

/// RepositoryState to represent the current state of the data
class RepositoryState<I, T> {
  RepositoryState({
    required this.data,
    this.isRemote = false,
    this.isModified = false,
  });

  final T data;
  final bool isRemote;
  final bool isModified;
  bool get isLocal => !isRemote;

  factory RepositoryState.local(
    T data, [
    bool isModified = false,
  ]) {
    return RepositoryState(
      data: data,
      isRemote: false,
      isModified: isModified,
    );
  }

  factory RepositoryState.modified(T data) {
    return RepositoryState(
      data: data,
      isRemote: false,
      isModified: true,
    );
  }

  factory RepositoryState.remote(T data) {
    return RepositoryState(
      data: data,
      isRemote: true,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RepositoryState &&
          runtimeType == other.runtimeType &&
          data == other.data &&
          isRemote == other.isRemote &&
          isModified == other.isModified;

  @override
  int get hashCode => data.hashCode ^ isRemote.hashCode ^ isModified.hashCode;

  @override
  String toString() {
    return '${RepositoryState<I, T>}{data: $data, isRemote: $isRemote, isModified: $isModified}';
  }
}

typedef _Task<I, T> = (List<I>, Future<RepositoryResult<I, T>> Function());

/// Repository aware of connectivity status.
///
/// It implements an offline-first approach by always storing changes in
/// the [local] repository first before it schedules a task that applies
/// the change to the [remote] repository. If offline and commits changes to remote when status changes
/// to online.
class ConnectionAwareRepository<I, T> {
  ConnectionAwareRepository({
    required this.local,
    required this.remote,
    required this.checker,
  });

  final List<_Task<I, T>> _scheduled = [];

  @protected
  final Connectivity checker;

  @protected
  final Repository<I, T> local;

  @protected
  final RemoteRepository<I, T> remote;

  /// Test [checker] if connection is online
  bool get isOnline => checker.isOnline;

  /// Test [checker] if connection is offline
  bool get isOffline => checker.isOffline;

  /// Get current [ConnectivityStatus] from [checker]
  ConnectivityStatus get status => checker.status;

  Logger get log => Logger('$runtimeType');

  /// Get stream of [RepositoryEvent]s
  Stream<RepositoryEvent<I, RepositoryState<I, T>>> get events {
    return StreamGroup.merge([
      local.events.map((e) => _toEvent(e, false)),
      remote.events.map((e) => _toEvent(e, true)),
    ]);
  }

  /// Translate [item] to id of type [I]
  I toId(T item) => local.toId(item);

  /// Translate [id] to key of type [String]
  String toKey(I id) => local.toKey(id);

  /// Fill repository with predefined items.
  Future<List<RepositoryState<I, T>>> seed() {
    throw UnimplementedError('Seed is not implemented');
  }

  /// Test if item with given [id] exists in repository.
  Future<bool> exists(I id) {
    return local.exists(id);
  }

  /// Get given item from [local] repository.
  ///
  /// When [fetch] is true (default), [refresh]
  /// is called on given [id] after this method
  /// returns.
  Future<Optional<RepositoryState<I, T>>> get(
    I id, [
    bool fetch = true,
  ]) async {
    return guard(
      () async {
        var locals = await local.get(id);
        if (locals.isPresent) {
          return Optional.of(
            RepositoryState<I, T>.local(locals.value),
          );
        }
        return const Optional.empty();
      },
      task: 'get',
      transaction: true,
      name: '$runtimeType',
      done: () {
        if (fetch) {
          unawaited(refresh([id]));
        }
      },
    );
  }

  /// Get all given items in [local] repository.
  ///
  /// Use [ids] to pick only items that matches
  /// these. When [fetch] is true (default), [refresh]
  /// is called on given [ids] after this method
  /// returns.
  Future<List<RepositoryState<I, T>>> getAll({
    List<I> ids = const [],
    bool fetch = true,
  }) async {
    return guard(
      () => _getLocalStates(ids),
      task: 'getAll',
      transaction: true,
      name: '$runtimeType',
      done: () {
        if (fetch) {
          unawaited(refresh(ids));
        }
      },
    );
  }

  Future<List<RepositoryState<I, T>>> _getLocalStates(
    List<I> ids,
  ) async {
    final locals =
        await (ids.length == 1 ? local.get(ids.first) : local.getAll(ids));
    return locals.map(RepositoryState<I, T>.local).toList();
  }

  /// Refresh [local] with data from [remote].
  /// Note items modified locally will not be updated
  Future<List<RepositoryState<I, T>>> refresh([
    List<I> ids = const [],
  ]) async {
    return guard(
      () async {
        if (isOffline) {
          return _getLocalStates(ids);
        }
        final remotes = await (ids.length == 1
            ? remote.get(ids.first)
            : remote.getAll(ids));

        final locals = await _getLocalStates(ids);
        final removed = locals
            .where((e) => e.isRemote)
            .map((e) => e.data)
            .whereNot(remotes.contains);

        switch (local) {
          case BulkWriteRepositoryMixin<I, T>():
            final bulk = local as BulkWriteRepositoryMixin<I, T>;
            await bulk.updateAll(remotes);
            await bulk.removeAll(removed);
            break;
          default:
            for (final item in remotes) {
              local.upsert(item);
            }
            for (final it in removed) {
              await local.remove(it);
            }
            break;
        }
        return remotes.map(RepositoryState<I, T>.local).toList();
      },
      task: 'getAll',
      transaction: true,
      name: '$runtimeType',
    );
  }

  /// Get items that matches [test]
  Future<List<RepositoryState<I, T>>> where(
      bool Function(RepositoryState<I, T> element) test) async {
    return (await getAll()).where(test).toList();
  }

  /// Attempt to add given item in repository.
  ///
  /// Returns [item] with
  /// [SingleRepositoryResult.created] if not [exists], or
  /// existing with [SingleRepositoryResult.empty] otherwise.
  ///
  /// Same as
  /// ```dart
  /// final old = await get(toId(item));
  /// if (old.isPresent) {
  ///   return SingleRepositoryResult<I, T>.empty(old.value);
  /// }
  /// return addOrUpdate(item);
  /// ```
  Future<SingleRepositoryResult<I, RepositoryState<I, T>>> add(T item) async {
    final old = await get(toId(item));
    if (old.isPresent) {
      return SingleRepositoryResult<I, RepositoryState<I, T>>.empty(old.value);
    }
    return addOrUpdate(item);
  }

  /// Attempt to update given item in repository.
  ///
  /// Returns [item] with
  /// [SingleRepositoryResult.updated] if [exists] and [modified],
  /// or [SingleRepositoryResult.empty] otherwise.
  ///
  /// Same as
  /// ```dart
  /// final old = await get(toId(item));
  /// if (old.isPresent) {
  ///   return SingleRepositoryResult<I, T>.empty(old.value);
  /// }
  /// return addOrUpdate(item);
  /// ```
  Future<SingleRepositoryResult<I, RepositoryState<I, T>>> update(
      T item) async {
    final old = await get(toId(item));
    if (!old.isPresent || old.value == item) {
      return SingleRepositoryResult<I, RepositoryState<I, T>>.empty(old.value);
    }
    return addOrUpdate(item);
  }

  /// Attempt to add given item in repository.
  ///
  /// Returns [item] with
  /// [SingleRepositoryResult.updated] if [exists], or
  /// [SingleRepositoryResult.created] otherwise.
  ///
  /// Same as
  /// ```dart
  /// update(item, ifAbsent: () => item);
  /// ```
  Future<SingleRepositoryResult<I, RepositoryState<I, T>>> addOrUpdate(
    T item,
  ) async {
    return guard(
      () async {
        final result = await local.upsert(item);
        if (result.isNotEmpty) {
          _schedule(
            [item],
            () => remote.upsert(item),
          );
          return SingleRepositoryResult<I, RepositoryState<I, T>>(
            RepositoryState<I, T>.modified(item),
            result.created,
            result.updated,
            result.removed,
          );
        }
        return SingleRepositoryResult<I, RepositoryState<I, T>>.empty(
          RepositoryState<I, T>.local(item),
        );
      },
      task: 'updateAll',
      transaction: true,
      name: '$runtimeType',
    );
  }

  /// Attempt to remove given item from repository.
  ///
  /// Returns a [SingleRepositoryResult].
  Future<SingleRepositoryResult<I, RepositoryState<I, T>>> remove(
    T item,
  ) async {
    return guard(
      () async {
        final result = await local.remove(item);
        if (result.isNotEmpty) {
          _schedule(
            [item],
            () => remote.remove(item),
          );
          return SingleRepositoryResult<I, RepositoryState<I, T>>.removed(
            RepositoryState<I, T>.modified(item),
          );
        }
        return SingleRepositoryResult<I, RepositoryState<I, T>>.empty(
          RepositoryState<I, T>.local(item),
        );
      },
      task: 'updateAll',
      transaction: true,
      name: '$runtimeType',
    );
  }

  List<I> get modified {
    // Check against ids of items with schedules changes
    // that are not currently being executed by any task
    return _scheduled
        .map((task) => task.$1)
        .fold(<I>[], (ids, items) => ids..addAll(items)).toList();
  }

  bool isModified(List<I> ids) {
    final eq = const ListEquality().equals;
    return _scheduled.any(
      (task) => eq(task.$1, ids),
    );
  }

  void _schedule(
    Iterable<T> items,
    Future<RepositoryResult<I, T>> Function() task,
  ) {
    _scheduled.add(
      (items.map(toId).toList(), task),
    );
    unawaited(commit());
  }

  /// Commit all pending changes
  Future<Optional<RepositoryResult<I, T>>> commit() async {
    final done = <_Task<I, T>>[];
    final results = <RepositoryResult<I, T>>[];
    try {
      if (isOnline) {
        // Execute in order!
        final batch = _scheduled.toList();
        for (final (ids, task) in batch) {
          final result = await task();
          if (result.isNotEmpty) {
            // Is completed by local.events
            results.add(result);
          } else {
            // No events fired, complete here
            _complete(ids, true);
          }
          done.add((ids, task));
        }
      }
    } catch (error, stackTrace) {
      final checked = checkDioError(error);
      if (!checked.fatal) {
        // TODO: Implement retry logic
      } else {
        // TODO: Should we just clear schedules changes on error?
        log.severe(
          '_push() failed '
          '(${done.length} of ${_scheduled.length} done)',
          error,
          stackTrace,
        );
      }
    }

    if (results.isEmpty) {
      // NO event will occur, remove now
      _scheduled.removeWhere(
        done.contains,
      );
      return const Optional.empty();
    }

    if (results.length == 1 && results.first is SingleRepositoryResult<I, T>) {
      return results.first.toOptional;
    }

    final created = <T>[];
    final updated = <T>[];
    final removed = <T>[];
    for (final it in results) {
      switch (it) {
        case SingleRepositoryResult<I, T>():
          if (it.created) created.add(it.item);
          if (it.updated) updated.add(it.item);
          if (it.removed) removed.add(it.item);
          break;
        case BulkRepositoryResult<I, T>():
          created.addAll(it.created);
          updated.addAll(it.created);
          removed.addAll(it.created);
          break;
      }
    }
    return Optional.of(
      BulkRepositoryResult<I, T>(
        created,
        updated,
        removed,
      ),
    );
  }

  bool _complete(List<I> ids, bool isRemote) {
    final eq = const ListEquality().equals;
    final found = _scheduled.firstWhereOptional(
      (task) => eq(task.$1, ids),
    );
    if (isRemote && found.isPresent) {
      _scheduled.remove(found.value);
    }
    return found.isPresent && (!isRemote || isModified(ids));
  }

  RepositoryEvent<I, RepositoryState<I, T>> _toEvent(
      RepositoryEvent<I, T> e, bool isRemote) {
    if (e.isSingle) {
      final id = toId(e.item);
      final isModified = e.isNotEmpty && _complete([id], isRemote);
      return RepositoryEvent<I, RepositoryState<I, T>>(
        SingleRepositoryResult<I, RepositoryState<I, T>>(
          RepositoryState<I, T>(
            data: e.item,
            isRemote: isRemote,
            isModified: isModified,
          ),
          e.created.isNotEmpty,
          e.updated.isNotEmpty,
          e.removed.isNotEmpty,
        ),
      );
    }
    final ids = e.all.map(toId).toList();
    final isModified = e.isNotEmpty && _complete(ids, isRemote);
    return RepositoryEvent<I, RepositoryState<I, T>>(
      BulkRepositoryResult<I, RepositoryState<I, T>>(
        _toRepositoryStates(e.created, isRemote, isModified),
        _toRepositoryStates(e.updated, isRemote, isModified),
        _toRepositoryStates(e.removed, isRemote, isModified),
      ),
    );
  }

  List<RepositoryState<I, T>> _toRepositoryStates(
    List<T> items,
    bool isRemote,
    bool isModified,
  ) {
    return items
        .map((e) => RepositoryState<I, T>(
              data: e,
              isRemote: isRemote,
              isModified: isModified,
            ))
        .toList();
  }
}

/// Repository aware of connectivity status. It stores changes in a local
/// repository when offline and commits changes to remote when status changes to online
class BulkConnectionAwareRepository<I, T>
    extends ConnectionAwareRepository<I, T> {
  BulkConnectionAwareRepository({
    required super.checker,
    required BulkWriteRepositoryMixin<I, T> super.local,
    required BulkRemoteRepositoryMixin<I, T> super.remote,
  });

  @override
  BulkWriteRepositoryMixin<I, T> get local =>
      super.local as BulkWriteRepositoryMixin<I, T>;

  @override
  BulkRemoteRepositoryMixin<I, T> get remote =>
      super.remote as BulkRemoteRepositoryMixin<I, T>;

  /// Attempt to update all given items in repository.
  ///
  /// Returns a [BulkRepositoryResult].
  Future<BulkRepositoryResult<I, RepositoryState<I, T>>> updateAll(
      Iterable<T> items) async {
    return guard(
      () async {
        final result = await local.updateAll(items);
        if (result.isNotEmpty) {
          final pending = result.all;
          _schedule(
            pending,
            () => remote.updateAll(pending),
          );
          return BulkRepositoryResult<I, RepositoryState<I, T>>(
            result.created.map(RepositoryState<I, T>.modified).toList(),
            result.updated.map(RepositoryState<I, T>.modified).toList(),
            [],
          );
        }
        return BulkRepositoryResult<I, RepositoryState<I, T>>.empty();
      },
      task: 'updateAll',
      transaction: true,
      name: '$runtimeType',
    );
  }

  /// Attempt to remove all given items from repository.
  ///
  /// Returns a [BulkRepositoryResult].
  Future<BulkRepositoryResult<I, RepositoryState<I, T>>> removeAll(
    Iterable<T> items,
  ) async {
    return guard(
      () async {
        final result = await local.removeAll(items);
        if (result.isNotEmpty) {
          _schedule(
            items,
            () => remote.removeAll(items),
          );
          return BulkRepositoryResult<I, RepositoryState<I, T>>.removed(
            result.removed.map(RepositoryState<I, T>.modified).toList(),
          );
        }
        return BulkRepositoryResult<I, RepositoryState<I, T>>.empty();
      },
      task: 'removeAll',
      transaction: true,
      name: '$runtimeType',
    );
  }
}
