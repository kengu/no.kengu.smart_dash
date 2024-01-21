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
    );

Map<String, dynamic> _$$TokenImplToJson(_$TokenImpl instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'name': instance.name,
      'label': instance.label,
      'type': _$TokenTypeEnumMap[instance.type]!,
      'unit': _$TokenUnitEnumMap[instance.unit]!,
    };

const _$TokenTypeEnumMap = {
  TokenType.int: 'int',
  TokenType.bool: 'bool',
  TokenType.double: 'double',
};

const _$TokenUnitEnumMap = {
  TokenUnit.onOff: 'onOff',
  TokenUnit.power: 'power',
  TokenUnit.energy: 'energy',
  TokenUnit.voltage: 'voltage',
  TokenUnit.temperature: 'temperature',
};
