// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'electricity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ElectricityPriceImpl _$$ElectricityPriceImplFromJson(
        Map<String, dynamic> json) =>
    _$ElectricityPriceImpl(
      nokPerKwh: (json['NOK_per_kWh'] as num).toDouble(),
      eurPerKwh: (json['EUR_per_kWh'] as num).toDouble(),
      eurToNokRate: (json['EXR'] as num).toDouble(),
      begin: DateTime.parse(json['time_start'] as String),
      end: DateTime.parse(json['time_end'] as String),
    );

Map<String, dynamic> _$$ElectricityPriceImplToJson(
        _$ElectricityPriceImpl instance) =>
    <String, dynamic>{
      'NOK_per_kWh': instance.nokPerKwh,
      'EUR_per_kWh': instance.eurPerKwh,
      'EXR': instance.eurToNokRate,
      'time_start': instance.begin.toIso8601String(),
      'time_end': instance.end.toIso8601String(),
    };

_$ElectricityTariffImpl _$$ElectricityTariffImplFromJson(
        Map<String, dynamic> json) =>
    _$ElectricityTariffImpl(
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

Map<String, dynamic> _$$ElectricityTariffImplToJson(
        _$ElectricityTariffImpl instance) =>
    <String, dynamic>{
      'provider': instance.provider,
      'validUntil': instance.validUntil.toIso8601String(),
      'capacity': instance.capacity.map((e) => e.toJson()).toList(),
      'consumption': instance.consumption.map((e) => e.toJson()).toList(),
    };

_$ElectricityCapacityImpl _$$ElectricityCapacityImplFromJson(
        Map<String, dynamic> json) =>
    _$ElectricityCapacityImpl(
      fromKWh: (json['from_kWh'] as num).toDouble(),
      toKWh: (json['to_kWh'] as num).toDouble(),
      nokPerMonth: (json['NOK_per_month'] as num).toDouble(),
    );

Map<String, dynamic> _$$ElectricityCapacityImplToJson(
        _$ElectricityCapacityImpl instance) =>
    <String, dynamic>{
      'from_kWh': instance.fromKWh,
      'to_kWh': instance.toKWh,
      'NOK_per_month': instance.nokPerMonth,
    };

_$ElectricityConsumptionImpl _$$ElectricityConsumptionImplFromJson(
        Map<String, dynamic> json) =>
    _$ElectricityConsumptionImpl(
      nokPerKwh: (json['NOK_per_kWh'] as num).toDouble(),
      fromHour: (json['from_hour'] as num).toInt(),
      toHour: (json['to_hour'] as num).toInt(),
    );

Map<String, dynamic> _$$ElectricityConsumptionImplToJson(
        _$ElectricityConsumptionImpl instance) =>
    <String, dynamic>{
      'NOK_per_kWh': instance.nokPerKwh,
      'from_hour': instance.fromHour,
      'to_hour': instance.toHour,
    };
