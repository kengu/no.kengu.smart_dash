import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:smart_dash/feature/setting/domain/setting.dart';

class DarkModeTile extends AbstractSettingsTile {
  const DarkModeTile({
    super.key,
    required this.formControlName,
  });

  final String formControlName;

  @override
  Widget build(BuildContext context) {
    return ReactiveFormField<Setting, Setting>(
      formControlName: formControlName,
      builder: (field) {
        final value = field.value;
        return SettingsTile(
          leading: const Icon(Icons.brightness_4_outlined),
          title: const Text('Dark mode'),
          value: toValue(value),
          onPressed: (context) async {
            final mode = await showDialog<String>(
              context: context,
              builder: (BuildContext context) => Dialog(
                child: Container(
                  width: 300,
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RadioListTile(
                        title: const Text('System Default'),
                        value: DarkMode.system == field.value?.value,
                        onChanged: (_) => context.pop(DarkMode.system),
                        groupValue: true,
                      ),
                      RadioListTile(
                        title: const Text('On'),
                        value: DarkMode.on == field.value?.value,
                        onChanged: (_) => context.pop(DarkMode.on),
                        groupValue: true,
                      ),
                      RadioListTile(
                        title: const Text('Off'),
                        value: DarkMode.off == field.value?.value,
                        onChanged: (_) => context.pop(DarkMode.off),
                        groupValue: true,
                      ),
                    ],
                  ),
                ),
              ),
            );
            if (mode != null) {
              field.control.value = Setting(
                name: SettingType.darkMode.name,
                value: mode,
              );
            }
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
