import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:smart_dash/core/presentation/dialog.dart';
import 'package:smart_dash/core/presentation/smart_dash_icons_icons.dart';
import 'package:smart_dash/core/presentation/theme/smart_dash_theme_data.dart';
import 'package:smart_dash/core/presentation/widget.dart';
import 'package:smart_dash/core/presentation/widget/form/field/smart_dash_dropdown_field.dart';
import 'package:smart_dash/core/presentation/widget/form/field/smart_dash_expansion_array_field.dart';
import 'package:smart_dash/core/presentation/widget/form/field/smart_dash_expansion_group_field.dart';
import 'package:smart_dash/core/presentation/widget/form/field/smart_dash_text_field.dart';
import 'package:smart_dash/core/presentation/widget/form/field/typed_value_accessor.dart';
import 'package:smart_dash/feature/flow/presentation/form/block_flow_form_controller.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_flow/smart_dash_flow.dart';

class BlockParametersArrayField extends ConsumerWidget {
  const BlockParametersArrayField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SmartDashExpansionArrayField<JsonObject>(
      icon: SmartDashIcons.parameter,
      title: const Text('Parameters'),
      description: Text(
        'Click to manage parameters',
        style: getLegendTextStyle(context),
      ),
      childPadding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
      onAdd: () async {
        final name = await showTextInputDialog(
          context,
          title: 'Add Parameter',
          hint: 'Enter Name',
        );
        if (name?.isNotEmpty == true) {
          return BlockFlowFormController.buildParameterFormGroup(
            BlockParameter(
              tag: name!,
              name: name,
              value: 0,
              type: ValueType.int,
              unit: ValueUnit.any,
            ),
          );
        }
        return null;
      },
      formArrayName: BlockFields.parameters,
      itemBuilder: (context, array, index, control) => _BlockParameterField(
        index: index,
        group: control as FormGroup,
        onDelete: (name) async {
          final remove = await showPromptDialog(
            context,
            title: 'Delete parameter [$name]',
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

class _BlockParameterField extends StatelessWidget {
  const _BlockParameterField({
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
    final param = BlockParameter.fromJson(group.value);
    return SmartDashExpansionGroupField(
      dense: true,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(''),
          Chip(
            elevation: 8.0,
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
            label: Text(param.name, style: style),
            backgroundColor: Colors.brown.lighten(0.1),
          ),
          const Spacer(),
          Text('= ', style: style),
          Text(param.value.toString(), style: style),
        ],
      ),
      formGroup: group,
      onDelete: () => onDelete(param.name),
      itemBuilder: (context, name, control) {
        switch (name) {
          case BlockParameterFields.name:
            return SmartDashTextField<String>(
              labelText: 'Name',
              formPath: [index],
              formControlName: BlockParameterFields.name,
              validationMessages: {
                ValidationMessage.required: (_) => 'Please enter name',
              },
            );
          case BlockParameterFields.tag:
            return SmartDashTextField<String>(
              labelText: 'Tag',
              formPath: [index],
              formControlName: BlockParameterFields.tag,
              validationMessages: {
                ValidationMessage.required: (_) => 'Please enter tag',
              },
            );
          case BlockParameterFields.value:
            return SmartDashTextField<Object>(
              labelText: 'Value',
              formPath: [index],
              formControlName: BlockParameterFields.value,
              allowEmpty: false,
              validationMessages: {
                ValidationMessage.required: (_) => 'Please enter value',
              },
              valueAccessor: TypedValueAccessor<Object, String>(
                toModel: (value) {
                  if (value != null) {
                    // Apply type to value
                    final source = group.findControl(
                      BlockParameterFields.type,
                    );
                    final type = ValueType.of(source!.value);
                    return type.tryParse(value);
                  }
                  return value;
                },
                toValue: (value) => value.toString(),
              ),
            );
          case BlockParameterFields.type:
            return SmartDashDropdownField<String>(
              labelText: 'Type',
              formPath: [index],
              formControlName: BlockParameterFields.type,
              validationMessages: {
                ValidationMessage.required: (_) => 'Please select type',
              },
              onChanged: (source) {
                // Apply type to value
                final target = group.findControl(
                  BlockParameterFields.value,
                );
                final type = ValueType.of(source.value);
                target!.value = type.tryParse(target.value);
              },
              items: ValueType.values
                  .map((type) => DropdownMenuItem(
                        value: type.name,
                        child: Text(switch (type) {
                          ValueType.int => 'Integer',
                          ValueType.bool => 'Boolean',
                          ValueType.double => 'Double',
                        }),
                      ))
                  .toList(),
            );
          case BlockParameterFields.unit:
            return SmartDashDropdownField<String>(
              labelText: 'Unit',
              formPath: [index],
              formControlName: BlockParameterFields.unit,
              validationMessages: {
                ValidationMessage.required: (_) => 'Please select unit',
              },
              items: ValueUnit.values
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
