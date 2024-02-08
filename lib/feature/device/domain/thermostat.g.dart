// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thermostat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ThermostatImpl _$$ThermostatImplFromJson(Map<String, dynamic> json) =>
    _$ThermostatImpl(
      temperatureMin: (json['temperatureMin'] as num?)?.toDouble(),
      temperatureMax: (json['temperatureMax'] as num?)?.toDouble(),
      temperatureEco: (json['temperatureEco'] as num?)?.toDouble(),
      temperatureComfort: (json['temperatureComfort'] as num?)?.toDouble(),
      temperatureEcoAdjustment:
          (json['temperatureEcoAdjustment'] as num?)?.toDouble(),
      temperatureComfortAdjustment:
          (json['temperatureComfortAdjustment'] as num?)?.toDouble(),
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$ThermostatImplToJson(_$ThermostatImpl instance) =>
    <String, dynamic>{
      'temperatureMin': instance.temperatureMin,
      'temperatureMax': instance.temperatureMax,
      'temperatureEco': instance.temperatureEco,
      'temperatureComfort': instance.temperatureComfort,
      'temperatureEcoAdjustment': instance.temperatureEcoAdjustment,
      'temperatureComfortAdjustment': instance.temperatureComfortAdjustment,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
    };
