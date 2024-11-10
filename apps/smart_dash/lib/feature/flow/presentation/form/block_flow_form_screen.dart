import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:smart_dash/core/presentation/dialog.dart';
import 'package:smart_dash/core/presentation/widget/form/async_form_screen.dart';
import 'package:smart_dash/core/presentation/widget/form/field/smart_dash_switch_field.dart';
import 'package:smart_dash/core/presentation/widget/form/field/smart_dash_text_field.dart';
import 'package:smart_dash/core/presentation/widget/smart_dash_error_widget.dart';
import 'package:smart_dash/core/presentation/widget/smart_dash_progress_indicator.dart';
import 'package:smart_dash/core/presentation/widget/snackbar/snackbar_controller.dart';
import 'package:smart_dash/feature/flow/presentation/flow_summary.dart';
import 'package:smart_dash/feature/flow/presentation/form/fields/block_action_array_field.dart';
import 'package:smart_dash/feature/flow/presentation/form/fields/block_conditions_array_field.dart';
import 'package:smart_dash/feature/flow/presentation/form/fields/block_parameters_array_field.dart';
import 'package:smart_dash/feature/flow/presentation/form/fields/block_trigger_form_group.dart';
import 'package:smart_dash_account/smart_dash_account_app.dart';
import 'package:smart_dash_flow/smart_dash_flow.dart';

import 'block_flow_form_controller.dart';

class BlockFlowFormScreen extends ConsumerWidget {
  const BlockFlowFormScreen({
    super.key,
    required this.location,
    this.id,
    this.copy = false,
  });

  final String? id;
  final bool copy;
  final String location;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getCurrentHomeProvider()).when(
          data: (currentHome) {
            return AsyncFormScreen<BlockFlowFormQuery, BlockModel,
                BlockFlowFormController>(
              title: '${id == null || copy ? 'New' : 'Edit'} Flow',
              scrollable: true,
              submitText: id == null ? 'CREATE' : 'SAVE',
              query: BlockFlowFormQuery(id: id, copy: copy),
              provider: blockFlowFormControllerProvider.call,
              onClose: () => context.go(location),
              onSubmitted: (data) => SnackbarController.showSnackBarByRef(
                context,
                ref,
                'Saved ${jsonEncode(data.label)}',
                location: location,
              ),
              child: ReactiveFormConsumer(
                builder: (context, group, child) {
                  final block = BlockModel.fromJson(group.value);
                  return Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        SmartDashTextField<String>(
                          labelText: 'Name',
                          formControlName: BlockFields.label,
                          validationMessages: {
                            ValidationMessage.required: (_) =>
                                'Please enter flow name',
                          },
                        ),
                        const SizedBox(height: 16.0),
                        SmartDashTextField<String>(
                          labelText: 'Description',
                          formControlName: BlockFields.description,
                          validationMessages: {
                            ValidationMessage.required: (_) =>
                                'Please enter flow description',
                          },
                        ),
                        const SizedBox(height: 16.0),
                        const SmartDashSwitchField(
                          icon: Icon(Icons.power_settings_new),
                          title: 'Control',
                          description: 'Turn flow on/off',
                          formControlName: BlockFields.enabled,
                        ),
                        BlockTriggerFormGroup(
                          group: group.control(
                            BlockFields.trigger,
                          ) as FormGroup,
                        ),
                        const BlockParametersArrayField(),
                        const BlockConditionsArrayField(),
                        const BlockActionsArrayField(
                          title: 'When Active',
                          formArrayName: BlockFields.whenTrue,
                        ),
                        const BlockActionsArrayField(
                          title: 'When Inactive',
                          formArrayName: BlockFields.whenFalse,
                        ),
                        const Divider(),
                        InputDecorator(
                          decoration: const InputDecoration(
                            label: Text('Flow Is'),
                            border: InputBorder.none,
                          ),
                          child: FlowSummary(
                            model: block,
                            enabled: block.enabled,
                            contentPadding: const EdgeInsets.all(16.0),
                          ),
                        ),
                        if (id != null) ...[
                          const Divider(),
                          InputDecorator(
                            decoration: const InputDecoration(
                              label: Text(
                                'Danger Zone',
                                style: TextStyle(color: Colors.red),
                              ),
                              border: InputBorder.none,
                            ),
                            child: Row(
                              children: [
                                const Expanded(
                                  child: Text(
                                    'Delete flow from home',
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () async {
                                    final delete = await showPromptDialog(
                                      context,
                                      title: 'Delete ${block.label}',
                                    );
                                    if (delete == true) {
                                      await ref
                                          .read(blockManagerProvider)
                                          .delete(block.id);
                                      if (context.mounted) {
                                        context.go(location);
                                      }
                                    }
                                  },
                                )
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  );
                },
              ),
            );
          },
          error: SmartDashErrorWidget.from,
          loading: SmartDashProgressIndicator.new,
        );
  }
}
