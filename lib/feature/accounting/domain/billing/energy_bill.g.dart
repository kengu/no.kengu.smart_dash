// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'energy_bill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EnergyBillImpl _$$EnergyBillImplFromJson(Map<String, dynamic> json) =>
    _$EnergyBillImpl(
      base: ElectricityPrice.fromJson(json['base'] as Map<String, dynamic>),
      energy: (json['energy'] as num).toDouble(),
      begin: DateTime.parse(json['begin'] as String),
      end: DateTime.parse(json['end'] as String),
    );

Map<String, dynamic> _$$EnergyBillImplToJson(_$EnergyBillImpl instance) =>
    <String, dynamic>{
      'base': instance.base.toJson(),
      'energy': instance.energy,
      'begin': instance.begin.toIso8601String(),
      'end': instance.end.toIso8601String(),
    };
