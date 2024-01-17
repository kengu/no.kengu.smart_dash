// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceImpl _$$DeviceImplFromJson(Map<String, dynamic> json) => _$DeviceImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      service: json['service'] as String,
      type: $enumDecode(_$DeviceTypeEnumMap, json['type']),
      data: json['data'] as Map<String, dynamic>,
      capabilities: (json['capabilities'] as List<dynamic>)
          .map((e) => $enumDecode(_$DeviceCapabilitiesEnumMap, e))
          .toList(),
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
      energy: json['energy'] == null
          ? null
          : EnergySummary.fromJson(json['energy'] as Map<String, dynamic>),
      voltage: json['voltage'] as int?,
    );

Map<String, dynamic> _$$DeviceImplToJson(_$DeviceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'service': instance.service,
      'type': _$DeviceTypeEnumMap[instance.type]!,
      'data': instance.data,
      'capabilities': instance.capabilities
          .map((e) => _$DeviceCapabilitiesEnumMap[e]!)
          .toList(),
      'lastUpdated': instance.lastUpdated.toIso8601String(),
      'energy': instance.energy?.toJson(),
      'voltage': instance.voltage,
    };

const _$DeviceTypeEnumMap = {
  DeviceType.any: 'any',
  DeviceType.controller: 'controller',
  DeviceType.astroSwitch: 'astroSwitch',
  DeviceType.thermostat: 'thermostat',
  DeviceType.detector: 'detector',
  DeviceType.energyController: 'energyController',
  DeviceType.onOffRelay: 'onOffRelay',
  DeviceType.group: 'group',
  DeviceType.program: 'program',
  DeviceType.unknown: 'unknown',
};

const _$DeviceCapabilitiesEnumMap = {
  DeviceCapabilities.energy: 'energy',
  DeviceCapabilities.power: 'power',
  DeviceCapabilities.voltage: 'voltage',
};
