import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:logging/logging.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/util/guard.dart';
import 'package:universal_io/io.dart';

enum HiveTypeId {
  // ========== IMPORTANT ==========
  // Hive adapter type ids is order-sensitive
  // Only add new enums to end of list
  // Never reorder or insert above last enum
  device,
  presence,
  block,
  notification,
  snapshot,
}

abstract class HiveRepository<I, T> {
  HiveRepository({
    required this.key,
    required this.box,
    required TypedAdapter<T> adapter,
  }) {
    if (!Hive.isAdapterRegistered(adapter.typeId)) {
      Hive.registerAdapter<T>(adapter);
    }
  }

  final String key;
  final String box;

  CollectionBox<T>? _db;

  I toId(T item);

  String toKey(I id);

  Future<List<T>> seed() async => const [];

  /// Get given item from repository.
  Future<Optional<T>> get(I id) => guard(
        () async {
          final box = await _open();
          return Optional.ofNullable(
            await box.get(toKey(id)),
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
  Future<List<T>> getAll([List<I> ids = const []]) async {
    return await _loadAll(ids.map(toKey).toList());
  }

  Future<List<T>> where(bool Function(T element) test) async {
    return (await _loadAll()).where(test).toList();
  }

  /// Attempt to sett all given items to repository.
  ///
  /// Returns list of actual added items.
  Future<List<T>> updateAll(Iterable<T> items) async {
    final unique = items.toSet();
    final success = await _putAll([...unique]);
    return [if (success) ...unique];
  }

  /// Attempt to remove all given items from repository.
  ///
  /// Returns list of actual removed items.
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
          final db = await openCollection(key, {box});
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

Future<BoxCollection> openCollection(String key, Set<String> boxNames) async {
  return BoxCollection.open(
    // TODO: Replace workaround for missing collection name separator leading to wrong collection path
    key,
    boxNames,
    key: Platform.isAndroid ? await getHiveCipher(key) : null,
  );
}

Future<HiveCipher> getHiveCipher(String key) async {
  final storage = _get();
  // if key not exists return null
  final encryptionKeyString = await storage.read(key: key);
  if (encryptionKeyString == null) {
    final data = Hive.generateSecureKey();
    await storage.write(
      key: key,
      value: base64UrlEncode(data),
    );
    Logger('$Hive').info('Created Cipher for Hive key $key');
  }
  final data = await storage.read(key: key);
  if (data == null) {
    throw UnsupportedError('Unable to read from secure storage');
  }
  final encryptionKeyUint8List = base64Url.decode(data);
  return HiveAesCipher(encryptionKeyUint8List);
}

FlutterSecureStorage _get() {
  if (Platform.isMacOS) {
    return const FlutterSecureStorage(
        mOptions: MacOsOptions(
      accessibility: KeychainAccessibility.first_unlock,
    ));
  }
  return const FlutterSecureStorage();
}
