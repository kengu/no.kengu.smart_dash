// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'energy_bill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EnergyBillMonthImpl _$$EnergyBillMonthImplFromJson(
        Map<String, dynamic> json) =>
    _$EnergyBillMonthImpl(
      begin: DateTime.parse(json['begin'] as String),
      daily: (json['daily'] as List<dynamic>)
          .map((e) => EnergyBillDay.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$EnergyBillMonthImplToJson(
        _$EnergyBillMonthImpl instance) =>
    <String, dynamic>{
      'begin': instance.begin.toIso8601String(),
      'daily': instance.daily.map((e) => e.toJson()).toList(),
    };

_$EnergyBillDayImpl _$$EnergyBillDayImplFromJson(Map<String, dynamic> json) =>
    _$EnergyBillDayImpl(
      begin: DateTime.parse(json['begin'] as String),
      hourly: (json['hourly'] as List<dynamic>)
          .map((e) => EnergyBillHour.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$EnergyBillDayImplToJson(_$EnergyBillDayImpl instance) =>
    <String, dynamic>{
      'begin': instance.begin.toIso8601String(),
      'hourly': instance.hourly.map((e) => e.toJson()).toList(),
    };

_$EnergyBillHourImpl _$$EnergyBillHourImplFromJson(Map<String, dynamic> json) =>
    _$EnergyBillHourImpl(
      vat: (json['vat'] as num).toInt(),
      end: DateTime.parse(json['end'] as String),
      begin: DateTime.parse(json['begin'] as String),
      energy: (json['energy'] as num).toDouble(),
      price: ElectricityPrice.fromJson(json['price'] as Map<String, dynamic>),
      tariff:
          ElectricityTariff.fromJson(json['tariff'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EnergyBillHourImplToJson(
        _$EnergyBillHourImpl instance) =>
    <String, dynamic>{
      'vat': instance.vat,
      'end': instance.end.toIso8601String(),
      'begin': instance.begin.toIso8601String(),
      'energy': instance.energy,
      'price': instance.price.toJson(),
      'tariff': instance.tariff.toJson(),
    };
