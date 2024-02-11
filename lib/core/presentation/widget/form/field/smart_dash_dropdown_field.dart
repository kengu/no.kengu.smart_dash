import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SmartDashDropdownField<T> extends StatelessWidget {
  const SmartDashDropdownField({
    super.key,
    required this.items,
    required this.labelText,
    required this.formControlName,
    this.suffixIcon,
    this.validationMessages,
  });

  final String? labelText;
  final Widget? suffixIcon;
  final String formControlName;
  final List<DropdownMenuItem<T>> items;
  final Map<String, ValidationMessageFunction>? validationMessages;

  @override
  Widget build(BuildContext context) {
    return ReactiveDropdownField<T>(
      items: items,
      formControlName: formControlName,
      validationMessages: validationMessages,
      decoration: InputDecoration(labelText: labelText, suffixIcon: suffixIcon),
    );
  }
}
