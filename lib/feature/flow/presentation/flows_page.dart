import 'package:dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_dash/core/presentation/scaffold/fullscreen_state.dart';
import 'package:smart_dash/core/presentation/widget/responsive_widget.dart';
import 'package:smart_dash/feature/dashboard/presentation/smart_dash_header.dart';
import 'package:smart_dash/feature/dashboard/presentation/smart_dashboard.dart';
import 'package:smart_dash/feature/flow/application/block_flow.dart';
import 'package:smart_dash/feature/flow/application/flow_manager.dart';
import 'package:smart_dash/feature/flow/data/block_repository.dart';
import 'package:smart_dash/feature/flow/domain/block.dart';
import 'package:smart_dash/feature/flow/presentation/flow_card.dart';

class FlowsPage extends ConsumerStatefulWidget {
  const FlowsPage({super.key});

  @override
  ConsumerState<FlowsPage> createState() => _CameraPageState();
}

class _CameraPageState extends ConsumerState<FlowsPage> {
  bool get isFullscreen => FullscreenState.watch(ref);

  @override
  Widget build(BuildContext context) {
    final manager = ref.read(flowManagerProvider);
    final repo = ref.read(blockRepositoryProvider);
    return StreamBuilder(
        stream: manager.events.where(
          (e) => e is BlockAddedEvent || e is BlockDeletedEvent,
        ),
        builder: (context, _) {
          return Padding(
            padding: !isFullscreen
                ? const EdgeInsets.all(24.0).copyWith(bottom: 0.0)
                : const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                if (!isFullscreen)
                  const SmartDashHeader(
                    title: 'Flows',
                  ),
                Padding(
                  padding: !isFullscreen
                      ? const EdgeInsets.only(top: 56.0)
                      : const EdgeInsets.only(top: 0.0),
                  child: SmartDashboard(
                    slotHeight: 380,
                    storage: SmartDashboardItemStorage(
                      mobileSlotCount: 1,
                      tabletSlotCount: 2,
                      desktopSlotCount: 3,
                      itemBuilder: (slotCount) async => _items(
                        await repo.getAll(),
                      ),
                    ),
                    itemBuilder: (type, slotsCount, item) {
                      switch (item.identifier) {}
                      return FlowCard(id: item.identifier);
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }

  List<DashboardItem> _items(
    List<BlockModel> models,
  ) {
    return [
      ...models.map(
        (e) => switch (ResponsiveWidget.toType(context)) {
          ResponsiveType.mobile => DashboardItem(
              width: 1,
              height: 1,
              identifier: e.id,
            ),
          ResponsiveType.mobileLarge => DashboardItem(
              width: 1,
              height: 1,
              identifier: e.id,
            ),
          ResponsiveType.tablet => DashboardItem(
              width: 1,
              height: 1,
              identifier: e.id,
            ),
          ResponsiveType.desktop => DashboardItem(
              width: 1,
              height: 1,
              identifier: e.id,
            ),
        },
      ),
    ];
  }
}
