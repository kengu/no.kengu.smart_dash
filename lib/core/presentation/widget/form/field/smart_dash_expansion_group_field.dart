import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:smart_dash/core/presentation/widget/list/expansion_list.dart';

typedef SmartDashExpansionGroupFieldItemBuilder<T> = Widget Function(
    BuildContext context, String name, AbstractControl<T> control);

class SmartDashExpansionGroupField<T> extends StatelessWidget {
  const SmartDashExpansionGroupField({
    super.key,
    required this.title,
    required this.formGroup,
    required this.itemBuilder,
    this.icon,
    this.onDelete,
    this.description,
    this.dense = false,
    this.iconSize = 32,
    this.iconTurns = 0.25,
    this.childPadding = const EdgeInsets.only(bottom: 16.0),
  });

  final bool dense;
  final Widget title;
  final IconData? icon;
  final double iconSize;
  final double iconTurns;
  final Widget? description;
  final FormGroup formGroup;
  final VoidCallback? onDelete;
  final EdgeInsets childPadding;
  final SmartDashExpansionGroupFieldItemBuilder itemBuilder;

  @override
  Widget build(BuildContext context) {
    int index = 0;
    final keys = formGroup.controls.keys.toList();
    return SmartDashExpansionList(
      icon: icon,
      title: title,
      dense: dense,
      iconSize: iconSize,
      iconTurns: iconTurns,
      description: description,
      childPadding: childPadding,
      trailing: onDelete == null ? null : Icons.delete,
      onTrailing: onDelete,
      children: formGroup.controls.values
          .map((e) => itemBuilder(
                context,
                keys[index++],
                e as AbstractControl<T>,
              ))
          .toList(),
    );
  }
}
