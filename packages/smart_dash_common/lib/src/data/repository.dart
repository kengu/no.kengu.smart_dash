import 'package:optional/optional.dart';

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
  Future<List<T>> where(bool Function(T element) test);

  /// Attempt to update given item, add if not exists
  ///
  /// Returns updated item.
  Future<T> addOrUpdate(T item) async {
    final updated = await updateAll([item]);
    return updated.isEmpty ? item : updated.first;
  }

  /// Attempt to sett all given items to repository.
  ///
  /// Returns list of actual added items.
  Future<List<T>> updateAll(Iterable<T> items);

  /// Attempt to remove all given items from repository.
  ///
  /// Returns list of actual removed items.
  Future<List<T>> removeAll(Iterable<T> items);
}
