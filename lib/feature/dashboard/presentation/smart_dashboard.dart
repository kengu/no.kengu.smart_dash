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

  final scrollController = ScrollController();

  @override
  void initState() {
    itemController = DashboardItemController.withDelegate(
      itemStorageDelegate: widget.storage,
    );
    super.initState();
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
      slideToTop: false,
      shrinkToPlace: true,
      absorbPointer: false,
      animateEverytime: true,
      verticalSpace: 16,
      horizontalSpace: 16,
      slotCount: slotCount,
      scrollController: scrollController,
      dashboardItemController: itemController,
      physics: const RangeMaintainingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      slotHeight: widget.slotHeight,
      errorPlaceholder: (e, s) => Text("$e , $s"),
      cacheExtend: widget.slotHeight * widget.cacheSlotCount,
      itemBuilder: (item) => widget.itemBuilder(type, slotCount, item),
    );
  }
}

class SmartDashboardItemStorage extends DashboardItemStorageDelegate {
  SmartDashboardItemStorage({
    required this.mobileSlotCount,
    required this.desktopSlotCount,
    bool cacheItems = false,
    this.tabletSlotCount = 0,
    this.mobileLargeSlotCount = 0,
    List<DashboardItem> mobile = const [],
    List<DashboardItem> desktop = const [],
    List<DashboardItem> tablet = const [],
    List<DashboardItem> mobileLarge = const [],
    this.itemBuilder,
  })  : _slots = {
          mobileSlotCount: _SmartDashboardItemStorageSlot(
            slotCount: mobileSlotCount,
            items: mobile.toList(),
          ),
          desktopSlotCount: _SmartDashboardItemStorageSlot(
            slotCount: desktopSlotCount,
            items: desktop.toList(),
          ),
          if (tabletSlotCount > 0)
            tabletSlotCount: _SmartDashboardItemStorageSlot(
              slotCount: tabletSlotCount,
              items: tablet.toList(),
            ),
          if (mobileLargeSlotCount > 0)
            mobileLargeSlotCount: _SmartDashboardItemStorageSlot(
              slotCount: mobileLargeSlotCount,
              items: mobileLarge.toList(),
            ),
        },
        _cacheItems = cacheItems {
    // Sanity checks
    assert(mobileSlotCount > 0, 'mobileSlotCount > 0 is required');
    assert(desktopSlotCount > 0, 'desktopSlotCount > 0 is required');
    assert(
      itemBuilder == null || cacheItems == false && itemBuilder != null,
      'itemBuilder requires no caching',
    );
  }

  final bool _cacheItems;

  final int mobileSlotCount;
  final int desktopSlotCount;
  final int tabletSlotCount;
  final int mobileLargeSlotCount;
  final Map<int, _SmartDashboardItemStorageSlot> _slots;

  final Future<List<DashboardItem>> Function(int slotCount)? itemBuilder;

  @override
  bool get cacheItems => _cacheItems;

  @override
  bool get layoutsBySlotCount => true;

  List<DashboardItem> get mobile => _slots[mobileSlotCount]!.items.toList();
  List<DashboardItem> get desktop => _slots[desktopSlotCount]!.items.toList();
  List<DashboardItem> get tablet =>
      _slots[tabletSlotCount]?.items.toList() ?? const <DashboardItem>[];
  List<DashboardItem> get mobileLarge =>
      _slots[mobileLargeSlotCount]?.items.toList() ?? const <DashboardItem>[];

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
    final slot = _slots[slotCount];
    assert(slot != null, 'Items for slotCount $slotCount not found');
    final items = slot!.items;
    if (itemBuilder != null) {
      items.clear();
      items.addAll(await itemBuilder!(slotCount));
    }
    return List.unmodifiable(items);
  }

  @override
  FutureOr<void> onItemsAdded(List<DashboardItem> items, int slotCount) {
    final slot = _slots[slotCount];
    assert(slot != null, 'Items for slotCount $slotCount not found');
    slot!.items.addAll(items);
  }

  @override
  FutureOr<void> onItemsDeleted(List<DashboardItem> items, int slotCount) {
    final slot = _slots[slotCount];
    assert(slot != null, 'Items for slotCount $slotCount not found');
    for (final it in items) {
      slot!.items.remove(it);
    }
  }

  @override
  FutureOr<void> onItemsUpdated(List<DashboardItem> items, int slotCount) {
    final slot = _slots[slotCount];
    assert(slot != null, 'Items for slotCount $slotCount not found');
    for (final it in items) {
      final index =
          slot!.items.indexWhere((e) => e.identifier == it.identifier);
      if (index > -1) slot.items[index] = it;
    }
  }
}

class _SmartDashboardItemStorageSlot {
  _SmartDashboardItemStorageSlot({
    required this.slotCount,
    required this.items,
  });
  final int slotCount;
  final List<DashboardItem> items;
}
