// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'electricity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ElectricityPrice _$ElectricityPriceFromJson(Map<String, dynamic> json) =>
    _ElectricityPrice(
      nokPerKwh: (json['NOK_per_kWh'] as num).toDouble(),
      eurPerKwh: (json['EUR_per_kWh'] as num).toDouble(),
      eurToNokRate: (json['EXR'] as num).toDouble(),
      begin: DateTime.parse(json['time_start'] as String),
      end: DateTime.parse(json['time_end'] as String),
    );

Map<String, dynamic> _$ElectricityPriceToJson(_ElectricityPrice instance) =>
    <String, dynamic>{
      'NOK_per_kWh': instance.nokPerKwh,
      'EUR_per_kWh': instance.eurPerKwh,
      'EXR': instance.eurToNokRate,
      'time_start': instance.begin.toIso8601String(),
      'time_end': instance.end.toIso8601String(),
    };

_ElectricityTariff _$ElectricityTariffFromJson(Map<String, dynamic> json) =>
    _ElectricityTariff(
      provider: json['provider'] as String,
      validUntil: DateTime.parse(json['validUntil'] as String),
      capacity: (json['capacity'] as List<dynamic>)
          .map((e) => ElectricityCapacity.fromJson(e as Map<String, dynamic>))
          .toList(),
      consumption: (json['consumption'] as List<dynamic>)
          .map(
              (e) => ElectricityConsumption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ElectricityTariffToJson(_ElectricityTariff instance) =>
    <String, dynamic>{
      'provider': instance.provider,
      'validUntil': instance.validUntil.toIso8601String(),
      'capacity': instance.capacity.map((e) => e.toJson()).toList(),
      'consumption': instance.consumption.map((e) => e.toJson()).toList(),
    };

_ElectricityCapacity _$ElectricityCapacityFromJson(Map<String, dynamic> json) =>
    _ElectricityCapacity(
      fromKWh: (json['from_kWh'] as num).toDouble(),
      toKWh: (json['to_kWh'] as num).toDouble(),
      nokPerMonth: (json['NOK_per_month'] as num).toDouble(),
    );

Map<String, dynamic> _$ElectricityCapacityToJson(
        _ElectricityCapacity instance) =>
    <String, dynamic>{
      'from_kWh': instance.fromKWh,
      'to_kWh': instance.toKWh,
      'NOK_per_month': instance.nokPerMonth,
    };

_ElectricityConsumption _$ElectricityConsumptionFromJson(
        Map<String, dynamic> json) =>
    _ElectricityConsumption(
      nokPerKwh: (json['NOK_per_kWh'] as num).toDouble(),
      fromHour: (json['from_hour'] as num).toInt(),
      toHour: (json['to_hour'] as num).toInt(),
    );

Map<String, dynamic> _$ElectricityConsumptionToJson(
        _ElectricityConsumption instance) =>
    <String, dynamic>{
      'NOK_per_kWh': instance.nokPerKwh,
      'from_hour': instance.fromHour,
      'to_hour': instance.toHour,
    };
