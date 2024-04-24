import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_dash/feature/setting/domain/setting.dart';
import 'package:smart_dash/util/guard.dart';
import 'package:smart_dash/util/type.dart';

part 'setting_repository.g.dart';

typedef SettingMap = Map<SettingType, Setting>;

@Riverpod(keepAlive: true)
class SettingRepository extends _$SettingRepository {
  static const String key = 'settings';
  static List<Setting> get defaults =>
      SettingType.values.map(Setting.of).toList();

  @override
  SettingMap build() => toMap(defaults);

  Optional<Setting> get(SettingType type) => Optional.ofNullable(state[type]);

  T getOrDefault<T>(SettingType type, T defaultValue) => state.containsKey(type)
      ? switch (typeOf<T>()) {
          const (int) => get(type).value.toInt() as T,
          const (bool) => get(type).value.toBool() as T,
          const (double) => get(type).value.toDouble() as T,
          const (String) => get(type).value.toString() as T,
          _ => defaultValue
        }
      : defaultValue;

  Optional<Setting> set(SettingType type, Setting setting) {
    final current = state[type];
    final next = Map.of(state);
    next[type] = setting;
    state = next;
    return Optional.ofNullable(current);
  }

  Future<Optional<SettingMap>> load() async {
    final settings = await _load();
    state = toMap(defaults..addAll((settings)));
    return Optional.of(state);
  }

  Future<List<Setting>> _load() => guard(() async {
        final prefs = await SharedPreferences.getInstance();
        final result = prefs.getStringList(SettingRepository.key);
        return result == null
            ? defaults
            : result
                .map(jsonDecode)
                .whereType<Map<String, Object?>>()
                .map(Setting.fromJson)
                .toList();
      });

  Future<bool> save([Iterable<Setting>? settings]) {
    state = toMap(settings);
    return _setAll();
  }

  Future<bool> _setAll() => guard(
        () async {
          final prefs = await SharedPreferences.getInstance();
          return prefs.setStringList(
            SettingRepository.key,
            state.values.map(jsonEncode).toList(),
          );
        },
      );

  @override
  bool updateShouldNotify(SettingMap previous, SettingMap next) {
    return !mapEquals(previous, next);
  }

  void dispose() {}

  static SettingMap toMap(Iterable<Setting>? settings) {
    return {for (final e in settings ?? <Setting>[]) SettingType.of(e.name): e};
  }
}
