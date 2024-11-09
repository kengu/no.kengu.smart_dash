import 'package:optional/optional.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

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
}

abstract class HiveRepository<I, T> extends Repository<I, T> {
  HiveRepository({
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

  /// Get given item from repository.
  @override
  Future<Optional<T>> get(I id) => guard(
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

  /// Attempt to sett all given items to repository.
  ///
  /// Returns list of actual added items.
  @override
  Future<List<T>> updateAll(Iterable<T> items) async {
    final unique = items.toSet();
    final success = await _putAll([...unique]);
    return [if (success) ...unique];
  }

  /// Attempt to remove all given items from repository.
  ///
  /// Returns list of actual removed items.
  @override
  Future<List<T>> removeAll(Iterable<T> items) async {
    final ids = items.map(toId).map(toKey).toSet();
    final current = await _loadAll(ids.toList());
    final currentIds = current.map(toId).map(toKey).toList();
    final unique = items..toSet().where((e) => currentIds.contains(toId(e)));
    final success = await _removeAll(currentIds);
    return [if (success) ...unique];
  }

  Future<CollectionBox<T>> _open() => guard(
        () async {
          if (_db != null) return _db!;
          final db = await BoxCollection.open(
            // TODO: Replace workaround for missing collection name separator leading to wrong collection path
            key,
            {box},
            key: await _cipher?.get(key),
          );
          return db.openBox<T>(box);
        },
        task: '_open',
        name: '$runtimeType',
      );

  Future<List<T>> _loadAll([List<String> keys = const []]) => guard(
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

  Future<bool> _removeAll(List<String> ids) => guard(
        () async {
          final box = await _open();
          await box.deleteAll(ids);
          return true;
        },
        task: '_removeAll',
        name: '$runtimeType',
      );

  Future<bool> _putAll(List<T> items) => guard(
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

  Future<void> clear() async {
    return guard(
      () => Hive.deleteBoxFromDisk(
        '${key}_$box',
      ),
      task: 'clear',
      name: '$runtimeType',
    );
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
