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
  /// Returns updated item.
  Future<T> addOrUpdate(T item) async {
    final updated = await updateAll([item]);
    return updated.isEmpty ? item : updated.first;
  }

  /// Attempt to update all given items in repository.
  ///
  /// Returns list of actual added items.
  Future<List<T>> updateAll(Iterable<T> items);

  /// Attempt to remove all given items from repository.
  ///
  /// Returns list of actual removed items.
  Future<List<T>> removeAll(Iterable<T> items);
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
  Future<T> addOrUpdate(T item) async {
    final updated = await updateAll([item]);
    return updated.isEmpty ? item : updated.first;
  }

  /// Attempt to update all given items in repository.
  ///
  /// Returns list of actual added items.
  @override
  Future<List<T>> updateAll(Iterable<T> items) {
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
  Future<List<T>> removeAll(Iterable<T> items) {
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
    _updated.clear();
    await local.removeAll(_removed);
    _removed.clear();
    return updated.map(toId);
  }
}
