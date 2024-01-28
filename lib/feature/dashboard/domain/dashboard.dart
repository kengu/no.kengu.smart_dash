import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/feature/flow/domain/token.dart';

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
    required int mobileSlotCount,
    required int tabletSlotCount,
    required int desktopSlotCount,
    required int mobileLargeSlotCount,
    required List<DashboardItem> mobile,
    required List<DashboardItem> tablet,
    required List<DashboardItem> desktop,
    required List<DashboardItem> mobileLarge,
  }) = _Dashboard;

  Optional<Token> get(String name) {
    return tokens.firstWhereOptional(
      (e) => e.name == name,
    );
  }

  factory Dashboard.fromJson(Map<String, Object?> json) =>
      _$DashboardFromJson(json);
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
