import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:optional/optional.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/feature/presence/domain/presence.dart';
import 'package:smart_dash/util/guard.dart';
import 'package:smart_dash/util/security.dart';

part 'presence_repository.g.dart';

const _typeId = 2;

class PresenceRepository {
  PresenceRepository() {
    if (!Hive.isAdapterRegistered(_typeId)) {
      Hive.registerAdapter(PresenceAdapter());
    }
  }

  static const key = 'presences';

  Future<List<Presence>> getAll() async {
    return await _load();
  }

  Future<Optional<Presence>> get(Token token) async {
    final presences = await _load();
    return presences.isEmpty
        ? const Optional.empty()
        : presences.firstWhereOptional(
            (e) => e.token == token,
          );
  }

  Future<Optional<Presence>> getOrAdd(Token token) async {
    final presence = await get(token);
    if (!presence.isPresent) {
      final updated = await updateAll(
        [Presence.empty(token)],
      );
      return updated.firstOptional;
    }
    return presence;
  }

  /// Attempt to sett all given presences to
  /// repository. Returns list of actual added presences.
  Future<List<Presence>> updateAll(Iterable<Presence> presences) async {
    final unique = presences.toSet();
    final success = await _putAll([...unique]);
    return [if (success) ...unique];
  }

  /// Attempt to remove all given presences from
  /// repository. Returns list of actual removed presences.
  Future<List<Presence>> removeAll(Iterable<Presence> presences) async {
    final current = await _load();
    final currentIds = current.map((e) => e.id);
    final unique = presences..toSet().where((e) => currentIds.contains(e.id));
    final success = await _removeAll(unique);
    return [if (success) ...unique];
  }

  Future<void> clear() async {
    return guard(
      () => Hive.deleteBoxFromDisk(
        'presences_registered',
      ),
      task: 'clear',
      name: '$PresenceRepository',
    );
  }

  Future<CollectionBox<T>> _open<T>(String name) async {
    final directory = await getApplicationDocumentsDirectory();
    final db = await BoxCollection.open(
      key,
      {'registered'},
      key: await getHiveCipher(key),
      path: directory.path,
    );
    return db.openBox<T>(name);
  }

  Future<List<Presence>> _load() => guard(
        () async {
          final box = await _open<Presence>('registered');
          final result = await box.getAll(await box.getAllKeys());
          return result.whereType<Presence>().toList();
        },
        task: '_load',
        name: '$PresenceRepository',
      );

  Future<bool> _removeAll(Iterable<Presence> presences) => guard(
        () async {
          final box = await _open<Presence>('registered');
          final ids = presences.map((e) => e.id).toList();
          await box.deleteAll(ids);
          return true;
        },
        task: '_removeAll',
        name: '$PresenceRepository',
      );

  Future<bool> _putAll(List<Presence> presences) => guard(
        () async {
          final box = await _open<Presence>('registered');
          for (final presence in presences) {
            await box.put(
              presence.id,
              presence,
            );
          }
          return true;
        },
        task: '_putAll',
        name: '$PresenceRepository',
      );
}

@Riverpod(keepAlive: true)
PresenceRepository presenceRepository(PresenceRepositoryRef ref) {
  return PresenceRepository();
}

class PresenceAdapter extends TypeAdapter<Presence> {
  @override
  final typeId = _typeId;

  @override
  Presence read(BinaryReader reader) {
    final json = jsonDecode(
      reader.read(),
    );
    try {
      return Presence.fromJson(json);
    } catch (e) {
      // Fix schema mutation
      json['token']['unit'] = TokenUnit.value.name;
      json['token']['capability'] = DeviceCapability.value.name;
      return Presence.fromJson(json);
    }
  }

  @override
  void write(BinaryWriter writer, Presence obj) {
    writer.write(jsonEncode(
      obj.toJson(),
    ));
  }
}
