import 'dart:async';

import 'package:optional/optional.dart';
import 'package:smart_dash_datasource/smart_dash_datasource.dart';

abstract class InMemoryRepository<I, T> extends Repository<I, T> {
  InMemoryRepository(super.ref) {
    ref.onDispose(() {
      _controller.close();
    });
  }

  final _items = <I, T>{};
  final _controller = StreamController<RepositoryResult<I, T>>.broadcast();

  @override
  Future<bool> exists(I id) async {
    return _items.containsKey(id);
  }

  @override
  Future<Optional<T>> get(I id) async {
    return Optional.ofNullable(_items[id]);
  }

  @override
  Future<List<T>> getAll([List<I> ids = const []]) async {
    return _items.values.toList();
  }

  @override
  Future<SingleRepositoryResult<I, T>> upsert(T item) async {
    final id = toId(item);
    final old = _items[id];
    _items[id] = item;
    return raise(_toResult(old, item));
  }

  @override
  Future<SingleRepositoryResult<I, T>> remove(T item) async {
    final id = toId(item);
    final old = _items[id];
    if (old == null) {
      return SingleRepositoryResult<I, T>.empty(item);
    }
    return raise(
      SingleRepositoryResult<I, T>.removed(old),
    );
  }

  SingleRepositoryResult<I, T> _toResult(old, item) {
    if (old == null) {
      return SingleRepositoryResult<I, T>.created(item);
    }
    return old == item
        ? SingleRepositoryResult<I, T>.empty(item)
        : SingleRepositoryResult<I, T>.updated(item);
  }
}

mixin BulkInMemoryRepositoryMixin<I, T> on InMemoryRepository<I, T>
    implements BulkWriteRepositoryMixin<I, T> {
  @override
  Future<BulkRepositoryResult<I, T>> updateAll(Iterable<T> items) async {
    final created = <T>[];
    final updated = <T>[];
    for (final it in items) {
      final id = toId(it);
      final old = _items[id];
      if (old == null) {
        created.add(it);
      } else if (old != it) {
        updated.add(it);
      }
      _items[id] = it;
    }
    return raise(BulkRepositoryResult<I, T>(
      created,
      updated,
      [],
    ));
  }

  @override
  Future<BulkRepositoryResult<I, T>> removeAll(Iterable<T> items) async {
    final removed = <T>[];
    for (final it in items) {
      final id = toId(it);
      final old = _items.remove(id);
      if (old != null) {
        removed.add(it);
      }
    }
    return raise(BulkRepositoryResult<I, T>(
      [],
      [],
      removed,
    ));
  }

  @override
  Future<void> clear() async {
    final removed = _items.values.toList();
    _items.clear();
    raise(BulkRepositoryResult<I, T>(
      [],
      [],
      removed,
    ));
  }
}
