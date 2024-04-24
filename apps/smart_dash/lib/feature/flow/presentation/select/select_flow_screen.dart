import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_dash/core/presentation/widget/list/route_selector.dart';
import 'package:smart_dash/core/presentation/widget/load/async_load_screen.dart';
import 'package:smart_dash/feature/flow/presentation/flow_routes.dart';
import 'package:smart_dash/feature/flow/presentation/flows_controller.dart';
import 'package:smart_dash_flow/smart_dash_flow.dart';

class SelectFlowScreen extends ConsumerWidget {
  const SelectFlowScreen({
    super.key,
    required this.location,
  });

  final String location;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncLoadScreen<FlowsQuery, List<BlockModel>, FlowsController>(
      title: 'Flows',
      onClose: () => context.go(location),
      query: const FlowsQuery(),
      provider: flowsControllerProvider.call,
      builder: (context, ref, blocks, child) {
        return Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Select a flow for details'),
              ),
            ),
            const Divider(),
            Expanded(
              flex: 1,
              child: RouteSelectorList<BlockModel>(
                pathBuilder: FlowRoutes.toDetails,
                entries: blocks.isPresent ? blocks.value : [],
                titleBuilder: (_, block, __) => Text(block.label),
                iconBuilder: (_, block, __) => const Icon(Icons.lightbulb),
              ),
            ),
          ],
        );
      },
    );
  }
}
