import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:smart_dash/feature/setting/domain/setting.dart';

class SettingSwitchTile extends AbstractSettingsTile {
  const SettingSwitchTile({
    super.key,
    required this.formControlName,
    required this.type,
  });

  final SettingType type;
  final String formControlName;

  @override
  Widget build(BuildContext context) {
    assert(type.isBool, 'SettingType must have a boolean type');
    return ReactiveFormField<Setting, Setting>(
      formControlName: formControlName,
      builder: (field) {
        return SettingsTile.switchTile(
          leading: const Icon(Icons.info),
          title: const Text('Show notices'),
          description: const Text('A notice is shown on each save'),
          // TODO: Find out how to use Theme.switchTheme using MaterialStateProperty
          activeSwitchColor: Colors.blueAccent,
          initialValue: field.value?.value as bool,
          onToggle: (show) {
            field.control.value = Setting(
              name: type.name,
              value: show,
            );
          },
        );
      },
    );
  }

  Text toValue(Setting? value) {
    switch (toType(value)) {
      case DarkMode.on:
        return const Text('On');
      case DarkMode.off:
        return const Text('Off');
      case DarkMode.system:
        return const Text('System Default');
    }
    return Text('Mode $value unknown');
  }

  String toType(Setting? value) =>
      value?.value.toString() ?? SettingType.darkMode.toStringValue();
}
