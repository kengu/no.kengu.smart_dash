import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:smart_dash/feature/setting/domain/setting.dart';

class PriceAreaTile extends AbstractSettingsTile {
  const PriceAreaTile({
    super.key,
    required this.formControlName,
  });

  final String formControlName;

  @override
  Widget build(BuildContext context) {
    return ReactiveFormField<Setting, Setting>(
      formControlName: formControlName,
      builder: (field) {
        final area = field.value?.value;
        return SettingsTile(
          leading: const Icon(Icons.attach_money),
          title: const Text('Electricity Price Area'),
          value: Text('Area $area'),
          onPressed: (context) async {
            final selected = await showDialog<String>(
              context: context,
              builder: (BuildContext context) => Dialog(
                child: Container(
                  width: 300,
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: SettingType.priceArea.options
                        .map((name) => RadioListTile(
                              title: Text(name.toString()),
                              value: area == name,
                              onChanged: (_) => context.pop(name),
                              groupValue: true,
                            ))
                        .toList(),
                  ),
                ),
              ),
            );
            if (selected != null) {
              debugPrint(selected);
              field.control.value = Setting(
                name: SettingType.priceArea.name,
                value: selected,
              );
            }
          },
        );
      },
    );
  }
}
