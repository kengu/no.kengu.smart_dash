// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'electric_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ElectricStateImpl _$$ElectricStateImplFromJson(Map<String, dynamic> json) =>
    _$ElectricStateImpl(
      voltage: (json['voltage'] as num?)?.toInt(),
      currentPower: (json['currentPower'] as num?)?.toInt(),
      cumulative: (json['cumulative'] as num?)?.toInt(),
      cumulativeToday: (json['cumulativeToday'] as num?)?.toInt(),
      isPowerRegulated: json['isPowerRegulated'] as bool?,
      estimatedRegulatedPower:
          (json['estimatedRegulatedPower'] as num?)?.toInt(),
      estimatedUnregulatedPower:
          (json['estimatedUnregulatedPower'] as num?)?.toInt(),
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$ElectricStateImplToJson(_$ElectricStateImpl instance) =>
    <String, dynamic>{
      'voltage': instance.voltage,
      'currentPower': instance.currentPower,
      'cumulative': instance.cumulative,
      'cumulativeToday': instance.cumulativeToday,
      'isPowerRegulated': instance.isPowerRegulated,
      'estimatedRegulatedPower': instance.estimatedRegulatedPower,
      'estimatedUnregulatedPower': instance.estimatedUnregulatedPower,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
    };
