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
import 'package:smart_dash/feature/flow/presentation/form/block_flow_form_controller.dart';
import 'package:smart_dash/util/data/json.dart';
import 'package:smart_dash/util/widget.dart';

class BlockActionsArrayField extends ConsumerWidget {
  const BlockActionsArrayField({
    super.key,
    required this.title,
    required this.formArrayName,
  });

  final String title;
  final String formArrayName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SmartDashExpansionArrayField<JsonObject>(
      icon: SmartDashIcons.alert,
      title: Text(title),
      description: Text(
        'Click to manage actions',
        style: getLegendTextStyle(context),
      ),
      childPadding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
      onAdd: () async {
        final type = await showSelectInputDialog(
          context,
          title: 'Add Action',
          hint: 'Choose...',
          items: Map.fromEntries(
            BlockActionType.values.map(
              (e) => MapEntry(e, e.name),
            ),
          ),
        );
        if (type != null) {
          return BlockFlowFormController.buildActionFormGroup(
            BlockAction(
              label: type.name,
              description: type.name,
              type: type,
            ),
          );
        }
        return null;
      },
      formArrayName: formArrayName,
      itemBuilder: (context, array, index, control) => _BlockActionField(
        index: index,
        group: control as FormGroup,
        onDelete: (name) async {
          final remove = await showPromptDialog(
            context,
            title: 'Delete action [$name]',
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

class _BlockActionField extends StatelessWidget {
  const _BlockActionField({
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
    final actions = BlockAction.fromJson(group.value);
    return SmartDashExpansionGroupField(
      dense: true,
      title: Row(
        children: [
          Chip(
            padding: EdgeInsets.zero,
            label: Text(actions.label, style: style),
            elevation: 8.0,
            visualDensity: VisualDensity.compact,
            backgroundColor: Colors.brown.lighten(0.1),
          ),
        ],
      ),
      formGroup: group,
      onDelete: () => onDelete(actions.label),
      itemBuilder: (context, name, control) {
        switch (name) {
          case BlockActionFields.label:
            return SmartDashTextField<String>(
              labelText: 'Name',
              formPath: [index],
              formControlName: BlockActionFields.label,
              validationMessages: {
                ValidationMessage.required: (_) => 'Please enter name',
              },
            );
          case BlockActionFields.description:
            return SmartDashTextField<Object>(
              labelText: 'Description',
              formPath: [index],
              formControlName: BlockActionFields.description,
            );
          case BlockActionFields.type:
            return SmartDashDropdownField<String>(
              labelText: 'Type',
              formPath: [index],
              formControlName: BlockActionFields.type,
              validationMessages: {
                ValidationMessage.required: (_) => 'Please select type',
              },
              items: BlockActionType.values
                  .map((type) => DropdownMenuItem(
                        value: type.name,
                        child: Text(switch (type) {
                          BlockActionType.notification => 'Notification'
                        }),
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
