// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'energy_bill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EnergyBillImpl _$$EnergyBillImplFromJson(Map<String, dynamic> json) =>
    _$EnergyBillImpl(
      vat: json['vat'] as int,
      end: DateTime.parse(json['end'] as String),
      begin: DateTime.parse(json['begin'] as String),
      energy: (json['energy'] as num).toDouble(),
      price: ElectricityPrice.fromJson(json['price'] as Map<String, dynamic>),
      tariff:
          ElectricityTariff.fromJson(json['tariff'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EnergyBillImplToJson(_$EnergyBillImpl instance) =>
    <String, dynamic>{
      'vat': instance.vat,
      'end': instance.end.toIso8601String(),
      'begin': instance.begin.toIso8601String(),
      'energy': instance.energy,
      'price': instance.price.toJson(),
      'tariff': instance.tariff.toJson(),
    };
