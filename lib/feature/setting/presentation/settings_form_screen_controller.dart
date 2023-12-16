import 'package:optional/optional.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/setting/data/setting_repository.dart';
import 'package:smart_dash/feature/setting/domain/setting.dart';
import 'package:smart_dash/widget/form/async_form_controller.dart';
import 'package:smart_dash/widget/load/async_load_controller.dart';

part 'settings_form_screen_controller.g.dart';

class SettingsQuery {}

@riverpod
class SettingsFormScreenController extends _$SettingsFormScreenController
    with
        AsyncLoadController<SettingsQuery, SettingMap>,
        AsyncFormController<SettingsQuery, SettingMap> {
  SettingsFormScreenController() {
    select(SettingsQuery());
  }

  @override
  FutureOr<Optional<SettingMap>> build() => super.build();

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
  Future<Optional<SettingMap>> load() =>
      ref.read(settingRepositoryProvider.notifier).load();

  @override
  Future<bool> save(SettingMap data) async {
    return await ref.read(settingRepositoryProvider.notifier).save(data.values);
  }
}
