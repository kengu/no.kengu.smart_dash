import 'dart:async';

import 'package:dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:smart_dash/widget/responsive_widget.dart';

class SmartDashboard extends StatefulWidget {
  const SmartDashboard({
    super.key,
    required this.slotHeight,
    required this.itemBuilder,
    required this.mobile,
    required this.desktop,
    required this.mobileSlotCount,
    required this.desktopSlotCount,
    this.tablet = const [],
    this.mobileLarge = const [],
    this.tabletSlotCount = 0,
    this.mobileLargeSlotCount = 0,
  });

  final double slotHeight;
  final int mobileSlotCount;
  final int desktopSlotCount;
  final int tabletSlotCount;
  final int mobileLargeSlotCount;
  final List<DashboardItem> mobile;
  final List<DashboardItem> desktop;
  final List<DashboardItem> tablet;
  final List<DashboardItem> mobileLarge;
  final DashboardItemBuilder itemBuilder;

  @override
  State<SmartDashboard> createState() => _SmartDashboardState();
}

class _SmartDashboardState extends State<SmartDashboard> {
  late DashboardItemController itemController;

  final key = GlobalKey();

  final scrollController = ScrollController();

  bool isDesktop = true;

  @override
  void initState() {
    super.initState();
    itemController = DashboardItemController.withDelegate(
      itemStorageDelegate: _SmartDashboardItemStorage(
        mobile: widget.mobile,
        tablet: widget.tablet,
        desktop: widget.desktop,
        mobileLarge: widget.mobileLarge,
        tabletSlotCount: widget.tabletSlotCount,
        mobileSlotCount: widget.mobileSlotCount,
        desktopSlotCount: widget.desktopSlotCount,
        mobileLargeSlotCount: widget.mobileLargeSlotCount,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    itemController.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: _build(widget.mobileSlotCount),
      tablet: widget.tablet.isEmpty ? null : _build(widget.tabletSlotCount),
      desktop: _build(widget.desktopSlotCount),
      mobileLarge: widget.mobileLarge.isEmpty
          ? null
          : _build(widget.mobileLargeSlotCount),
    );
  }

  Dashboard<DashboardItem> _build(int slotCount) {
    final current = isDesktop;
    final dashboard = Dashboard(
      key: key,
      slideToTop: true,
      shrinkToPlace: true,
      absorbPointer: false,
      animateEverytime: true,
      verticalSpace: 16,
      horizontalSpace: 16,
      slotCount: slotCount,
      scrollController: scrollController,
      physics: const RangeMaintainingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      slotHeight: widget.slotHeight,
      itemBuilder: widget.itemBuilder,
      dashboardItemController: itemController,
      errorPlaceholder: (e, s) => Text("$e , $s"),
    );
    isDesktop = slotCount == widget.desktopSlotCount;
    if (isDesktop != current &&
        scrollController.hasClients &&
        scrollController.position.hasContentDimensions) {
      scrollController.jumpTo(0);
    }
    return dashboard;
  }
}

class _SmartDashboardItemStorage extends DashboardItemStorageDelegate {
  _SmartDashboardItemStorage({
    required this.mobile,
    required this.desktop,
    required this.mobileSlotCount,
    required this.desktopSlotCount,
    this.tablet = const [],
    this.mobileLarge = const [],
    this.tabletSlotCount = 0,
    this.mobileLargeSlotCount = 0,
  });

  final int mobileSlotCount;
  final int desktopSlotCount;
  final int tabletSlotCount;
  final int mobileLargeSlotCount;
  final List<DashboardItem> mobile;
  final List<DashboardItem> desktop;
  final List<DashboardItem> tablet;
  final List<DashboardItem> mobileLarge;

  @override
  bool get cacheItems => true;

  @override
  bool get layoutsBySlotCount => true;

  @override
  FutureOr<List<DashboardItem>> getAllItems(int slotCount) {
    if (mobileSlotCount == slotCount) {
      return mobile;
    } else if (mobileLargeSlotCount == slotCount) {
      return mobileLarge;
    } else if (tabletSlotCount == slotCount) {
      return tablet;
    } else if (desktopSlotCount == slotCount) {
      return desktop;
    }
    throw StateError('slotCount $slotCount not found');
  }

  @override
  FutureOr<void> onItemsAdded(List<DashboardItem> items, int slotCount) {}

  @override
  FutureOr<void> onItemsDeleted(List<DashboardItem> items, int slotCount) {}

  @override
  FutureOr<void> onItemsUpdated(List<DashboardItem> items, int slotCount) {}
}
