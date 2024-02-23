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
          .map((e) => $enumDecode(_$DeviceCapabilityEnumMap, e))
          .toList(),
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
      rain: (json['rain'] as num?)?.toDouble(),
      humidity: (json['humidity'] as num?)?.toDouble(),
      windAngle: (json['windAngle'] as num?)?.toDouble(),
      temperature: (json['temperature'] as num?)?.toDouble(),
      windStrength: (json['windStrength'] as num?)?.toDouble(),
      gustStrength: (json['gustStrength'] as num?)?.toDouble(),
      electric: json['electric'] == null
          ? null
          : ElectricState.fromJson(json['electric'] as Map<String, dynamic>),
      onOff: json['onOff'] == null
          ? null
          : SwitchState.fromJson(json['onOff'] as Map<String, dynamic>),
      thermostat: json['thermostat'] == null
          ? null
          : Thermostat.fromJson(json['thermostat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DeviceImplToJson(_$DeviceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'service': instance.service,
      'type': _$DeviceTypeEnumMap[instance.type]!,
      'data': instance.data,
      'capabilities': instance.capabilities
          .map((e) => _$DeviceCapabilityEnumMap[e]!)
          .toList(),
      'lastUpdated': instance.lastUpdated.toIso8601String(),
      'rain': instance.rain,
      'humidity': instance.humidity,
      'windAngle': instance.windAngle,
      'temperature': instance.temperature,
      'windStrength': instance.windStrength,
      'gustStrength': instance.gustStrength,
      'electric': instance.electric?.toJson(),
      'onOff': instance.onOff?.toJson(),
      'thermostat': instance.thermostat?.toJson(),
    };

const _$DeviceTypeEnumMap = {
  DeviceType.any: 'any',
  DeviceType.controller: 'controller',
  DeviceType.astroSwitch: 'astroSwitch',
  DeviceType.thermostat: 'thermostat',
  DeviceType.sensor: 'sensor',
  DeviceType.energyController: 'energyController',
  DeviceType.onOffRelay: 'onOffRelay',
  DeviceType.group: 'group',
  DeviceType.program: 'program',
  DeviceType.unknown: 'unknown',
};

const _$DeviceCapabilityEnumMap = {
  DeviceCapability.energy: 'energy',
  DeviceCapability.power: 'power',
  DeviceCapability.voltage: 'voltage',
  DeviceCapability.onOff: 'onOff',
  DeviceCapability.temperature: 'temperature',
  DeviceCapability.humidity: 'humidity',
  DeviceCapability.rain: 'rain',
  DeviceCapability.windAngle: 'windAngle',
  DeviceCapability.windStrength: 'windStrength',
  DeviceCapability.gustStrength: 'gustStrength',
  DeviceCapability.targetTemperature: 'targetTemperature',
};

_$IdentityImpl _$$IdentityImplFromJson(Map<String, dynamic> json) =>
    _$IdentityImpl(
      deviceId: json['deviceId'] as String,
      serviceKey: json['serviceKey'] as String,
    );

Map<String, dynamic> _$$IdentityImplToJson(_$IdentityImpl instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'serviceKey': instance.serviceKey,
    };
