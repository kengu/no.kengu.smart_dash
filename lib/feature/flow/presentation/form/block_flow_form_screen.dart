import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:smart_dash/core/presentation/widget/form/async_form_screen.dart';
import 'package:smart_dash/core/presentation/widget/form/field/smart_dash_switch_field.dart';
import 'package:smart_dash/core/presentation/widget/form/field/smart_dash_text_field.dart';
import 'package:smart_dash/core/presentation/widget/smart_dash_error_widget.dart';
import 'package:smart_dash/core/presentation/widget/smart_dash_progress_indicator.dart';
import 'package:smart_dash/core/presentation/widget/snackbar/snackbar_controller.dart';
import 'package:smart_dash/feature/flow/domain/block.dart';
import 'package:smart_dash/feature/flow/presentation/form/fields/block_action_array_field.dart';
import 'package:smart_dash/feature/flow/presentation/form/fields/block_conditions_array_field.dart';
import 'package:smart_dash/feature/flow/presentation/form/fields/block_parameters_array_field.dart';
import 'package:smart_dash/feature/flow/presentation/form/fields/block_trigger_form_group.dart';
import 'package:smart_dash/feature/home/application/home_service.dart';

import 'block_flow_form_controller.dart';

class BlockFlowFormScreen extends ConsumerWidget {
  const BlockFlowFormScreen({
    super.key,
    required this.id,
    required this.location,
  });

  final String id;
  final String location;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getCurrentHomeProvider()).when(
          data: (currentHome) {
            return AsyncFormScreen<BlockFlowFormQuery, BlockModel,
                BlockFlowFormController>(
              title: 'Edit Flow',
              scrollable: true,
              query: BlockFlowFormQuery(id: id),
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
                          child: Text(
                            '${block.state.value ? 'Active' : 'Inactive'} '
                            '(${block.state.repeated} evaluations)',
                            textScaler: const TextScaler.linear(
                              1.2,
                            ),
                          ),
                        ),
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
