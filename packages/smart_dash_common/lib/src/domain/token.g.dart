// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokenImpl _$$TokenImplFromJson(Map<String, dynamic> json) => _$TokenImpl(
      tag: json['tag'] as String,
      name: json['name'] as String,
      label: json['label'] as String,
      capability: $enumDecode(_$CapabilityEnumMap, json['capability']),
    );

Map<String, dynamic> _$$TokenImplToJson(_$TokenImpl instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'name': instance.name,
      'label': instance.label,
      'capability': _$CapabilityEnumMap[instance.capability]!,
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
