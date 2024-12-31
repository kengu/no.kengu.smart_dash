import 'package:optional/optional.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_app/core/presentation/widget/state/smart_dash_state.dart';
import 'package:smart_dash_app/feature/setting/application/setting_service.dart';
import 'package:smart_dash_app/feature/setting/data/setting_repository.dart';
import 'package:smart_dash_app/feature/setting/domain/setting.dart';

part 'settings_form_screen_view_model.g.dart';

class SettingsQuery {
  const SettingsQuery();
}

@riverpod
class SettingsFormScreenViewModel extends _$SettingsFormScreenViewModel
    with
        AsyncViewModel<SettingsQuery, SettingMap>,
        AsyncFormViewModel<SettingsQuery, SettingMap> {
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
  SettingMap toData(Map<String, Object?> value) {
    return value.map(
      (key, value) => MapEntry(
        SettingType.of(key),
        value as Setting,
      ),
    );
  }

  @override
  Future<Optional<SettingMap>> load(SettingsQuery query) async {
    final result = await ref.read(settingServiceProvider).load();
    return Optional.of(result);
  }

  @override
  Future<bool> save(SettingMap data) {
    return ref.read(settingServiceProvider).save(data);
  }
}
