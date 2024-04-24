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
          .map((e) => $enumDecode(_$CapabilityEnumMap, e))
          .toList(),
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
      rain: (json['rain'] as num?)?.toDouble(),
      rainRate: (json['rainRate'] as num?)?.toDouble(),
      rainTotal: (json['rainTotal'] as num?)?.toDouble(),
      ultraviolet: (json['ultraviolet'] as num?)?.toInt(),
      luminance: (json['luminance'] as num?)?.toInt(),
      humidity: (json['humidity'] as num?)?.toDouble(),
      windAngle: (json['windAngle'] as num?)?.toDouble(),
      temperature: (json['temperature'] as num?)?.toDouble(),
      windSpeed: (json['windSpeed'] as num?)?.toDouble(),
      gustSpeed: (json['gustSpeed'] as num?)?.toDouble(),
      electric: json['electric'] == null
          ? null
          : ElectricState.fromJson(json['electric'] as Map<String, dynamic>),
      onOff: json['onOff'] == null
          ? null
          : SwitchState.fromJson(json['onOff'] as Map<String, dynamic>),
      thermostat: json['thermostat'] == null
          ? null
          : Thermostat.fromJson(json['thermostat'] as Map<String, dynamic>),
      snowDepth: (json['snowDepth'] as num?)?.toInt(),
      snowWeight: (json['snowWeight'] as num?)?.toInt(),
      rain1h: (json['rain1h'] as num?)?.toDouble(),
      rain3h: (json['rain3h'] as num?)?.toDouble(),
      rain6h: (json['rain6h'] as num?)?.toDouble(),
      rain12h: (json['rain12h'] as num?)?.toDouble(),
      rain1d: (json['rain1d'] as num?)?.toDouble(),
      snow1h: (json['snow1h'] as num?)?.toDouble(),
      snow3h: (json['snow3h'] as num?)?.toDouble(),
      snow6h: (json['snow6h'] as num?)?.toDouble(),
      snow12h: (json['snow12h'] as num?)?.toDouble(),
      snow1d: (json['snow1d'] as num?)?.toDouble(),
      temperature1h: (json['temperature1h'] as num?)?.toDouble(),
      temperature3h: (json['temperature3h'] as num?)?.toDouble(),
      temperature6h: (json['temperature6h'] as num?)?.toDouble(),
      temperature12h: (json['temperature12h'] as num?)?.toDouble(),
      temperature1d: (json['temperature1d'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$DeviceImplToJson(_$DeviceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'service': instance.service,
      'type': _$DeviceTypeEnumMap[instance.type]!,
      'data': instance.data,
      'capabilities':
          instance.capabilities.map((e) => _$CapabilityEnumMap[e]!).toList(),
      'lastUpdated': instance.lastUpdated.toIso8601String(),
      'rain': instance.rain,
      'rainRate': instance.rainRate,
      'rainTotal': instance.rainTotal,
      'ultraviolet': instance.ultraviolet,
      'luminance': instance.luminance,
      'humidity': instance.humidity,
      'windAngle': instance.windAngle,
      'temperature': instance.temperature,
      'windSpeed': instance.windSpeed,
      'gustSpeed': instance.gustSpeed,
      'electric': instance.electric?.toJson(),
      'onOff': instance.onOff?.toJson(),
      'thermostat': instance.thermostat?.toJson(),
      'snowDepth': instance.snowDepth,
      'snowWeight': instance.snowWeight,
      'rain1h': instance.rain1h,
      'rain3h': instance.rain3h,
      'rain6h': instance.rain6h,
      'rain12h': instance.rain12h,
      'rain1d': instance.rain1d,
      'snow1h': instance.snow1h,
      'snow3h': instance.snow3h,
      'snow6h': instance.snow6h,
      'snow12h': instance.snow12h,
      'snow1d': instance.snow1d,
      'temperature1h': instance.temperature1h,
      'temperature3h': instance.temperature3h,
      'temperature6h': instance.temperature6h,
      'temperature12h': instance.temperature12h,
      'temperature1d': instance.temperature1d,
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
  DeviceType.weatherNow: 'weatherNow',
  DeviceType.weatherForecast: 'weatherForecast',
  DeviceType.unknown: 'unknown',
};

const _$CapabilityEnumMap = {
  Capability.any: 'any',
  Capability.energy: 'energy',
  Capability.power: 'power',
  Capability.voltage: 'voltage',
  Capability.onOff: 'onOff',
  Capability.targetTemperature: 'targetTemperature',
  Capability.temperature: 'temperature',
  Capability.humidity: 'humidity',
  Capability.rain: 'rain',
  Capability.rainRate: 'rainRate',
  Capability.rainTotal: 'rainTotal',
  Capability.windAngle: 'windAngle',
  Capability.windSpeed: 'windSpeed',
  Capability.gustSpeed: 'gustSpeed',
  Capability.ultraviolet: 'ultraviolet',
  Capability.luminance: 'luminance',
  Capability.snowDepth: 'snowDepth',
  Capability.snowWeight: 'snowWeight',
  Capability.temperature1h: 'temperature1h',
  Capability.temperature3h: 'temperature3h',
  Capability.temperature6h: 'temperature6h',
  Capability.temperature12h: 'temperature12h',
  Capability.temperature1d: 'temperature1d',
  Capability.rain1h: 'rain1h',
  Capability.rain3h: 'rain3h',
  Capability.rain6h: 'rain6h',
  Capability.rain12h: 'rain12h',
  Capability.rain1d: 'rain1d',
  Capability.snow1h: 'snow1h',
  Capability.snow3h: 'snow3h',
  Capability.snow6h: 'snow6h',
  Capability.snow12h: 'snow12h',
  Capability.snow1d: 'snow1d',
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
