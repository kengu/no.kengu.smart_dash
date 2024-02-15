import 'dart:convert';

import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/feature/presence/domain/presence.dart';
import 'package:smart_dash/util/guard.dart';
import 'package:smart_dash/util/data/json.dart';

part 'presence_repository.g.dart';

class PresenceRepository {
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

  Future<List<Presence>> _load() => guard(
        () async {
          final prefs = await SharedPreferences.getInstance();
          final result = prefs.getStringList(PresenceRepository.key);
          return result
                  ?.map(jsonDecode)
                  .whereType<JsonObject>()
                  .map(Presence.fromJson)
                  // Remove duplicates just in case (
                  .toSet()
                  .toList() ??
              [];
        },
        task: '_load',
        name: '$PresenceRepository',
      );

  /// Attempt to sett all given presences to
  /// repository. Returns list of actual added presences.
  Future<List<Presence>> updateAll(Iterable<Presence> presences) async {
    final current = await _load();
    final unique = presences.toSet();
    final currentIds = current.map((e) => e.token);
    final removedIds =
        unique.where((e) => currentIds.contains(e.token)).map((e) => e.token);
    current.removeWhere(
      (e) => removedIds.contains(e.token),
    );
    final success = await _setAll([...unique, ...current]);
    return [if (success) ...unique];
  }

  /// Attempt to remove all given presences from
  /// repository. Returns list of actual removed presences.
  Future<List<Presence>> removeAll(Iterable<Presence> presences) async {
    final current = await _load();
    final unique = presences.toSet();
    final currentIds = current.map((e) => e.token);
    final removedIds =
        unique.where((e) => currentIds.contains(e.token)).map((e) => e.token);
    current.removeWhere(
      (e) => removedIds.contains(e.token),
    );
    final success = await _setAll(current);
    return [if (success) ...unique];
  }

  Future<bool> _setAll(List<Presence> presences) => guard(
        () async {
          final prefs = await SharedPreferences.getInstance();
          return prefs.setStringList(
            PresenceRepository.key,
            presences.map(jsonEncode).toList(),
          );
        },
        task: '_setAll',
        name: '$PresenceRepository',
      );
}

@Riverpod(keepAlive: true)
PresenceRepository presenceRepository(PresenceRepositoryRef ref) {
  return PresenceRepository();
}
