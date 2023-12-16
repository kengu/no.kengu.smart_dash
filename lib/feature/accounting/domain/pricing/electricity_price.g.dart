// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'electricity_price.dart';

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
