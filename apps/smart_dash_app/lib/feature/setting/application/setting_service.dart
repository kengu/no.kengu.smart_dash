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

  // TODO Make delay configurable
  final Duration delay = const Duration(milliseconds: 50);

  Stream<SettingEvent> get events async* {
    await for (final e in ref.read(settingRepositoryProvider).events) {
      if (e.isBulk) {
        final events = [];
        for (final it in e.created) {
          events.add(SettingEvent(it));
          _cache.set(it.name, Optional.of(it));
        }
        for (final it in e.updated) {
          events.add(SettingEvent(it));
          _cache.set(it.name, Optional.of(it));
        }

        // NOTE: We should not add events too fast to stream for
        // overall performance reasons. And StreamProviders only
        // sees last event when events are added more frequently
        // than 60 fps (less than 17 milliseconds between each event).
        await for (final event in Stream.fromIterable(events).delayed(delay)) {
          yield event;
        }
      } else {
        if (e.isNotEmpty) {
          final setting = e.item;
          _cache.set(setting.name, Optional.of(setting));
          yield SettingEvent(
            (e.result as SingleRepositoryResult<SettingType, Setting>).item,
          );
        }
      }
      ref.notifyListeners();
    }
  }

  SettingMap get settings {
    final values = _cache.results.keys.map(
      (key) => _cache.get<Setting>(SettingType.of(key).name),
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

  Optional<T> get<T>(SettingType key, [T? defaultValue]) {
    final result = _cache.get(key.name);
    if (!result.isPresent) {
      return const Optional.empty();
    }
    return Optional.ofNullable(switch (typeOf<T>()) {
      const (int) => result.value.toInt() as T,
      const (bool) => result.value.toBool() as T,
      const (double) => result.value.toDouble() as T,
      const (String) => result.value.toString() as T,
      _ => defaultValue
    });
  }

  T getOrDefault<T>(SettingType type, [T? defaultValue]) {
    return _cache.contains(type.name)
        ? get<T>(type).value
        : (defaultValue ?? type.defaultValue as T);
  }

  Stream<T> where<T>(SettingType type) {
    return events
        .where((e) => e.isType(type))
        .map((e) => e.data)
        .map((e) => switch (typeOf<T>()) {
              const (int) => e.toInt() as T,
              const (bool) => e.toBool() as T,
              const (double) => e.toDouble() as T,
              const (String) => e.toString() as T,
              _ => throw UnimplementedError(
                  'Type ${typeOf<T>()} not implemented',
                )
            });
  }

  StreamSubscription<Setting> onChange<T>(
    SettingType type,
    void Function(T value) handle,
  ) {
    return events
        .where((e) => e.isType(type))
        .map((e) => e.data)
        .listen((e) => switch (typeOf<T>()) {
              const (int) => handle(e.toInt() as T),
              const (bool) => handle(e.toBool() as T),
              const (double) => handle(e.toDouble() as T),
              const (String) => handle(e.toString() as T),
              _ => throw UnimplementedError(
                  'Type ${typeOf<T>()} not implemented',
                )
            });
  }

  Future<Optional<Setting>> set(Setting value) async {
    final repo = ref.read(settingRepositoryProvider);
    final result = await repo.set(value);
    try {
      return _cache.set(value.name, result);
    } finally {
      if (result.isPresent) {
        _controller.add(
          SettingEvent(result.value),
        );
      }
    }
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
