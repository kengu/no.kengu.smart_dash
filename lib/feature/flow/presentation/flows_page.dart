import 'package:dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/core/presentation/scaffold/fullscreen_state.dart';
import 'package:smart_dash/core/presentation/widget/responsive_widget.dart';
import 'package:smart_dash/core/presentation/widget/smart_dash_error_widget.dart';
import 'package:smart_dash/core/presentation/widget/smart_dash_progress_indicator.dart';
import 'package:smart_dash/feature/dashboard/presentation/smart_dash_header.dart';
import 'package:smart_dash/feature/dashboard/presentation/smart_dashboard.dart';
import 'package:smart_dash/feature/flow/domain/block.dart';
import 'package:smart_dash/feature/flow/presentation/flow_card.dart';
import 'package:smart_dash/feature/flow/presentation/flows_controller.dart';

class FlowsPage extends ConsumerStatefulWidget {
  const FlowsPage({super.key});

  @override
  ConsumerState<FlowsPage> createState() => _CameraPageState();
}

class _CameraPageState extends ConsumerState<FlowsPage> {
  bool get isFullscreen => FullscreenState.watch(ref);

  static const query = FlowsQuery();

  @override
  Widget build(BuildContext context) {
    return ref.watch(flowsControllerProvider(query)).when(
          data: (data) {
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
                      slotHeight: 250,
                      storage: SmartDashboardItemStorage(
                        mobile: _items(data),
                        tablet: _items(data),
                        desktop: _items(data),
                        mobileSlotCount: 1,
                        tabletSlotCount: 2,
                        desktopSlotCount: 3,
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
          },
          error: SmartDashErrorWidget.from,
          loading: SmartDashProgressIndicator.new,
        );
  }

  List<DashboardItem> _items(
    Optional<List<BlockModel>> models,
  ) {
    return [
      if (models.isPresent)
        ...models.value.map(
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
