import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/feature/device/domain/device.dart';

part 'dashboard.freezed.dart';
part 'dashboard.g.dart';

typedef DashboardMap = Map<String, Dashboard>;

@freezed
class Dashboard with _$Dashboard {
  const Dashboard._();

  const factory Dashboard({
    required String key,
    required String title,
    required List<Token> tokens,
    required List<Identity> ids,
    required DashboardLayout mobile,
    required DashboardLayout tablet,
    required DashboardLayout desktop,
    required DashboardLayout mobileLarge,
  }) = _Dashboard;

  int get mobileSlotCount => mobile.slotCount;
  int get tabletSlotCount => tablet.slotCount;
  int get desktopSlotCount => desktop.slotCount;
  int get mobileLargeSlotCount => mobileLarge.slotCount;

  List<DashboardLayout> get layouts => [mobile, mobileLarge, tablet, desktop];

  Optional<Identity> getIdentity(String id) {
    return ids.firstWhereOptional(
      (e) => e.id == id,
    );
  }

  Optional<Token> getToken(String name) {
    return tokens.firstWhereOptional(
      (e) => e.name == name,
    );
  }

  double getSlotHeight(int slotCount, [double useDefault = 280]) {
    final found = layouts.firstWhereOptional((e) => e.slotCount == slotCount);
    return found.isPresent ? found.value.slotHeight : useDefault;
  }

  Optional<DashboardLayout> getLayout(int slotCount) {
    return layouts.firstWhereOptional((e) => e.slotCount == slotCount);
  }

  factory Dashboard.fromJson(Map<String, Object?> json) =>
      _$DashboardFromJson(json);
}

@freezed
class DashboardLayout with _$DashboardLayout {
  const factory DashboardLayout({
    @JsonKey(name: 'slotCount') required int slotCount,
    @JsonKey(name: 'slotHeight') required double slotHeight,
    @JsonKey(name: 'items') required List<DashboardItem> items,
  }) = _DashboardLayout;

  factory DashboardLayout.fromJson(Map<String, Object?> json) =>
      _$DashboardLayoutFromJson(json);
}

@freezed
class DashboardItem with _$DashboardItem {
  const factory DashboardItem({
    @JsonKey(name: 'item_id') required String key,
    @JsonKey(name: 'layout') required DashboardItemLayout layout,
  }) = _DashboardItem;

  factory DashboardItem.fromJson(Map<String, Object?> json) =>
      _$DashboardItemFromJson(json);
}

@freezed
class DashboardItemLayout with _$DashboardItemLayout {
  const factory DashboardItemLayout({
    @JsonKey(name: 'w') required int width,
    @JsonKey(name: 'h') required int height,
    @JsonKey(name: 'min_W') required int minWidth,
    @JsonKey(name: 'min_H') required int minHeight,
    @JsonKey(name: 'max_W') int? maxWidth,
    @JsonKey(name: 'max_H') int? maxHeight,
    @JsonKey(name: 's_X') int? startX,
    @JsonKey(name: 's_Y') int? startY,

    /*
          {int? startX,
      int? startY,
      required int width,
      required int height,
      int minWidth = 1,
      int minHeight = 1,
      int? maxHeight,
      int? maxWidth,


     */
  }) = _DashboardItemLayout;

  factory DashboardItemLayout.fromJson(Map<String, Object?> json) =>
      _$DashboardItemLayoutFromJson(json);
}
