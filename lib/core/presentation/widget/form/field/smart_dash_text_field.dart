import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SmartDashTextField<T> extends StatelessWidget {
  const SmartDashTextField({
    super.key,
    required this.labelText,
    required this.formControlName,
    this.hintText,
    this.suffixIcon,
    this.valueAccessor,
    this.validationMessages,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
  });

  final bool obscureText;
  final String labelText;
  final String? hintText;
  final Widget? suffixIcon;
  final String formControlName;
  final TextInputAction? textInputAction;
  final ControlValueAccessor<T, String>? valueAccessor;
  final Map<String, ValidationMessageFunction>? validationMessages;

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField<T>(
      obscureText: obscureText,
      valueAccessor: valueAccessor,
      formControlName: formControlName,
      textInputAction: textInputAction,
      validationMessages: validationMessages,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
