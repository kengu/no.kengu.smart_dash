import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:smart_dash/feature/setting/domain/setting.dart';

class PriceAreaTile extends AbstractSettingsTile {
  PriceAreaTile({
    super.key,
    required this.formControlName,
  });

  final String formControlName;

  final _popupMenuKey = GlobalKey<PopupMenuButtonState>();

  @override
  Widget build(BuildContext context) {
    return ReactiveFormField<Setting, Setting>(
      formControlName: formControlName,
      builder: (field) {
        final area = field.value?.value;
        return SettingsTile(
          leading: const Icon(Icons.attach_money),
          //title: const Text('Electricity Price Area'),
          title: PopupMenuButton<String>(
            key: _popupMenuKey,
            position: PopupMenuPosition.over,
            tooltip: 'Select Price Area',
            child: const Text('Electricity Price Area'),
            onSelected: (String name) {
              field.control.value = Setting(
                name: SettingType.priceArea.name,
                value: name,
              );
            },
            itemBuilder: (BuildContext context) {
              return SettingType.priceArea.options
                  .map((name) => PopupMenuItem<String>(
                        value: name.toString(),
                        child: Row(
                          children: [
                            const Icon(Icons.home),
                            const SizedBox(width: 24),
                            Text('Area $name'),
                          ],
                        ),
                      ))
                  .toList();
            },
          ),
          value: Text('Area $area'),
          onPressed: (context) async {
            _popupMenuKey.currentState?.showButtonMenu();
          },
        );
      },
    );
  }
}
