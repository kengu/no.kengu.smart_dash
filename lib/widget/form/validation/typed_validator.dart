import 'package:reactive_forms/reactive_forms.dart';

typedef TypeToValueMapper<T, V> = V? Function(T);

/// Signature of a function that receives a control and synchronously
/// returns a map of validation errors if present, otherwise null.
typedef ValueValidatorFunction<V> = bool Function(V? value);

/// Validator that requires the control have typed value.
class TypedValidator<T, V> extends Validator<dynamic> {
  TypedValidator(this.messageName, this.map, this.delegated);

  final String messageName;
  final TypeToValueMapper<T, V> map;
  final ValueValidatorFunction<V> delegated;

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final error = <String, dynamic>{messageName: true};

    if (control.value! is T) {
      return error;
    }
    if (delegated(map(control.value))) {
      return error;
    }
    return null;
  }
}

class TypedValidators {
  /// Gets a validator that requires the control have a non-empty value.
  static ValidatorFunction required<T>(TypeToValueMapper<T, String> map) =>
      TypedValidator<T, String>(ValidationMessage.required, map,
          (value) => isNullOrEmptyString(value)).validate;

  static isNullOrNotType<T>(dynamic value) => value == null || value! is String;

  static isNullOrEmptyString(dynamic value) =>
      isNullOrNotType<String>(value) || (value as String).trim().isEmpty;
}
