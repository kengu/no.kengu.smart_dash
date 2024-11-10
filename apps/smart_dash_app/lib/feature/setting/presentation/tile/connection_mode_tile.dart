import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:smart_dash_app/feature/setting/domain/setting.dart';

class ConnectionModeTile extends AbstractSettingsTile {
  const ConnectionModeTile({
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
          title: const Text('Connection mode'),
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
                        title: const Text('Auto'),
                        value: ConnectionMode.auto == field.value?.value,
                        onChanged: (_) => context.pop(ConnectionMode.auto),
                        groupValue: true,
                      ),
                      RadioListTile(
                        title: const Text('Online'),
                        value: ConnectionMode.online == field.value?.value,
                        onChanged: (_) => context.pop(ConnectionMode.online),
                        groupValue: true,
                      ),
                      RadioListTile(
                        title: const Text('Offline'),
                        value: ConnectionMode.offline == field.value?.value,
                        onChanged: (_) => context.pop(ConnectionMode.offline),
                        groupValue: true,
                      ),
                    ],
                  ),
                ),
              ),
            );
            if (mode != null) {
              field.control.value = Setting(
                name: SettingType.connectionMode.name,
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
      case ConnectionMode.auto:
        return const Text('Auto');
      case ConnectionMode.online:
        return const Text('Online');
      case ConnectionMode.offline:
        return const Text('Offline');
    }
    return Text('Mode $value unknown');
  }

  String toType(Setting? value) =>
      value?.value.toString() ?? SettingType.connectionMode.toStringValue();
}
