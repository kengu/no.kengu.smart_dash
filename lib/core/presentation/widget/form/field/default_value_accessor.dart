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
    return (viewValue == '' || viewValue == null)
        ? defaultValue
        : int.tryParse(viewValue);
  }
}
