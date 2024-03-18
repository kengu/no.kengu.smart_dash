import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SmartDashSwitchField extends StatelessWidget {
  const SmartDashSwitchField({
    super.key,
    required this.title,
    required this.description,
    this.icon,
    this.enabled = true,
    this.formControl,
    this.formControlName,
    this.formPath = const [],
  });

  final Icon? icon;
  final String title;
  final bool enabled;
  final String description;
  final List<Object> formPath;
  final String? formControlName;
  final FormControl<bool>? formControl;

  static const _darkInactiveTitleColor = Color.fromARGB(255, 118, 117, 122);
  static const _lightInactiveTitleColor = Color.fromARGB(255, 146, 144, 148);

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    final inactiveTitleColor =
        isDarkMode ? _darkInactiveTitleColor : _lightInactiveTitleColor;
    return InputDecorator(
      decoration: InputDecoration(
        label: Text(title),
        border: InputBorder.none,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            description,
            textScaler: const TextScaler.linear(1.2),
          ),
          ReactiveFormField<bool, bool>(
            formControl: formControl,
            formControlName:
                [...formPath, formControlName].whereNotNull().join('.'),
            builder: (field) {
              return Switch.adaptive(
                value: field.value ?? false,
                activeColor: enabled ? Colors.blueAccent : inactiveTitleColor,
                onChanged: (value) {
                  field.control.value = value;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
