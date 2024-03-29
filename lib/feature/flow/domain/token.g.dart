// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokenImpl _$$TokenImplFromJson(Map<String, dynamic> json) => _$TokenImpl(
      tag: json['tag'] as String,
      name: json['name'] as String,
      label: json['label'] as String,
      type: $enumDecode(_$TokenTypeEnumMap, json['type']),
      unit: $enumDecode(_$TokenUnitEnumMap, json['unit']),
      capability: $enumDecode(_$DeviceCapabilityEnumMap, json['capability']),
    );

Map<String, dynamic> _$$TokenImplToJson(_$TokenImpl instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'name': instance.name,
      'label': instance.label,
      'type': _$TokenTypeEnumMap[instance.type]!,
      'unit': _$TokenUnitEnumMap[instance.unit]!,
      'capability': _$DeviceCapabilityEnumMap[instance.capability]!,
    };

const _$TokenTypeEnumMap = {
  TokenType.int: 'int',
  TokenType.bool: 'bool',
  TokenType.double: 'double',
};

const _$TokenUnitEnumMap = {
  TokenUnit.value: 'value',
  TokenUnit.onOff: 'onOff',
  TokenUnit.power: 'power',
  TokenUnit.rain: 'rain',
  TokenUnit.rainTotal: 'rainTotal',
  TokenUnit.rainRate: 'rainRate',
  TokenUnit.energy: 'energy',
  TokenUnit.voltage: 'voltage',
  TokenUnit.humidity: 'humidity',
  TokenUnit.windAngle: 'windAngle',
  TokenUnit.luminance: 'luminance',
  TokenUnit.windSpeed: 'windSpeed',
  TokenUnit.gustSpeed: 'gustSpeed',
  TokenUnit.snow: 'snow',
  TokenUnit.snowDepth: 'snowDepth',
  TokenUnit.snowWeight: 'snowWeight',
  TokenUnit.ultraviolet: 'ultraviolet',
  TokenUnit.temperature: 'temperature',
};

const _$DeviceCapabilityEnumMap = {
  DeviceCapability.value: 'value',
  DeviceCapability.energy: 'energy',
  DeviceCapability.power: 'power',
  DeviceCapability.voltage: 'voltage',
  DeviceCapability.onOff: 'onOff',
  DeviceCapability.targetTemperature: 'targetTemperature',
  DeviceCapability.temperature: 'temperature',
  DeviceCapability.humidity: 'humidity',
  DeviceCapability.rain: 'rain',
  DeviceCapability.rainRate: 'rainRate',
  DeviceCapability.rainTotal: 'rainTotal',
  DeviceCapability.windAngle: 'windAngle',
  DeviceCapability.windSpeed: 'windSpeed',
  DeviceCapability.gustSpeed: 'gustSpeed',
  DeviceCapability.ultraviolet: 'ultraviolet',
  DeviceCapability.luminance: 'luminance',
  DeviceCapability.snowDepth: 'snowDepth',
  DeviceCapability.snowWeight: 'snowWeight',
  DeviceCapability.temperature1h: 'temperature1h',
  DeviceCapability.temperature3h: 'temperature3h',
  DeviceCapability.temperature6h: 'temperature6h',
  DeviceCapability.temperature12h: 'temperature12h',
  DeviceCapability.temperature1d: 'temperature1d',
  DeviceCapability.rain1h: 'rain1h',
  DeviceCapability.rain3h: 'rain3h',
  DeviceCapability.rain6h: 'rain6h',
  DeviceCapability.rain12h: 'rain12h',
  DeviceCapability.rain1d: 'rain1d',
  DeviceCapability.snow1h: 'snow1h',
  DeviceCapability.snow3h: 'snow3h',
  DeviceCapability.snow6h: 'snow6h',
  DeviceCapability.snow12h: 'snow12h',
  DeviceCapability.snow1d: 'snow1d',
};
