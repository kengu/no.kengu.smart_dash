import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SmartDashTextField<T> extends StatelessWidget {
  const SmartDashTextField({
    super.key,
    required this.labelText,
    this.formPath = const [],
    this.formControl,
    this.formControlName,
    this.hintText,
    this.minLines,
    this.maxLines = 1,
    this.suffixIcon,
    this.valueAccessor,
    this.allowEmpty = true,
    this.validationMessages,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
  });

  final int? minLines;
  final int? maxLines;
  final bool obscureText;
  final String labelText;
  final String? hintText;
  final Widget? suffixIcon;
  final List<Object> formPath;
  final String? formControlName;
  final bool allowEmpty;
  final FormControl<T>? formControl;
  final TextInputAction? textInputAction;
  final ControlValueAccessor<T, String>? valueAccessor;
  final Map<String, ValidationMessageFunction>? validationMessages;

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField<T>(
      maxLines: maxLines,
      minLines: minLines,
      formControl: formControl,
      enableSuggestions: true,
      obscureText: obscureText,
      valueAccessor: valueAccessor,
      textInputAction: textInputAction,
      validationMessages: validationMessages,
      inputFormatters: [
        if (!allowEmpty)
          TextInputFormatter.withFunction(
            (oldValue, newValue) => newValue.text.isEmpty ? oldValue : newValue,
          )
      ],
      formControlName: [...formPath, formControlName].nonNulls.join('.'),
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
