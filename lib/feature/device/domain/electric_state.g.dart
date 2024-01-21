// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'electric_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ElectricStateImpl _$$ElectricStateImplFromJson(Map<String, dynamic> json) =>
    _$ElectricStateImpl(
      voltage: json['voltage'] as int?,
      currentPower: json['currentPower'] as int?,
      estimatedRegulatedPower: json['estimatedRegulatedPower'] as int?,
      estimatedUnregulatedPower: json['estimatedUnregulatedPower'] as int?,
      cumulative: json['cumulative'] as int?,
      cumulativeToday: json['cumulativeToday'] as int?,
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$ElectricStateImplToJson(_$ElectricStateImpl instance) =>
    <String, dynamic>{
      'voltage': instance.voltage,
      'currentPower': instance.currentPower,
      'estimatedRegulatedPower': instance.estimatedRegulatedPower,
      'estimatedUnregulatedPower': instance.estimatedUnregulatedPower,
      'cumulative': instance.cumulative,
      'cumulativeToday': instance.cumulativeToday,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
    };
