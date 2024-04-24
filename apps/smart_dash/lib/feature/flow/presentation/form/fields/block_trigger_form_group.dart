import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:smart_dash/core/presentation/dialog.dart';
import 'package:smart_dash/core/presentation/theme/smart_dash_theme_data.dart';
import 'package:smart_dash/core/presentation/widget/form/field/default_value_accessor.dart';
import 'package:smart_dash/core/presentation/widget/form/field/smart_dash_expansion_group_field.dart';
import 'package:smart_dash/core/presentation/widget/form/field/smart_dash_switch_field.dart';
import 'package:smart_dash/core/presentation/widget/form/field/smart_dash_text_field.dart';
import 'package:smart_dash/core/presentation/widget/list/expansion_list.dart';
import 'package:smart_dash/feature/flow/application/flow_manager.dart';
import 'package:smart_dash/feature/flow/domain/block.dart';
import 'package:smart_dash/core/presentation/widget.dart';
import 'package:strings/strings.dart';

class BlockTriggerFormGroup extends ConsumerWidget {
  const BlockTriggerFormGroup({super.key, required this.group});

  final FormGroup group;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trigger = BlockTrigger.fromJson(group.value);
    return SmartDashExpansionGroupField(
      icon: Icons.bolt,
      title: const Text('Trigger'),
      description: Text(
        'Click to manage how to trigger this flow',
        style: getLegendTextStyle(context),
      ),
      formGroup: group,
      childPadding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
      itemBuilder: (context, name, control) {
        switch (name) {
          case BlockTriggerFields.any:
            return SmartDashSwitchField(
              icon: const Icon(Icons.power_settings_new),
              title: 'Trigger on any event',
              description: trigger.any
                  ? 'Disable to specify triggers'
                  : 'Enable to trigger on any event',
              formPath: const [BlockFields.trigger],
              formControlName: BlockTriggerFields.any,
            );
          case BlockTriggerFields.onTypes:
            if (trigger.any) return Container();
            return _BlockTriggerOnList(
              type: 'type',
              resolver: () {
                return Future.value(
                  Map.fromEntries(
                    BlockTriggerOnType.reminder(trigger.onTypes).map(
                      (e) => MapEntry(
                        e.name,
                        e.name.toCapitalised(),
                      ),
                    ),
                  ),
                );
              },
              on: group.findControl(BlockTriggerFields.onTypes)
                  as FormControl<List<String>>,
            );
          case BlockTriggerFields.onTags:
            if (trigger.any) return Container();
            return _BlockTriggerOnList(
              type: 'tag',
              resolver: () async {
                final tags = await ref.read(flowManagerProvider).getTokens();
                return Future.value(
                  Map.fromEntries(
                    tags.map(
                      (e) => MapEntry(
                        e.name,
                        e.name.toCapitalised(),
                      ),
                    ),
                  ),
                );
              },
              on: group.findControl(BlockTriggerFields.onTags)
                  as FormControl<List<String>>,
            );
          case BlockTriggerFields.repeatCount:
            return SmartDashTextField<int>(
              allowEmpty: false,
              labelText: 'Repeat number of times',
              formPath: const [BlockFields.trigger],
              formControlName: BlockTriggerFields.repeatCount,
              valueAccessor: DefaultIntValueAccessor(0),
              validationMessages: {
                ValidationMessage.number: (_) => 'Please enter a number',
                ValidationMessage.required: (_) => 'Please enter a value',
              },
            );
          case BlockTriggerFields.repeatAfter:
            return SmartDashTextField<int>(
              allowEmpty: false,
              labelText: 'Repeat after (in seconds)',
              formPath: const [BlockFields.trigger],
              formControlName: BlockTriggerFields.repeatAfter,
              valueAccessor: DefaultIntValueAccessor(0),
              validationMessages: {
                ValidationMessage.number: (_) => 'Please enter a number',
                ValidationMessage.required: (_) => 'Please enter a value',
              },
            );
          case BlockTriggerFields.debounceCount:
            return SmartDashTextField<int>(
              allowEmpty: false,
              labelText: 'Skip number of times',
              formPath: const [BlockFields.trigger],
              formControlName: BlockTriggerFields.debounceCount,
              valueAccessor: DefaultIntValueAccessor(0),
              validationMessages: {
                ValidationMessage.number: (_) => 'Please enter a number',
                ValidationMessage.required: (_) => 'Please enter a value',
              },
            );
          case BlockTriggerFields.debounceAfter:
            return SmartDashTextField<int>(
              allowEmpty: false,
              labelText: 'Skip until (in seconds)',
              formPath: const [BlockFields.trigger],
              formControlName: BlockTriggerFields.debounceAfter,
              valueAccessor: DefaultIntValueAccessor(0),
              validationMessages: {
                ValidationMessage.number: (_) => 'Please enter a number',
                ValidationMessage.required: (_) => 'Please enter a value',
              },
            );
        }
        return Text(name);
      },
    );
  }
}

class _BlockTriggerOnList extends ConsumerWidget {
  const _BlockTriggerOnList({
    required this.on,
    required this.type,
    required this.resolver,
  });

  final String type;
  final FormControl<List<String>> on;
  final AsyncValueGetter<Map<String, String>> resolver;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = _toTextStyle(context);
    final items = on.value ?? <String>[];
    return SmartDashExpansionList(
      title: Text('Trigger on ${type.toCapitalised()}s'),
      description: Text(
        'Click to manage ${type}s to trigger on',
        style: getLegendTextStyle(context),
      ),
      dense: true,
      trailing: Icons.add,
      onPressed: () async {
        final values = await resolver();
        if (!context.mounted) return;

        if (values.isEmpty) {
          showAlertDialog(
            context,
            title: 'Not available',
            message: 'All types are added',
          );
          return;
        }

        // TODO: Implement Tag lookup from Tokens
        final name = await showSelectInputDialog<String>(
          context,
          title: 'Add ${type.toCapitalised()}',
          hint: 'Choose...',
          items: values,
        );
        if (name != null) {
          final items = on.value?.toList(growable: true) ?? <String>[];
          items.add(name.toString());
          on.value = items.toSet().toList();
        }
      },
      children: items.map((value) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Chip(
              elevation: 8.0,
              padding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
              label: Text(value, style: style),
              backgroundColor: Colors.brown.lighten(0.1),
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                final delete = await showPromptDialog(
                  context,
                  title: 'Delete ${type.toCapitalised()} [$value]',
                );
                if (delete == true) {
                  final items = on.value?.toList(growable: true) ?? <String>[];
                  final index = items.indexOf(value);
                  if (index >= 0) {
                    items.removeAt(index);
                    on.value = items;
                  }
                }
              },
            )
          ],
        );
      }).toList(),
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
