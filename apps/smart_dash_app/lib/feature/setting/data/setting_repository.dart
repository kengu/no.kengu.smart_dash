import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_app/feature/setting/domain/setting.dart';
import 'package:smart_dash_datasource/smart_dash_datasource.dart';

part 'setting_repository.g.dart';

typedef SettingMap = Map<SettingType, Setting>;

class SettingRepository extends BulkHiveRepository<SettingType, Setting> {
  SettingRepository(super.ref)
      : super(
          key: 'settings',
          box: 'registered',
          adapter: SettingAdapter(),
        );

  @override
  String toKey(SettingType id) => id.name;

  @override
  SettingType toId(Setting item) => item.type;

  static List<Setting> get defaults =>
      SettingType.values.map(Setting.of).toList();

  Future<Optional<Setting>> set(Setting item) async {
    final current = await get(toId(item));
    await upsert(item);
    return current;
  }

  Future<SettingMap> load() async {
    final settings = await getAll();
    return toMap(
      defaults..addAll(settings),
    );
  }

  Future<bool> save([SettingMap? settings]) async {
    final result = await updateAll(settings?.values ?? []);
    return result.isNotEmpty;
  }

  static SettingMap toMap(Iterable<Setting>? settings) {
    return {for (final e in settings ?? <Setting>[]) SettingType.of(e.name): e};
  }
}

@Riverpod(keepAlive: true)
SettingRepository settingRepository(Ref ref) {
  return SettingRepository(ref);
}

class SettingAdapter extends TypedAdapter<Setting> {
  SettingAdapter() : super(HiveTypeId.setting);

  @override
  Setting read(BinaryReader reader) {
    final json = jsonDecode(
      reader.read(),
    );
    return Setting.fromJson(json);
  }

  @override
  void write(BinaryWriter writer, Setting obj) {
    writer.write(jsonEncode(
      obj.toJson(),
    ));
  }
}
