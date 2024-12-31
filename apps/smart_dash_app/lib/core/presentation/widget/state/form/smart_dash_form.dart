import 'package:flutter/widgets.dart';
import 'package:reactive_forms/reactive_forms.dart';

export 'async_form_screen.dart';
export 'async_form_view_model.dart';
export 'async_form_widget.dart';
export 'field/smart_dash_field.dart';

extension FormArrayX on FormArray {
  List<Widget> fieldBuilder<T>(
    Widget Function(int index, T value) builder,
  ) {
    final widgets = <Widget>[];
    if (isNotNull) {
      for (int i = 0; i < value!.length; i++) {
        widgets.add(builder(i, value![i] as T));
      }
    }
    return widgets;
  }
}
