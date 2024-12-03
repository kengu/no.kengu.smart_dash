import 'package:optional/optional.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

import 'repository.dart';

enum HiveTypeId {
  // ========== IMPORTANT ==========
  // Hive adapter type ids is order-sensitive
  // 1. ONLY add new enums to end of list
  // 2. NEVER reorder or insert above last enum
  // ===============================

  // TODO: Find a better way to ensure unique Hive type ids with less coupling
  device,
  presence,
  block,
  notification,
  account,
  networkDevice,
  setting,
  integration,
}

abstract class HiveRepository<I, T> extends Repository<I, T> {
  HiveRepository(
    super.ref, {
    required this.key,
    required this.box,
    required TypedAdapter<T> adapter,
    HiveCipherStorage? cipher,
  }) : _cipher = cipher {
    if (!Hive.isAdapterRegistered(adapter.typeId)) {
      Hive.registerAdapter<T>(adapter);
    }
  }

  final String key;
  final String box;
  final HiveCipherStorage? _cipher;

  CollectionBox<T>? _db;

  @override
  Future<bool> exists(I id) {
    return guard(
      () async {
        final box = await _open();
        final key = toKey(id);
        final value = await box.get(key);
        return Optional.ofNullable(
          value,
        ).isPresent;
      },
      task: 'get',
      name: '$runtimeType',
    );
  }

  /// Get given item from repository.
  @override
  Future<Optional<T>> get(I id) {
    return guard(
      () async {
        final box = await _open();
        final key = toKey(id);
        final value = await box.get(key);
        return Optional.ofNullable(
          value,
        );
      },
      task: 'get',
      name: '$runtimeType',
    );
  }

  Future<List<String>> getKeys() async {
    return guard(
      () async {
        final box = await _open();
        return box.getAllKeys();
      },
      task: 'getKeys',
      name: '$runtimeType',
    );
  }

  /// Get all given items to repository.
  @override
  Future<List<T>> getAll([List<I> ids = const []]) async {
    return await _loadAll(ids.map(toKey).toList());
  }

  @override
  Future<List<T>> where(bool Function(T element) test) async {
    return (await _loadAll()).where(test).toList();
  }

  @override
  Future<SingleRepositoryResult<I, T>> addOrUpdate(T item) {
    return guard(
      () async {
        final box = await _open();
        final key = toKey(toId(item));
        final exists = Optional.ofNullable(
          await box.get(key),
        );
        await box.put(toKey(toId(item)), item);
        return raise(exists.isPresent
            ? SingleRepositoryResult<I, T>.updated(item)
            : SingleRepositoryResult<I, T>.created(item));
      },
      task: '_put',
      name: '$runtimeType',
    );
  }

  @override
  Future<SingleRepositoryResult<I, T>> remove(T item) {
    return guard(
      () async {
        final box = await _open();
        await box.delete(toKey(toId(item)));
        return raise(SingleRepositoryResult<I, T>.removed(item));
      },
      task: 'remove',
      name: '$runtimeType',
    );
  }

  Future<CollectionBox<T>> _open() {
    return guard(
      () async {
        if (_db != null) return _db!;
        final db = await BoxCollection.open(
          // TODO: Replace workaround for missing collection
          //  name separator leading to wrong collection path
          key,
          {box},
          key: await _cipher?.get(key),
        );
        return db.openBox<T>(box);
      },
      task: '_open',
      name: '$runtimeType',
    );
  }

  Future<List<T>> _loadAll([List<String> keys = const []]) {
    return guard(
      () async {
        final box = await _open();
        final result = await box.getAll(
          keys.isEmpty ? await box.getAllKeys() : keys,
        );
        if (keys.isEmpty && result.isEmpty) {
          final items = await seed();
          await _putAll(items);
          return items;
        }
        return result.whereType<T>().toList();
      },
      task: '_loadAll',
      name: '$runtimeType',
    );
  }

  Future<bool> _putAll(List<T> items) {
    return guard(
      () async {
        final box = await _open();
        for (final item in items) {
          await box.put(toKey(toId(item)), item);
        }
        return true;
      },
      task: '_putAll',
      name: '$runtimeType',
    );
  }
}

abstract class BulkHiveRepository<I, T> extends HiveRepository<I, T>
    with BulkWriteRepositoryMixin<I, T> {
  BulkHiveRepository(
    super.ref, {
    required super.key,
    required super.box,
    required super.adapter,
    super.cipher,
  });

  /// Attempt to sett all given items to repository.
  ///
  /// Returns list of actual updated items.
  @override
  Future<BulkRepositoryResult<I, T>> updateAll(Iterable<T> items) async {
    final unique = items.toSet();
    if (unique.isEmpty) {
      return BulkRepositoryResult.empty();
    }
    final uniqueIds = unique.map(toId).map(toKey).toList();
    final current = await _loadAll(uniqueIds);
    final success = await _putAll([...unique]);

    if (!success) {
      return BulkRepositoryResult<I, T>.empty();
    }

    final existingIds = current.map((e) => toKey(toId(e))).toList();

    final created = unique.where(
      (e) => !existingIds.contains(toKey(toId(e))),
    );
    final updated = unique.where(
      (e) => existingIds.contains(toKey(toId(e))),
    );

    return raise(BulkRepositoryResult<I, T>(
      created.toList(),
      updated.toList(),
      [],
    ));
  }

  /// Attempt to remove all given items from repository.
  ///
  /// Returns list of actual removed items.
  @override
  Future<BulkRepositoryResult<I, T>> removeAll(Iterable<T> items) async {
    final ids = items.map(toId).map(toKey).toSet();
    final current = await _loadAll(ids.toList());
    final currentIds = current.map(toId).map(toKey).toList();
    final unique = items..toSet().where((e) => currentIds.contains(toId(e)));
    final success = await _removeAll(currentIds);
    return raise(BulkRepositoryResult<I, T>.removed(
      [if (success) ...unique],
    ));
  }

  Future<bool> _removeAll(List<String> ids) => guard(
        () async {
          final box = await _open();
          await box.deleteAll(ids);
          return true;
        },
        task: '_removeAll',
        name: '$runtimeType',
      );

  @override
  Future<void> clear() async {
    final items = await getAll();
    await guard(
      () => Hive.deleteBoxFromDisk(
        '${key}_$box',
      ),
      task: 'clear',
      name: '$runtimeType',
    );
    raise(BulkRepositoryResult<I, T>([], [], items));
  }
}

abstract class TypedAdapter<T> extends TypeAdapter<T> {
  TypedAdapter(
    HiveTypeId type,
    // WORKAROUND: Seems like type ids must be 1-based
  ) : typeId = type.index + 1;

  @override
  final int typeId;
}

abstract class HiveCipherStorage {
  Future<HiveCipher?> get(String key);
}
