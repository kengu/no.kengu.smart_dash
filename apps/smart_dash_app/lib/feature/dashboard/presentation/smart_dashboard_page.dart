import 'package:dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_dash_app/core/presentation/scaffold/fullscreen_state.dart';
import 'package:smart_dash_app/core/presentation/widget/responsive_widget.dart';
import 'package:smart_dash_app/core/presentation/widget/smart_dash_error_widget.dart';
import 'package:smart_dash_app/core/presentation/widget/smart_dash_progress_indicator.dart';
import 'package:smart_dash_app/feature/dashboard/data/dashboard_repository.dart';
import 'package:smart_dash_app/feature/dashboard/domain/dashboard.dart' as m;
import 'package:smart_dash_app/feature/dashboard/presentation/smart_dash_header.dart';
import 'package:smart_dash_app/feature/dashboard/presentation/smart_dashboard.dart';

typedef DashboardPageItemBuilder<T extends DashboardItem> = Widget Function(
    m.Dashboard dashboard, ResponsiveType type, int slotCount, T item);

class SmartDashboardPage extends ConsumerWidget {
  const SmartDashboardPage({
    super.key,
    required this.name,
    required this.title,
    required this.pageItemBuilder,
    this.cacheSlotCount = 10,
  });

  final String name;
  final String title;
  final int cacheSlotCount;
  final DashboardPageItemBuilder pageItemBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFullscreen = FullscreenState.watch(ref);
    final withHeader = !isFullscreen;
    return ref.watch(dashboardRepositoryProvider).when(
          error: SmartDashErrorWidget.from,
          loading: SmartDashProgressIndicator.new,
          data: (dashboards) {
            final page = dashboards[name] as m.Dashboard;
            final storage = SmartDashboardItemStorage(
              cacheItems: true,
              mobileSlotCount: page.mobileSlotCount,
              tabletSlotCount: page.tabletSlotCount,
              desktopSlotCount: page.desktopSlotCount,
              mobileLargeSlotCount: page.mobileLargeSlotCount,
              mobile: page.mobile.items
                  .map((e) => e.toJson())
                  .map((e) => DashboardItem.fromMap(e))
                  .toList(),
              tablet: page.tablet.items
                  .map((e) => e.toJson())
                  .map((e) => DashboardItem.fromMap(e))
                  .toList(),
              desktop: page.desktop.items
                  .map((e) => e.toJson())
                  .map((e) => DashboardItem.fromMap(e))
                  .toList(),
              mobileLarge: page.mobileLarge.items
                  .map((e) => e.toJson())
                  .map((e) => DashboardItem.fromMap(e))
                  .toList(),
            );
            return Padding(
              padding: withHeader
                  ? const EdgeInsets.all(24.0).copyWith(bottom: 0.0)
                  : const EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  if (withHeader) SmartDashHeader(title: title),
                  Padding(
                    padding: withHeader
                        ? const EdgeInsets.only(top: 56.0)
                        : const EdgeInsets.only(top: 0.0),
                    child: SmartDashboard(
                      storage: storage,
                      slotHeight: (slotCount) => page.getSlotHeight(slotCount),
                      itemBuilder: (type, slotCount, item) => pageItemBuilder(
                        page,
                        type,
                        slotCount,
                        item,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
  }
}
