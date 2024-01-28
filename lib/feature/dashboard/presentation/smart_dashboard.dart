import 'dart:async';

import 'package:dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:smart_dash/core/presentation/widget/responsive_widget.dart';

import 'package:smart_dash/util/data/json.dart';

typedef DashboardItemSlotBuilder<T extends DashboardItem> = Widget Function(
    ResponsiveType type, int slotCount, T item);

class SmartDashboard extends StatefulWidget {
  const SmartDashboard({
    super.key,
    required this.storage,
    required this.slotHeight,
    required this.itemBuilder,
    this.cacheSlotCount = 10,
  });

  final double slotHeight;
  final int cacheSlotCount;
  final SmartDashboardItemStorage storage;
  final DashboardItemSlotBuilder itemBuilder;

  @override
  State<SmartDashboard> createState() => _SmartDashboardState();
}

class _SmartDashboardState extends State<SmartDashboard> {
  late DashboardItemController itemController;

  final key = GlobalKey();

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    itemController = DashboardItemController.withDelegate(
      itemStorageDelegate: widget.storage,
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
      mobile: _build(
        ResponsiveType.mobile,
        widget.storage.mobileSlotCount,
      ),
      tablet: widget.storage.tablet.isNotEmpty
          ? _build(
              ResponsiveType.tablet,
              widget.storage.tabletSlotCount,
            )
          : null,
      desktop: _build(
        ResponsiveType.desktop,
        widget.storage.desktopSlotCount,
      ),
      mobileLarge: widget.storage.mobileLarge.isNotEmpty
          ? _build(
              ResponsiveType.mobileLarge,
              widget.storage.mobileLargeSlotCount,
            )
          : null,
    );
  }

  Dashboard<DashboardItem> _build(ResponsiveType type, int slotCount) {
    return Dashboard(
      key: key,
      slideToTop: false,
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
      cacheExtend: widget.slotHeight * widget.cacheSlotCount,
      itemBuilder: (item) => widget.itemBuilder(type, slotCount, item),
      dashboardItemController: itemController,
      errorPlaceholder: (e, s) => Text("$e , $s"),
    );
  }
}

class SmartDashboardItemStorage extends DashboardItemStorageDelegate {
  SmartDashboardItemStorage({
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

  JsonObject toJson() {
    return {
      'mobile': _toMap(mobileSlotCount, mobile),
      'tablet': _toMap(tabletSlotCount, tablet),
      'desktop': _toMap(desktopSlotCount, desktop),
      'mobileLarge': _toMap(mobileLargeSlotCount, mobileLarge),
    };
  }

  Map<String, Object> _toMap(int slotCount, List<DashboardItem> items) {
    return {
      'slotsCount': slotCount,
      'items': items.map((e) => e.toMap()).toList(),
    };
  }

  @override
  FutureOr<List<DashboardItem>> getAllItems(int slotCount) async {
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
