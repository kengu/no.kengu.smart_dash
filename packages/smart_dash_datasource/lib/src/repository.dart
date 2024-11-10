import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

abstract class Repository<I, T> {
  I toId(T item);

  String toKey(I id);

  Future<List<T>> seed() async => const [];

  /// Get given item from repository.
  Future<Optional<T>> get(I id);

  /// Get all given items to repository.
  /// Use [keys] to pick only items that matches these.
  Future<List<T>> getAll([List<I> ids = const []]);

  /// Get items that matches [test]
  Future<List<T>> where(bool Function(T element) test) async {
    return (await getAll()).where(test).toList();
  }

  /// Attempt to update given item, add if not exists
  ///
  /// Returns a [SingleRepositoryResult].
  Future<SingleRepositoryResult<I, T>> addOrUpdate(T item) async {
    final result = await updateAll([item]);
    return result.isEmpty
        ? SingleRepositoryResult<I, T>.empty(item)
        : result.first;
  }

  /// Attempt to update all given items in repository.
  ///
  /// Returns a [BulkRepositoryResult].
  Future<BulkRepositoryResult<I, T>> updateAll(Iterable<T> items);

  /// Attempt to remove all given items from repository.
  ///
  /// Returns a [BulkRepositoryResult].
  Future<BulkRepositoryResult<I, T>> removeAll(Iterable<T> items);
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

/// Repository aware of connectivity status. It stores changes in a local
/// repository when offline and commits changes to remote when status changes to online
abstract class ConnectionAwareRepository<I, T> extends Repository<I, T> {
  ConnectionAwareRepository({
    required this.checker,
    required this.local,
    required this.remote,
  });

  final List<I> _updated = [];
  final List<T> _removed = [];

  @protected
  final Connectivity checker;

  @protected
  final Repository<I, T> remote;

  @protected
  final Repository<I, T> local;

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

  /// Get items that matches [test]
  @override
  Future<List<T>> where(bool Function(T element) test) async {
    return (await getAll()).where(test).toList();
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
        await local.updateAll(result);
        return result;
      },
      task: 'getAll',
      transaction: true,
      name: '$runtimeType',
    );
  }

  /// Attempt to update given item, add if not exists
  ///
  /// Returns updated item.
  @override
  Future<SingleRepositoryResult<I, T>> addOrUpdate(T item) async {
    final updated = await updateAll([item]);
    return updated.isEmpty
        ? SingleRepositoryResult<I, T>.empty(item)
        : updated.first;
  }

  /// Attempt to update all given items in repository.
  ///
  /// Returns list of actual added items.
  @override
  Future<BulkRepositoryResult<I, T>> updateAll(Iterable<T> items) {
    return guard(
      () async {
        if (isOffline) {
          _updated.addAll(items.map(toId));
          _removed.removeWhere(((e) => _updated.contains(toId(e))));
          return local.updateAll(items);
        }
        final changed = await _commit();
        final residue = items.where((e) => !changed.contains(toId(e)));
        return remote.updateAll(residue);
      },
      task: 'updateAll',
      transaction: true,
      name: '$runtimeType',
    );
  }

  /// Attempt to remove all given items from repository.
  ///
  /// Returns list of actual removed items.
  @override
  Future<BulkRepositoryResult<I, T>> removeAll(Iterable<T> items) {
    return guard(
      () async {
        if (isOffline) {
          _removed.addAll(items);
          final removedIds = _removed.map(toId);
          _updated.removeWhere(((id) => removedIds.contains(id)));
          return local.removeAll(items);
        }
        final changed = await _commit();
        final residue = items.where((e) => !changed.contains(toId(e)));
        return remote.removeAll(residue);
      },
      task: 'removeAll',
      transaction: true,
      name: '$runtimeType',
    );
  }

  Future<Iterable<I>> _commit() async {
    assert(
      !_updated.any(_removed.contains),
      '_updated and _removed are mutually exclusive',
    );
    if (isOffline) return [];
    final pending = await local.getAll(_updated);
    final updated = await local.updateAll(pending);
    await local.removeAll(_removed);
    _updated.clear();
    _removed.clear();
    return updated.isEmpty ? [] : updated.all.map(toId);
  }
}
