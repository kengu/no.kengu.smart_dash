import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:smart_dash/core/presentation/widget/list/expansion_list.dart';

typedef SmartDashExpansionArrayItemFieldBuilder<T> = Widget Function(
    BuildContext context,
    FormArray<T> array,
    int index,
    AbstractControl<T> control);

class SmartDashExpansionArrayField<T> extends StatelessWidget {
  const SmartDashExpansionArrayField({
    super.key,
    required this.title,
    required this.description,
    required this.itemBuilder,
    required this.formArrayName,
    this.icon,
    this.onAdd,
    this.dense = false,
    this.iconSize = 32,
    this.iconTurns = 0.25,
    this.formPath = const [],
    this.initiallyExpanded = false,
    this.childPadding = const EdgeInsets.only(bottom: 16.0),
  });

  final bool dense;
  final Widget title;
  final IconData? icon;
  final double iconSize;
  final double iconTurns;
  final Widget description;
  final String formArrayName;
  final List<Object> formPath;
  final bool initiallyExpanded;
  final EdgeInsets childPadding;
  final AsyncValueGetter<AbstractControl<T>?>? onAdd;
  final SmartDashExpansionArrayItemFieldBuilder<T> itemBuilder;

  @override
  Widget build(BuildContext context) {
    return ReactiveFormArray<T>(
      formArrayName: [...formPath, formArrayName].whereNotNull().join('.'),
      builder: (context, array, child) {
        int index = 0;
        return SmartDashExpansionList(
          icon: icon,
          title: title,
          dense: dense,
          iconSize: iconSize,
          iconTurns: iconTurns,
          description: description,
          childPadding: childPadding,
          initiallyExpanded: initiallyExpanded,
          trailing: Icons.add,
          onTrailing: () async {
            if (onAdd != null) {
              final item = await onAdd!.call();
              if (item != null) {
                array.add(item);
              }
            }
          },
          children: array.controls
              .map((e) => itemBuilder(context, array, index++, e))
              .toList(),
        );
      },
    );
  }
}
