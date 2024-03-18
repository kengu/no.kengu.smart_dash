import 'package:flutter/material.dart';
import 'package:smart_dash/feature/flow/domain/block.dart';

class FlowSummary extends StatelessWidget {
  const FlowSummary({super.key, required this.model});

  final BlockModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Active: ${model.enabled}'),
        Text('Value: ${model.state.value}'),
        Text('Evaluated: ${model.state.repeated}'),
        Text(
          'Parameters: '
          '[${model.parameters.map((e) => '${e.name} = ${e.value}').join(',')}]',
        ),
        Text(
          'Conditions: '
          '[${model.conditions.map((e) => e.expression).join(',')}]',
        ),
        Text('Triggers on any: ${model.trigger.any}'),
        Text(
          'Triggers on types: '
          '[${model.trigger.onTypes.map((e) => e.name).join(',')}]',
        ),
        Text(
          'Triggers on tags: '
          '[${model.trigger.onTags.map((e) => e).join(',')}]',
        ),
        Text(
          'When True: '
          '[${model.whenTrue.map((e) => e.label).join(',')}]',
        ),
        Text(
          'When False: '
          '[${model.whenFalse.map((e) => e.label).join(',')}]',
        ),
      ],
    );
  }
}
