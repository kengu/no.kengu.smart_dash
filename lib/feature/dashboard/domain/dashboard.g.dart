// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardImpl _$$DashboardImplFromJson(Map<String, dynamic> json) =>
    _$DashboardImpl(
      key: json['key'] as String,
      title: json['title'] as String,
      tokens: (json['tokens'] as List<dynamic>)
          .map((e) => Token.fromJson(e as Map<String, dynamic>))
          .toList(),
      ids: (json['ids'] as List<dynamic>)
          .map((e) => Identity.fromJson(e as Map<String, dynamic>))
          .toList(),
      mobileSlotCount: json['mobileSlotCount'] as int,
      tabletSlotCount: json['tabletSlotCount'] as int,
      desktopSlotCount: json['desktopSlotCount'] as int,
      mobileLargeSlotCount: json['mobileLargeSlotCount'] as int,
      mobile: (json['mobile'] as List<dynamic>)
          .map((e) => DashboardItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      tablet: (json['tablet'] as List<dynamic>)
          .map((e) => DashboardItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      desktop: (json['desktop'] as List<dynamic>)
          .map((e) => DashboardItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      mobileLarge: (json['mobileLarge'] as List<dynamic>)
          .map((e) => DashboardItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DashboardImplToJson(_$DashboardImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'title': instance.title,
      'tokens': instance.tokens.map((e) => e.toJson()).toList(),
      'ids': instance.ids.map((e) => e.toJson()).toList(),
      'mobileSlotCount': instance.mobileSlotCount,
      'tabletSlotCount': instance.tabletSlotCount,
      'desktopSlotCount': instance.desktopSlotCount,
      'mobileLargeSlotCount': instance.mobileLargeSlotCount,
      'mobile': instance.mobile.map((e) => e.toJson()).toList(),
      'tablet': instance.tablet.map((e) => e.toJson()).toList(),
      'desktop': instance.desktop.map((e) => e.toJson()).toList(),
      'mobileLarge': instance.mobileLarge.map((e) => e.toJson()).toList(),
    };

_$DashboardItemImpl _$$DashboardItemImplFromJson(Map<String, dynamic> json) =>
    _$DashboardItemImpl(
      key: json['item_id'] as String,
      layout:
          DashboardItemLayout.fromJson(json['layout'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DashboardItemImplToJson(_$DashboardItemImpl instance) =>
    <String, dynamic>{
      'item_id': instance.key,
      'layout': instance.layout.toJson(),
    };

_$DashboardItemLayoutImpl _$$DashboardItemLayoutImplFromJson(
        Map<String, dynamic> json) =>
    _$DashboardItemLayoutImpl(
      width: json['w'] as int,
      height: json['h'] as int,
      minWidth: json['min_W'] as int,
      minHeight: json['min_H'] as int,
      maxWidth: json['max_W'] as int?,
      maxHeight: json['max_H'] as int?,
      startX: json['s_X'] as int?,
      startY: json['s_Y'] as int?,
    );

Map<String, dynamic> _$$DashboardItemLayoutImplToJson(
        _$DashboardItemLayoutImpl instance) =>
    <String, dynamic>{
      'w': instance.width,
      'h': instance.height,
      'min_W': instance.minWidth,
      'min_H': instance.minHeight,
      'max_W': instance.maxWidth,
      'max_H': instance.maxHeight,
      's_X': instance.startX,
      's_Y': instance.startY,
    };
