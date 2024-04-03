import 'package:reactive_forms/reactive_forms.dart';

class DefaultIntValueAccessor extends ControlValueAccessor<int, String> {
  DefaultIntValueAccessor(this.defaultValue);
  final int defaultValue;

  @override
  String modelToViewValue(int? modelValue) {
    return modelValue == null ? defaultValue.toString() : modelValue.toString();
  }

  @override
  int? viewToModelValue(String? viewValue) {
    final value = viewValue?.replaceAll(' ', '');
    return (value == '' || value == null) ? defaultValue : int.tryParse(value);
  }
}

class DefaultDoubleValueAccessor extends ControlValueAccessor<double, String> {
  DefaultDoubleValueAccessor(this.defaultValue);
  final double defaultValue;

  @override
  String modelToViewValue(double? modelValue) {
    return modelValue == null ? defaultValue.toString() : modelValue.toString();
  }

  @override
  double? viewToModelValue(String? viewValue) {
    final value = viewValue?.replaceAll(' ', '');
    return (value == '' || value == null)
        ? defaultValue
        : double.tryParse(value);
  }
}
