import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

abstract class Repository<I, T> {
  /// Translate [item] to id of type [I]
  I toId(T item);

  /// Translate [id] to key of type [String]
  String toKey(I id);

  /// Fill repository with predefined items.
  /// Default implementation does nothing.
  Future<List<T>> seed() async => const [];

  /// Check if given item exists in repository.
  Future<bool> exists(I id);

  /// Get given item from repository.
  Future<Optional<T>> get(I id);

  /// Get all given items to repository.
  /// Use [ids] to pick only items that matches these.
  Future<List<T>> getAll([List<I> ids = const []]);

  /// Get items that matches [test]
  Future<List<T>> where(bool Function(T element) test) async {
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
  /// return update(item);
  /// ```
  Future<SingleRepositoryResult<I, T>> add(T item) async {
    final old = await get(toId(item));
    if (old.isPresent) {
      return SingleRepositoryResult<I, T>.empty(old.value);
    }
    return addOrUpdate(item);
  }

  /// Attempt to update given item in repository.
  ///
  /// Returns [item] with
  /// [SingleRepositoryResult.updated] if [exists], or
  /// [SingleRepositoryResult.empty] otherwise.
  ///
  /// Same as
  /// ```dart
  /// if (!await exists(toId(item)) {
  ///   return SingleRepositoryResult<I, T>.empty(item);
  /// }
  /// return addOrUpdate(item);
  /// ```
  Future<SingleRepositoryResult<I, T>> update(T item) async {
    if (!await exists(toId(item))) {
      return SingleRepositoryResult<I, T>.empty(item);
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
  Future<SingleRepositoryResult<I, T>> addOrUpdate(T item);

  /// Attempt to remove given item from repository.
  ///
  /// Returns a [SingleRepositoryResult].
  Future<SingleRepositoryResult<I, T>> remove(T item);
}

mixin BulkWriteRepositoryMixin<I, T> on Repository<I, T> {
  /// Attempt to update all given items in repository.
  ///
  /// Returns a [BulkRepositoryResult].
  Future<BulkRepositoryResult<I, T>> updateAll(Iterable<T> items);

  /// Attempt to remove all given items from repository.
  ///
  /// Returns a [BulkRepositoryResult].
  Future<BulkRepositoryResult<I, T>> removeAll(Iterable<T> items);

  /// Clear all items from repository.
  Future<void> clear();
}

/// Repository aware of connectivity status. It stores changes in a local
/// repository when offline and commits changes to remote when status changes to online
abstract class BulkConnectionAwareRepository<I, T>
    extends ConnectionAwareRepository<I, T>
    with BulkWriteRepositoryMixin<I, T> {
  BulkConnectionAwareRepository({
    required super.checker,
    required BulkWriteRepositoryMixin<I, T> super.local,
    required BulkWriteRepositoryMixin<I, T> super.remote,
  });

  @override
  BulkWriteRepositoryMixin<I, T> get local =>
      super.local as BulkWriteRepositoryMixin<I, T>;

  @override
  BulkWriteRepositoryMixin<I, T> get remote =>
      super.remote as BulkWriteRepositoryMixin<I, T>;

  @override
  Future<BulkRepositoryResult<I, T>> updateAll(Iterable<T> items) async {
    return guard(
      () async {
        final result = await local.updateAll(items);
        if (result.isNotEmpty) {
          await _push(
            () => remote.updateAll(items),
          );
        }
        return result;
      },
      task: 'updateAll',
      transaction: true,
      name: '$runtimeType',
    );
  }

  @override
  Future<BulkRepositoryResult<I, T>> removeAll(Iterable<T> items) async {
    return guard(
      () async {
        final result = await local.removeAll(items);
        if (result.isNotEmpty) {
          await _push(
            () => remote.removeAll(items),
          );
        }
        return result;
      },
      task: 'removeAll',
      transaction: true,
      name: '$runtimeType',
    );
  }
}

/// Repository aware of connectivity status. It stores changes in a local
/// repository when offline and commits changes to remote when status changes to online
abstract class ConnectionAwareRepository<I, T> extends Repository<I, T> {
  ConnectionAwareRepository({
    required this.checker,
    required this.local,
    required this.remote,
  });

  final Logger _logger = Logger('$ConnectionAwareRepository');
  final List<Future<RepositoryResult<I, T>> Function()> _tasks = [];

  @protected
  final Connectivity checker;

  @protected
  final Repository<I, T> local;

  @protected
  final Repository<I, T> remote;

  bool get isOnline => checker.isOnline;

  bool get isOffline => checker.isOffline;

  ConnectivityStatus get status => checker.status;

  @override
  I toId(T item) => local.toId(item);

  @override
  String toKey(I id) => local.toKey(id);

  @override
  Future<List<T>> seed() {
    throw UnimplementedError('Seed is not implemented');
  }

  @override
  Future<bool> exists(I id) async {
    if (await local.exists(id)) return true;
    if (isOnline) return remote.exists(id);
    return false;
  }

  /// Get given item from repository.
  @override
  Future<Optional<T>> get(I id) async {
    return guard(
      () async {
        if (isOffline) {
          return local.get(id);
        }
        final result = await remote.get(id);
        if (result.isPresent) {
          await local.addOrUpdate(result.value);
        }
        return result;
      },
      task: 'get',
      transaction: true,
      name: '$runtimeType',
    );
  }

  /// Get all given items to repository.
  /// Use [keys] to pick only items that matches these.
  @override
  Future<List<T>> getAll([List<I> ids = const []]) async {
    return guard(
      () async {
        if (isOffline) {
          return local.getAll(ids);
        }
        final result = await remote.getAll(ids);
        if (local is BulkWriteRepositoryMixin<I, T>) {
          final bulk = local as BulkWriteRepositoryMixin<I, T>;
          if (result.isNotEmpty) {
            if (ids.isEmpty) {
              final items = await bulk.getAll();
              bulk.removeAll(items);
            } else {
              bulk.updateAll(result);
            }
          }
        } else {
          for (final item in result) {
            if (result.isNotEmpty) {
              local.addOrUpdate(item);
            } else {
              local.remove(item);
            }
          }
        }

        return result;
      },
      task: 'getAll',
      transaction: true,
      name: '$runtimeType',
    );
  }

  @override
  Future<SingleRepositoryResult<I, T>> addOrUpdate(T item) async {
    return guard(
      () async {
        final result = await local.addOrUpdate(item);
        if (result.isNotEmpty) {
          await _push(
            () => remote.addOrUpdate(item),
          );
        }
        return result;
      },
      task: 'updateAll',
      transaction: true,
      name: '$runtimeType',
    );
  }

  @override
  Future<SingleRepositoryResult<I, T>> remove(T item) async {
    return guard(
      () async {
        final result = await local.remove(item);
        if (result.isNotEmpty) {
          await _push(
            () => remote.remove(item),
          );
        }
        return result;
      },
      task: 'updateAll',
      transaction: true,
      name: '$runtimeType',
    );
  }

  Future<void> _push(Future<RepositoryResult<I, T>> Function() task) async {
    final done = <Future<RepositoryResult<I, T>> Function()>[];
    try {
      _tasks.add(task);
      if (isOnline) {
        // Execute in order!
        for (final task in _tasks) {
          await task();
          done.add(task);
        }
      }
    } catch (error, stackTrace) {
      if (!check_client_error(error)) {
        _logger.severe(
          '$ConnectionAwareRepository::_push() failed '
          '(${done.length} of ${_tasks.length} done)',
          error,
          stackTrace,
        );
      }
      _tasks.removeWhere(done.contains);
    }
  }
}

abstract class RepositoryResult<I, T> {
  bool get isEmpty;
  bool get isNotEmpty;
}

class SingleRepositoryResult<I, T> extends RepositoryResult<I, T> {
  SingleRepositoryResult(
    this.item,
    this.created,
    this.updated,
    this.removed,
  );

  final T item;
  final bool updated;
  final bool created;
  final bool removed;

  @override
  bool get isEmpty => !isNotEmpty;

  @override
  bool get isNotEmpty => created || updated || removed;

  factory SingleRepositoryResult.empty(T item) =>
      SingleRepositoryResult<I, T>(item, false, false, false);

  factory SingleRepositoryResult.created(T item) =>
      SingleRepositoryResult<I, T>(item, true, false, false);

  factory SingleRepositoryResult.updated(T item) =>
      SingleRepositoryResult<I, T>(item, true, false, false);

  factory SingleRepositoryResult.removed(T item) =>
      SingleRepositoryResult<I, T>(item, true, false, false);
}

class BulkRepositoryResult<I, T> extends RepositoryResult<I, T> {
  BulkRepositoryResult(
    this.created,
    this.updated,
    this.removed,
  );

  final List<T> updated;
  final List<T> created;
  final List<T> removed;

  SingleRepositoryResult<I, T> get first {
    return _toSingle(all.first);
  }

  SingleRepositoryResult<I, T> get last {
    return _toSingle(all.last);
  }

  SingleRepositoryResult<I, T> _toSingle(T item) {
    return SingleRepositoryResult<I, T>(
      item,
      created.contains(item),
      updated.contains(item),
      removed.contains(item),
    );
  }

  @override
  bool get isNotEmpty => !isEmpty;

  @override
  bool get isEmpty => created.isEmpty || updated.isEmpty || removed.isEmpty;

  List<T> get all => [...created, ...updated, ...removed];

  factory BulkRepositoryResult.empty() =>
      BulkRepositoryResult<I, T>([], [], []);

  factory BulkRepositoryResult.created(Iterable<T> items) =>
      BulkRepositoryResult<I, T>(items.toList(), [], []);

  factory BulkRepositoryResult.updated(Iterable<T> items) =>
      BulkRepositoryResult<I, T>([], items.toList(), []);

  factory BulkRepositoryResult.removed(Iterable<T> items) =>
      BulkRepositoryResult<I, T>([], [], items.toList());
}
