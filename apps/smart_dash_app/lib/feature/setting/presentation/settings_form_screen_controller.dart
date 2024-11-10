import 'package:optional/optional.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_app/core/presentation/widget/form/async_form_controller.dart';
import 'package:smart_dash_app/core/presentation/widget/load/async_load_controller.dart';
import 'package:smart_dash_app/feature/setting/data/setting_repository.dart';
import 'package:smart_dash_app/feature/setting/domain/setting.dart';

part 'settings_form_screen_controller.g.dart';

class SettingsQuery {
  const SettingsQuery();
}

@riverpod
class SettingsFormScreenController extends _$SettingsFormScreenController
    with
        AsyncLoadController<SettingsQuery, SettingMap>,
        AsyncFormController<SettingsQuery, SettingMap> {
  @override
  FutureOr<Optional<SettingMap>> build(SettingsQuery query) =>
      super.build(query);

  @override
  FormGroup buildForm(Optional<SettingMap> data) {
    return fb.group(Map.fromEntries(data.value
        .map((key, value) => MapEntry(key.name, buildField(value)))
        .entries));
  }

  FormControl<Setting> buildField(Setting value) {
    return fb.control(value, [Validators.required]);
  }

  @override
  SettingMap buildData(Map<String, Object?> value) {
    return value.map(
      (key, value) => MapEntry(
        SettingType.of(key),
        value as Setting,
      ),
    );
  }

  @override
  Future<Optional<SettingMap>> load(SettingsQuery query) =>
      ref.read(settingRepositoryProvider.notifier).load();

  @override
  Future<bool> save(SettingMap data) {
    return ref.read(settingRepositoryProvider.notifier).save(data.values);
  }
}
