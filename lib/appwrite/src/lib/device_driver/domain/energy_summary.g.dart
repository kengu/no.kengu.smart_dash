// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'energy_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EnergySummaryImpl _$$EnergySummaryImplFromJson(Map<String, dynamic> json) =>
    _$EnergySummaryImpl(
      currentPower: json['currentPower'] as int,
      cumulative: json['cumulative'] as int,
      cumulativeToday: json['cumulativeToday'] as int,
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$EnergySummaryImplToJson(_$EnergySummaryImpl instance) =>
    <String, dynamic>{
      'currentPower': instance.currentPower,
      'cumulative': instance.cumulative,
      'cumulativeToday': instance.cumulativeToday,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
    };
