import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SmartDashDropdownField<T> extends StatelessWidget {
  const SmartDashDropdownField({
    super.key,
    required this.items,
    required this.labelText,
    this.onChanged,
    this.suffixIcon,
    this.formControl,
    this.formControlName,
    this.formPath = const [],
    this.validationMessages,
  });

  final String? labelText;
  final Widget? suffixIcon;
  final List<Object> formPath;
  final String? formControlName;
  final FormControl<T>? formControl;
  final List<DropdownMenuItem<T>> items;
  final ReactiveFormFieldCallback<T>? onChanged;
  final Map<String, ValidationMessageFunction>? validationMessages;

  @override
  Widget build(BuildContext context) {
    return ReactiveDropdownField<T>(
      items: items,
      onChanged: onChanged,
      formControl: formControl,
      formControlName: [...formPath, formControlName].nonNulls.join('.'),
      validationMessages: validationMessages,
      decoration: InputDecoration(labelText: labelText, suffixIcon: suffixIcon),
    );
  }
}
