import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_app/feature/setting/data/setting_repository.dart';
import 'package:smart_dash_app/feature/setting/domain/setting.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_datasource/smart_dash_datasource.dart';

part 'setting_service.g.dart';

class SettingService {
  SettingService(this.ref) {
    ref.onDispose(() {
      _controller.close();
    });
  }

  final Ref ref;
  final _cache = FutureCache(prefix: '$SettingService');
  final StreamController<SettingEvent> _controller =
      StreamController.broadcast();

  Stream<SettingEvent> get events async* {
    await for (final e in ref.read(settingRepositoryProvider).events) {
      if (e.isBulk) {
        for (final it in e.created) {
          yield SettingEvent(it);
        }
        for (final it in e.updated) {
          yield SettingEvent(it);
        }
      } else {
        if (e.isNotEmpty) {
          yield SettingEvent(
            (e.result as SingleRepositoryResult<SettingType, Setting>).item,
          );
        }
      }
    }
  }

  SettingMap get settings {
    final values = _cache.results.keys.map(
      (key) => get(SettingType.of(key)),
    );
    return Map.fromEntries(values.map(
      (e) => MapEntry(SettingType.of(e.value.name), e.value),
    ));
  }

  Future<SettingMap> load() async {
    final repo = ref.read(settingRepositoryProvider);
    final settings = await repo.load();
    for (final it in settings.entries) {
      _cache.set(it.key.name, Optional.of(it.value));
    }
    return settings;
  }

  Optional<Setting> get(SettingType key) {
    return _cache.get(key.name);
  }

  T getOrDefault<T>(SettingType type, T defaultValue) {
    return _cache.contains(type.name)
        ? switch (typeOf<T>()) {
            const (int) => get(type).value.toInt() as T,
            const (bool) => get(type).value.toBool() as T,
            const (double) => get(type).value.toDouble() as T,
            const (String) => get(type).value.toString() as T,
            _ => defaultValue
          }
        : defaultValue;
  }

  Future<Optional<Setting>> set(Setting value) async {
    final repo = ref.read(settingRepositoryProvider);
    final result = await repo.set(value);
    if (result.isPresent) {
      _controller.add(
        SettingEvent(result.value),
      );
    }
    return _cache.set(value.name, result);
  }

  Future<bool> save(SettingMap values) {
    final repo = ref.read(settingRepositoryProvider);
    return repo.save(values);
  }
}

@Riverpod(keepAlive: true)
SettingService settingService(SettingServiceRef ref) {
  return SettingService(ref);
}

class SettingEvent {
  SettingEvent(this.data);
  final Setting data;

  int toInt() => int.parse(data.toString());
  bool toBool() => data.value == true;
  double toDouble() => double.parse(data.toString());

  @override
  String toString() => data.value.toString();

  SettingType get type => SettingType.of(data.name);

  bool isType(SettingType type) => data.type == type;
}
