// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BlockModelImpl _$$BlockModelImplFromJson(Map<String, dynamic> json) =>
    _$BlockModelImpl(
      name: json['name'] as String,
      label: json['label'] as String,
      state: BlockState.fromJson(json['state'] as Map<String, dynamic>),
      description: json['description'] as String,
      trigger: BlockTrigger.fromJson(json['trigger'] as Map<String, dynamic>),
      whenTrue: (json['whenTrue'] as List<dynamic>)
          .map((e) => BlockAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      whenFalse: (json['whenFalse'] as List<dynamic>)
          .map((e) => BlockAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      conditions: (json['conditions'] as List<dynamic>)
          .map((e) => BlockCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BlockModelImplToJson(_$BlockModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'label': instance.label,
      'state': instance.state.toJson(),
      'description': instance.description,
      'trigger': instance.trigger.toJson(),
      'whenTrue': instance.whenTrue.map((e) => e.toJson()).toList(),
      'whenFalse': instance.whenFalse.map((e) => e.toJson()).toList(),
      'conditions': instance.conditions.map((e) => e.toJson()).toList(),
    };

_$BlockStateImpl _$$BlockStateImplFromJson(Map<String, dynamic> json) =>
    _$BlockStateImpl(
      value: json['value'] as bool,
      repeated: json['repeated'] as int,
      parameters: (json['parameters'] as List<dynamic>)
          .map((e) => BlockParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastChanged: json['lastChanged'] == null
          ? null
          : DateTime.parse(json['lastChanged'] as String),
    );

Map<String, dynamic> _$$BlockStateImplToJson(_$BlockStateImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'repeated': instance.repeated,
      'parameters': instance.parameters.map((e) => e.toJson()).toList(),
      'lastChanged': instance.lastChanged?.toIso8601String(),
    };

_$BlockTriggerImpl _$$BlockTriggerImplFromJson(Map<String, dynamic> json) =>
    _$BlockTriggerImpl(
      any: json['any'] as bool,
      label: json['label'] as String,
      repeatCount: json['repeatCount'] as int,
      repeatAfter: json['repeatAfter'] as int,
      debounceCount: json['debounceCount'] as int,
      debounceAfter: json['debounceAfter'] as int,
      description: json['description'] as String,
      onTags:
          (json['onTags'] as List<dynamic>).map((e) => e as String).toList(),
      onTypes: (json['onTypes'] as List<dynamic>)
          .map((e) => $enumDecode(_$BlockTriggerOnTypeEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$$BlockTriggerImplToJson(_$BlockTriggerImpl instance) =>
    <String, dynamic>{
      'any': instance.any,
      'label': instance.label,
      'repeatCount': instance.repeatCount,
      'repeatAfter': instance.repeatAfter,
      'debounceCount': instance.debounceCount,
      'debounceAfter': instance.debounceAfter,
      'description': instance.description,
      'onTags': instance.onTags,
      'onTypes':
          instance.onTypes.map((e) => _$BlockTriggerOnTypeEnumMap[e]!).toList(),
    };

const _$BlockTriggerOnTypeEnumMap = {
  BlockTriggerOnType.any: 'any',
  BlockTriggerOnType.none: 'none',
  BlockTriggerOnType.device: 'device',
};

_$BlockConditionImpl _$$BlockConditionImplFromJson(Map<String, dynamic> json) =>
    _$BlockConditionImpl(
      label: json['label'] as String,
      expression: json['expression'] as String,
      description: json['description'] as String,
      variables: (json['variables'] as List<dynamic>)
          .map((e) => BlockVariable.fromJson(e as Map<String, dynamic>))
          .toList(),
      parameters: (json['parameters'] as List<dynamic>)
          .map((e) => BlockParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BlockConditionImplToJson(
        _$BlockConditionImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'expression': instance.expression,
      'description': instance.description,
      'variables': instance.variables.map((e) => e.toJson()).toList(),
      'parameters': instance.parameters.map((e) => e.toJson()).toList(),
    };

_$BlockVariableImpl _$$BlockVariableImplFromJson(Map<String, dynamic> json) =>
    _$BlockVariableImpl(
      tag: json['tag'] as String,
      name: json['name'] as String,
      label: json['label'] as String,
      type: $enumDecode(_$TokenTypeEnumMap, json['type']),
      unit: $enumDecode(_$TokenUnitEnumMap, json['unit']),
      description: json['description'] as String,
    );

Map<String, dynamic> _$$BlockVariableImplToJson(_$BlockVariableImpl instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'name': instance.name,
      'label': instance.label,
      'type': _$TokenTypeEnumMap[instance.type]!,
      'unit': _$TokenUnitEnumMap[instance.unit]!,
      'description': instance.description,
    };

const _$TokenTypeEnumMap = {
  TokenType.int: 'int',
  TokenType.bool: 'bool',
  TokenType.double: 'double',
};

const _$TokenUnitEnumMap = {
  TokenUnit.onOff: 'onOff',
  TokenUnit.count: 'count',
  TokenUnit.power: 'power',
  TokenUnit.rain: 'rain',
  TokenUnit.energy: 'energy',
  TokenUnit.voltage: 'voltage',
  TokenUnit.humidity: 'humidity',
  TokenUnit.windAngle: 'windAngle',
  TokenUnit.luminance: 'luminance',
  TokenUnit.windSpeed: 'windSpeed',
  TokenUnit.gustSpeed: 'gustSpeed',
  TokenUnit.ultraviolet: 'ultraviolet',
  TokenUnit.temperature: 'temperature',
};

_$BlockActionImpl _$$BlockActionImplFromJson(Map<String, dynamic> json) =>
    _$BlockActionImpl(
      label: json['label'] as String,
      description: json['description'] as String,
      type: $enumDecode(_$BlockActionTypeEnumMap, json['type']),
      parameters: (json['parameters'] as List<dynamic>)
          .map((e) => BlockParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BlockActionImplToJson(_$BlockActionImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'description': instance.description,
      'type': _$BlockActionTypeEnumMap[instance.type]!,
      'parameters': instance.parameters.map((e) => e.toJson()).toList(),
    };

const _$BlockActionTypeEnumMap = {
  BlockActionType.notification: 'notification',
};

_$BlockParameterImpl _$$BlockParameterImplFromJson(Map<String, dynamic> json) =>
    _$BlockParameterImpl(
      tag: json['tag'] as String,
      name: json['name'] as String,
      value: json['value'] as Object,
      type: $enumDecode(_$TokenTypeEnumMap, json['type']),
      unit: $enumDecode(_$TokenUnitEnumMap, json['unit']),
    );

Map<String, dynamic> _$$BlockParameterImplToJson(
        _$BlockParameterImpl instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'name': instance.name,
      'value': instance.value,
      'type': _$TokenTypeEnumMap[instance.type]!,
      'unit': _$TokenUnitEnumMap[instance.unit]!,
    };
