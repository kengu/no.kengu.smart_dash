import 'dart:async';

import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:optional/optional.dart';
import 'package:riverpod/riverpod.dart';

/// Base class for implementing [Repository]
/// for items of type [T] with id of type [I]
abstract class Repository<I, T> {
  Repository(this.ref) {
    ref.onDispose(() {
      _controller.close();
    });
  }
  final Ref ref;

  final StreamController<RepositoryEvent<I, T>> _controller =
      StreamController.broadcast();

  /// Get stream of [RepositoryEvent]s
  Stream<RepositoryEvent<I, T>> get events => _controller.stream;

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
  /// return upsert(item);
  /// ```
  Future<SingleRepositoryResult<I, T>> add(T item) async {
    final old = await get(toId(item));
    if (old.isPresent) {
      return SingleRepositoryResult<I, T>.empty(old.value);
    }
    return upsert(item);
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
  Future<SingleRepositoryResult<I, T>> upsert(T item);

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
    return upsert(item);
  }

  /// Attempt to remove given item from repository.
  ///
  /// Returns a [SingleRepositoryResult].
  Future<SingleRepositoryResult<I, T>> remove(T item);

  @protected
  R raise<R extends RepositoryResult<I, T>>(R result) {
    if (result.isNotEmpty) {
      _controller.add(
        RepositoryEvent<I, T>(result),
      );
    }
    return result;
  }
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

sealed class RepositoryResult<I, T> {
  bool get isEmpty;
  bool get isNotEmpty;
}

final class SingleRepositoryResult<I, T> extends RepositoryResult<I, T> {
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
      SingleRepositoryResult<I, T>(item, false, true, false);

  factory SingleRepositoryResult.removed(T item) =>
      SingleRepositoryResult<I, T>(item, false, false, true);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SingleRepositoryResult<I, T> &&
          runtimeType == other.runtimeType &&
          item == other.item &&
          updated == other.updated &&
          created == other.created &&
          removed == other.removed;

  @override
  int get hashCode =>
      item.hashCode ^ updated.hashCode ^ created.hashCode ^ removed.hashCode;

  @override
  String toString() {
    return '${SingleRepositoryResult<I, T>}{'
        'item: $item, '
        'created: $created, '
        'updated: $updated, '
        'removed: $removed}';
  }
}

final class BulkRepositoryResult<I, T> extends RepositoryResult<I, T> {
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
  bool get isEmpty => !isNotEmpty;

  @override
  bool get isNotEmpty =>
      created.isNotEmpty || updated.isNotEmpty || removed.isNotEmpty;

  List<T> get all => [...created, ...updated, ...removed];

  factory BulkRepositoryResult.empty() =>
      BulkRepositoryResult<I, T>([], [], []);

  factory BulkRepositoryResult.created(Iterable<T> items) =>
      BulkRepositoryResult<I, T>(items.toList(), [], []);

  factory BulkRepositoryResult.updated(Iterable<T> items) =>
      BulkRepositoryResult<I, T>([], items.toList(), []);

  factory BulkRepositoryResult.removed(Iterable<T> items) =>
      BulkRepositoryResult<I, T>([], [], items.toList());

  @override
  bool operator ==(Object other) {
    Function eq = const ListEquality().equals;
    return identical(this, other) ||
        other is BulkRepositoryResult<I, T> &&
            runtimeType == other.runtimeType &&
            eq(updated, other.updated) &&
            eq(created, other.created) &&
            eq(removed, other.removed);
  }

  @override
  int get hashCode => updated.hashCode ^ created.hashCode ^ removed.hashCode;

  @override
  String toString() {
    return '${BulkRepositoryResult<I, T>}{'
        'created: $created, '
        'updated: $updated, '
        'removed: $removed';
  }
}

class RepositoryEvent<I, T> {
  RepositoryEvent(this.result);
  final RepositoryResult<I, T> result;

  bool get isSingle => !isBulk;
  bool get isEmpty => result.isEmpty;
  bool get isNotEmpty => result.isNotEmpty;
  bool get isBulk => result is BulkRepositoryResult<I, T>;

  T get item => isBulk
      ? (result as BulkRepositoryResult<I, T>).first.item
      : (result as SingleRepositoryResult<I, T>).item;

  List<T> get all => [...created, ...updated, ...removed];

  List<T> get created => isBulk
      ? (result as BulkRepositoryResult<I, T>).created
      : (result as SingleRepositoryResult<I, T>).created
          ? [(result as SingleRepositoryResult<I, T>).item]
          : [];

  List<T> get updated => isBulk
      ? (result as BulkRepositoryResult<I, T>).updated
      : (result as SingleRepositoryResult<I, T>).updated
          ? [(result as SingleRepositoryResult<I, T>).item]
          : [];

  List<T> get removed => isBulk
      ? (result as BulkRepositoryResult<I, T>).removed
      : (result as SingleRepositoryResult<I, T>).removed
          ? [(result as SingleRepositoryResult<I, T>).item]
          : [];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RepositoryEvent &&
          runtimeType == other.runtimeType &&
          result == other.result;

  @override
  int get hashCode => result.hashCode;

  @override
  String toString() {
    return '${RepositoryEvent<I, T>}{result: $result}';
  }
}
