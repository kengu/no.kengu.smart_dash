import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:smart_dash/core/presentation/dialog.dart';
import 'package:smart_dash/core/presentation/smart_dash_icons_icons.dart';
import 'package:smart_dash/core/presentation/theme/smart_dash_theme_data.dart';
import 'package:smart_dash/core/presentation/widget/form/field/smart_dash_dropdown_field.dart';
import 'package:smart_dash/core/presentation/widget/form/field/smart_dash_expansion_array_field.dart';
import 'package:smart_dash/core/presentation/widget/form/field/smart_dash_expansion_group_field.dart';
import 'package:smart_dash/core/presentation/widget/form/field/smart_dash_text_field.dart';
import 'package:smart_dash/feature/flow/domain/block.dart';
import 'package:smart_dash/feature/flow/domain/token.dart';
import 'package:smart_dash/feature/flow/presentation/form/block_flow_form_controller.dart';
import 'package:smart_dash/util/data/json.dart';
import 'package:smart_dash/util/widget.dart';

class BlockConditionsArrayField extends ConsumerWidget {
  const BlockConditionsArrayField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SmartDashExpansionArrayField<JsonObject>(
      icon: SmartDashIcons.function,
      title: const Text('Conditions'),
      description: Text(
        'Click to manage conditions',
        style: getLegendTextStyle(context),
      ),
      childPadding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
      onAdd: () async {
        final label = await showTextInputDialog(
          context,
          title: 'Add Condition',
          hint: 'Enter Name',
        );
        if (label?.isNotEmpty == true) {
          return BlockFlowFormController.buildConditionFormGroup(
            BlockCondition(
              label: label!,
              expression: '',
              description: '',
              variables: [],
            ),
          );
        }
        return null;
      },
      formArrayName: BlockFields.conditions,
      itemBuilder: (context, array, index, control) => _BlockConditionField(
        index: index,
        group: control as FormGroup,
        onDelete: (name) async {
          final remove = await showPromptDialog(
            context,
            title: 'Delete condition [$name]',
          );
          if (remove == true) {
            array.removeAt(
              index,
              emitEvent: true,
              updateParent: true,
            );
          }
        },
      ),
    );
  }
}

class _BlockConditionField extends StatelessWidget {
  const _BlockConditionField({
    required this.index,
    required this.group,
    required this.onDelete,
  });

  final int index;
  final FormGroup group;
  final ValueSetter<String> onDelete;

  @override
  Widget build(BuildContext context) {
    TextStyle style = _toTextStyle(context);
    final param = BlockCondition.fromJson(group.value);
    return SmartDashExpansionGroupField(
      dense: true,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Chip(
            padding: EdgeInsets.zero,
            label: Text(param.label, style: style),
            elevation: 8.0,
            visualDensity: VisualDensity.compact,
            backgroundColor: Colors.brown.lighten(0.1),
          ),
          const Spacer(),
          Text('= ', style: style),
          Text(param.expression.toString(), style: style),
        ],
      ),
      formGroup: group,
      onDelete: () => onDelete(param.label),
      itemBuilder: (context, name, control) {
        switch (name) {
          case BlockConditionFields.label:
            return SmartDashTextField<String>(
              labelText: 'Name',
              formPath: [index],
              formControlName: BlockConditionFields.label,
              validationMessages: {
                ValidationMessage.required: (_) => 'Please enter name',
              },
            );
          case BlockConditionFields.description:
            return SmartDashTextField<Object>(
              labelText: 'Description',
              formPath: [index],
              formControlName: BlockConditionFields.description,
            );
          case BlockConditionFields.expression:
            return SmartDashTextField<String>(
              labelText: 'Expression',
              formPath: [index],
              formControlName: BlockConditionFields.expression,
              validationMessages: {
                ValidationMessage.required: (_) => 'Please enter expression',
              },
            );
          case BlockConditionFields.variables:
            return _BlockVariablesList(index: index);
        }
        return Text(name);
      },
    );
  }
}

class _BlockVariablesList extends ConsumerWidget {
  const _BlockVariablesList({
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SmartDashExpansionArrayField<JsonObject>(
      icon: SmartDashIcons.variable,
      title: const Text('Variables'),
      description: Text(
        'Click to manage variables',
        style: getLegendTextStyle(context),
      ),
      childPadding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
      onAdd: () async {
        final name = await showTextInputDialog(
          context,
          title: 'Add Variable',
          hint: 'Enter Name',
        );
        if (name?.isNotEmpty == true) {
          return BlockFlowFormController.buildVariableFormGroup(
            BlockVariable(
              tag: name!,
              name: name,
              label: name,
              description: '',
              type: TokenType.int,
              unit: TokenUnit.value,
            ),
          );
        }
        return null;
      },
      formPath: [index],
      formArrayName: BlockConditionFields.variables,
      itemBuilder: (context, array, index, control) => _BlockVariableField(
        index: index,
        group: control as FormGroup,
        onDelete: (name) async {
          final remove = await showPromptDialog(
            context,
            title: 'Delete variable [$name]',
          );
          if (remove == true) {
            array.removeAt(
              index,
              emitEvent: true,
              updateParent: true,
            );
          }
        },
      ),
    );
  }
}

class _BlockVariableField extends StatelessWidget {
  const _BlockVariableField({
    required this.index,
    required this.group,
    required this.onDelete,
  });

  final int index;
  final FormGroup group;
  final ValueSetter<String> onDelete;

  @override
  Widget build(BuildContext context) {
    final style = _toTextStyle(context);

    final variable = BlockVariable.fromJson(group.value);
    return SmartDashExpansionGroupField(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(''),
          Chip(
            padding: EdgeInsets.zero,
            label: Text(variable.label, style: style),
            elevation: 8.0,
            visualDensity: VisualDensity.compact,
            backgroundColor: Colors.brown.lighten(0.1),
          ),
          const Spacer(),
          Text('= ', style: style),
          Text(variable.tag, style: style),
        ],
      ),
      formGroup: group,
      onDelete: () => onDelete(variable.tag),
      itemBuilder: (context, name, control) {
        switch (name) {
          case BlockVariableFields.label:
            return SmartDashTextField<String>(
              labelText: 'Label',
              formPath: [index],
              formControlName: BlockVariableFields.label,
              validationMessages: {
                ValidationMessage.required: (_) => 'Please enter name',
              },
            );
          case BlockVariableFields.tag:
            return SmartDashTextField<String>(
              labelText: 'Tag',
              formPath: [index],
              formControlName: BlockVariableFields.tag,
              validationMessages: {
                ValidationMessage.required: (_) => 'Please enter tag',
              },
            );
          case BlockVariableFields.name:
            return SmartDashTextField<String>(
              labelText: 'Name',
              formPath: [index],
              formControlName: BlockVariableFields.name,
              validationMessages: {
                ValidationMessage.required: (_) => 'Please enter name',
              },
            );
          case BlockVariableFields.description:
            return SmartDashTextField<Object>(
              labelText: 'Description',
              formPath: [index],
              formControlName: BlockVariableFields.description,
            );
          case BlockVariableFields.type:
            return SmartDashDropdownField<String>(
              labelText: 'Type',
              formPath: [index],
              formControlName: BlockVariableFields.type,
              validationMessages: {
                ValidationMessage.required: (_) => 'Please select type',
              },
              items: TokenType.values
                  .map((type) => DropdownMenuItem(
                        value: type.name,
                        child: Text(switch (type) {
                          TokenType.int => 'Integer',
                          TokenType.bool => 'Boolean',
                          TokenType.double => 'Double',
                        }),
                      ))
                  .toList(),
            );
          case BlockVariableFields.unit:
            return SmartDashDropdownField<String>(
              labelText: 'Unit',
              formPath: [index],
              formControlName: BlockVariableFields.unit,
              validationMessages: {
                ValidationMessage.required: (_) => 'Please select unit',
              },
              items: TokenUnit.values
                  .map((unit) => DropdownMenuItem(
                        value: unit.name,
                        child: Text(unit.name),
                      ))
                  .toList(),
            );
        }
        return Text(name);
      },
    );
  }
}

TextStyle _toTextStyle(BuildContext context) {
  final surfaceColor = Theme.of(context).navigationRailTheme.backgroundColor!;
  final legendTextColor = surfaceColor.lighten(0.70);
  final style =
      Theme.of(context).textTheme.labelMedium!.copyWith(color: legendTextColor);
  return style;
}
