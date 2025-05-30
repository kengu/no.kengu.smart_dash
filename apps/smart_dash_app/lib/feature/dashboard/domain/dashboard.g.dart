// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Dashboard _$DashboardFromJson(Map<String, dynamic> json) => _Dashboard(
      key: json['key'] as String,
      title: json['title'] as String,
      tokens: (json['tokens'] as List<dynamic>)
          .map((e) => Token.fromJson(e as Map<String, dynamic>))
          .toList(),
      ids: (json['ids'] as List<dynamic>)
          .map((e) => Identity.fromJson(e as Map<String, dynamic>))
          .toList(),
      mobile: DashboardLayout.fromJson(json['mobile'] as Map<String, dynamic>),
      tablet: DashboardLayout.fromJson(json['tablet'] as Map<String, dynamic>),
      desktop:
          DashboardLayout.fromJson(json['desktop'] as Map<String, dynamic>),
      mobileLarge:
          DashboardLayout.fromJson(json['mobileLarge'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DashboardToJson(_Dashboard instance) =>
    <String, dynamic>{
      'key': instance.key,
      'title': instance.title,
      'tokens': instance.tokens.map((e) => e.toJson()).toList(),
      'ids': instance.ids.map((e) => e.toJson()).toList(),
      'mobile': instance.mobile.toJson(),
      'tablet': instance.tablet.toJson(),
      'desktop': instance.desktop.toJson(),
      'mobileLarge': instance.mobileLarge.toJson(),
    };

_DashboardLayout _$DashboardLayoutFromJson(Map<String, dynamic> json) =>
    _DashboardLayout(
      slotCount: (json['slotCount'] as num).toInt(),
      slotHeight: (json['slotHeight'] as num).toDouble(),
      items: (json['items'] as List<dynamic>)
          .map((e) => DashboardItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DashboardLayoutToJson(_DashboardLayout instance) =>
    <String, dynamic>{
      'slotCount': instance.slotCount,
      'slotHeight': instance.slotHeight,
      'items': instance.items.map((e) => e.toJson()).toList(),
    };

_DashboardItem _$DashboardItemFromJson(Map<String, dynamic> json) =>
    _DashboardItem(
      key: json['item_id'] as String,
      layout:
          DashboardItemLayout.fromJson(json['layout'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DashboardItemToJson(_DashboardItem instance) =>
    <String, dynamic>{
      'item_id': instance.key,
      'layout': instance.layout.toJson(),
    };

_DashboardItemLayout _$DashboardItemLayoutFromJson(Map<String, dynamic> json) =>
    _DashboardItemLayout(
      width: (json['w'] as num).toInt(),
      height: (json['h'] as num).toInt(),
      minWidth: (json['min_W'] as num).toInt(),
      minHeight: (json['min_H'] as num).toInt(),
      maxWidth: (json['max_W'] as num?)?.toInt(),
      maxHeight: (json['max_H'] as num?)?.toInt(),
      startX: (json['s_X'] as num?)?.toInt(),
      startY: (json['s_Y'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DashboardItemLayoutToJson(
        _DashboardItemLayout instance) =>
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
