import 'package:reactive_forms/reactive_forms.dart';

typedef ViewDataMapper<ModelDataType, ViewDataType> = ModelDataType? Function(
    ViewDataType?);

typedef ModelDataMapper<ModelDataType, ViewDataType> = ViewDataType? Function(
    ModelDataType?);

class TypedValueControlAccessor<ModelDataType, ViewDataType>
    extends ControlValueAccessor<ModelDataType, ViewDataType> {
  TypedValueControlAccessor({
    required ViewDataMapper<ModelDataType, ViewDataType> toModel,
    required ModelDataMapper<ModelDataType, ViewDataType> toValue,
  })  : _viewToModelValue = toModel,
        _modelToViewValue = toValue;

  final ViewDataMapper<ModelDataType, ViewDataType> _viewToModelValue;
  final ModelDataMapper<ModelDataType, ViewDataType> _modelToViewValue;

  @override
  ViewDataType? modelToViewValue(ModelDataType? modelValue) =>
      _modelToViewValue(modelValue);

  @override
  ModelDataType? viewToModelValue(ViewDataType? viewValue) =>
      _viewToModelValue(viewValue);
}
