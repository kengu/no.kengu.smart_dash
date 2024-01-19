// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokenImpl _$$TokenImplFromJson(Map<String, dynamic> json) => _$TokenImpl(
      name: json['name'] as String,
      tag: json['tag'] as String,
      type: $enumDecode(_$TokenTypeEnumMap, json['type']),
      unit: $enumDecode(_$TokenUnitEnumMap, json['unit']),
    );

Map<String, dynamic> _$$TokenImplToJson(_$TokenImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'tag': instance.tag,
      'type': _$TokenTypeEnumMap[instance.type]!,
      'unit': _$TokenUnitEnumMap[instance.unit]!,
    };

const _$TokenTypeEnumMap = {
  TokenType.int: 'int',
  TokenType.double: 'double',
};

const _$TokenUnitEnumMap = {
  TokenUnit.voltage: 'voltage',
  TokenUnit.energy: 'energy',
  TokenUnit.power: 'power',
  TokenUnit.temperature: 'temperature',
};
