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
      mobile: DashboardLayout.fromJson(json['mobile'] as Map<String, dynamic>),
      tablet: DashboardLayout.fromJson(json['tablet'] as Map<String, dynamic>),
      desktop:
          DashboardLayout.fromJson(json['desktop'] as Map<String, dynamic>),
      mobileLarge:
          DashboardLayout.fromJson(json['mobileLarge'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DashboardImplToJson(_$DashboardImpl instance) =>
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

_$DashboardLayoutImpl _$$DashboardLayoutImplFromJson(
        Map<String, dynamic> json) =>
    _$DashboardLayoutImpl(
      slotCount: json['slotCount'] as int,
      slotHeight: (json['slotHeight'] as num).toDouble(),
      items: (json['items'] as List<dynamic>)
          .map((e) => DashboardItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DashboardLayoutImplToJson(
        _$DashboardLayoutImpl instance) =>
    <String, dynamic>{
      'slotCount': instance.slotCount,
      'slotHeight': instance.slotHeight,
      'items': instance.items.map((e) => e.toJson()).toList(),
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
