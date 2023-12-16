// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokenImpl _$$TokenImplFromJson(Map<String, dynamic> json) => _$TokenImpl(
      name: json['name'] as String,
      type: $enumDecode(_$TokenTypeEnumMap, json['type']),
      unit: $enumDecode(_$TokenUnitEnumMap, json['unit']),
    );

Map<String, dynamic> _$$TokenImplToJson(_$TokenImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': _$TokenTypeEnumMap[instance.type]!,
      'unit': _$TokenUnitEnumMap[instance.unit]!,
    };

const _$TokenTypeEnumMap = {
  TokenType.bool: 'bool',
  TokenType.number: 'number',
  TokenType.string: 'string',
};

const _$TokenUnitEnumMap = {
  TokenUnit.volt: 'volt',
  TokenUnit.watt: 'watt',
  TokenUnit.wattHour: 'wattHour',
};
