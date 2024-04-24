import 'package:optional/optional.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

abstract class SharedPreferencesRepository<I, T> extends Repository<I, T> {
  SharedPreferencesRepository(this.prefix);

  static SharedPreferences? _db;

  final String prefix;

  String toValue(T item);

  Future<T?> whenNotFound(I id, SharedPreferences db) async => null;

  @override
  Future<List<T>> seed() async => const [];

  T? map(String key, String? data);

  @override
  Future<Optional<T>> get(I id) => guard(
        () async {
          final db = await _open();
          final key = toKey(id);
          String? value = db.getString(key);
          if (value == null) {
            return Optional.ofNullable(
              await whenNotFound(id, db),
            );
          }

          return Optional.ofNullable(
            map(key, value),
          );
        },
        task: 'get',
        name: '$runtimeType',
      );

  Future<List<String>> getKeys() async {
    return guard(
      () async {
        final db = await _open();
        return db.getKeys().where((e) => e.startsWith(prefix)).toList();
      },
      task: 'getKeys',
      name: '$runtimeType',
    );
  }

  /// Get all items.
  ///
  /// Use [keys] to pick only items that matches these.
  @override
  Future<List<T>> getAll([List<I> ids = const []]) async {
    final keys = ids.map(toKey);
    final map = await _loadAll(
      [if (keys.isEmpty) ...await getKeys() else ...keys],
    );
    return map.values.whereType<T>().toList();
  }

  /// Get items that matches [test]
  @override
  Future<List<T>> where(bool Function(T element) test) async {
    final map = await _loadAll();
    return map.values.whereType<T>().where(test).toList();
  }

  /// Attempt to set all given items to repository.
  ///
  /// Returns list of actual updated items.
  @override
  Future<List<T>> updateAll(Iterable<T> items) async {
    final ids = items.map(toId).toList();
    final current = await getAll(ids);
    final changed = items.where((e) => !current.contains(e)).toList();
    if (changed.isEmpty) return [];
    final success = await _putAll(
      ids.map(toKey),
      changed.map(toValue),
    );
    return [if (success) ...changed];
  }

  /// Attempt to remove all given items from repository.
  ///
  /// Returns list of actual removed items.
  @override
  Future<List<T>> removeAll(Iterable<T> items) async {
    final ids = items.map(toId);
    final keys = ids.map(toKey);
    final current = await _loadAll(keys);
    final success = await _removeAll(keys);
    return [if (success) ...current.values.whereType<T>()];
  }

  Future<SharedPreferences> _open() => guard(
        () async {
          if (_db != null) return _db!;
          return _db = await SharedPreferences.getInstance();
        },
        task: '_open',
        name: '$runtimeType',
      );

  Future<Map<String, T?>> _loadAll([Iterable<String> keys = const []]) => guard(
        () async {
          final db = await _open();
          final result = db.getKeys();
          if (keys.isEmpty && result.isEmpty) {
            final items = await seed();
            await _putAll(keys, items.map(toValue));
            return Map.fromIterables(keys, items);
          }
          final items = keys.map((e) => map(e, db.getString(e)));
          return Map.fromIterables(keys, items);
        },
        task: '_loadAll',
        name: '$runtimeType',
      );

  Future<bool> _removeAll(Iterable<String> keys) => guard(
        () async {
          final db = await _open();
          await Future.wait(
            keys.map((e) => db.remove(e)),
          );
          return true;
        },
        task: '_removeAll',
        name: '$runtimeType',
      );

  Future<bool> _putAll(Iterable<String> keys, Iterable<String> values) => guard(
        () async {
          final db = await _open();
          final map = Map.fromIterables(keys, values);
          final requests = <Future<bool>>[];
          for (final entry in map.entries) {
            final request = db.setString(
              entry.key,
              entry.value,
            );
            requests.add(request);
          }
          await Future.wait(requests);
          return true;
        },
        task: '_putAll',
        name: '$runtimeType',
      );

  Future<void> clear() async {
    return guard(
      () async {
        await _removeAll(await getKeys());
      },
      task: 'clear',
      name: '$runtimeType',
    );
  }
}
