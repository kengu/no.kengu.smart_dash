import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_dash/core/presentation/smart_dash_icons_icons.dart';
import 'package:smart_dash/core/presentation/theme/smart_dash_theme_data.dart';
import 'package:smart_dash/core/presentation/widget/circle_blip.dart';
import 'package:smart_dash/core/presentation/widget/smart_dash_error_widget.dart';
import 'package:smart_dash/core/presentation/widget/smart_dash_progress_indicator.dart';
import 'package:smart_dash/feature/flow/application/flow_manager.dart';
import 'package:smart_dash/feature/flow/presentation/flow_routes.dart';
import 'package:smart_dash/feature/flow/presentation/flow_summary.dart';

class FlowCard extends ConsumerWidget {
  FlowCard({
    super.key,
    required this.id,
  }) : query = BlockFlowQuery(id: id);

  final String id;
  final BlockFlowQuery query;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(blockModelFlowProvider(query)).when(
          data: (model) {
            return Card(
              elevation: 8,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: CircleBlip(
                        debounce: 1,
                        enabled: true,
                        child: FlowSummary(
                          model: model,
                          enabled: model.enabled,
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    clipBehavior: Clip.hardEdge,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    child: Material(
                      elevation: 8.0,
                      color: Theme.of(context)
                          .scaffoldBackgroundColor
                          .lighten(0.05),
                      child: ListTile(
                        enabled: model.enabled,
                        title: Text(model.label),
                        leading: const Icon(SmartDashIcons.process_outlined),
                        contentPadding:
                            const EdgeInsets.only(left: 16, right: 8.0),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.copy),
                              onPressed: () {
                                context.go(
                                  FlowRoutes.toCopy(model),
                                );
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                context.go(
                                  FlowRoutes.toDetails(model),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          error: SmartDashErrorWidget.from,
          loading: SmartDashProgressIndicator.new,
        );
  }
}
