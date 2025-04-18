// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BlockModel _$BlockModelFromJson(Map<String, dynamic> json) => _BlockModel(
      id: json['id'] as String,
      type: json['type'] as String,
      label: json['label'] as String,
      enabled: json['enabled'] as bool,
      state: BlockState.fromJson(json['state'] as Map<String, dynamic>),
      description: json['description'] as String,
      trigger: BlockTrigger.fromJson(json['trigger'] as Map<String, dynamic>),
      whenTrue: (json['whenTrue'] as List<dynamic>)
          .map((e) => BlockAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      whenFalse: (json['whenFalse'] as List<dynamic>)
          .map((e) => BlockAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      parameters: (json['parameters'] as List<dynamic>)
          .map((e) => BlockParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      conditions: (json['conditions'] as List<dynamic>)
          .map((e) => BlockCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BlockModelToJson(_BlockModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'label': instance.label,
      'enabled': instance.enabled,
      'state': instance.state.toJson(),
      'description': instance.description,
      'trigger': instance.trigger.toJson(),
      'whenTrue': instance.whenTrue.map((e) => e.toJson()).toList(),
      'whenFalse': instance.whenFalse.map((e) => e.toJson()).toList(),
      'parameters': instance.parameters.map((e) => e.toJson()).toList(),
      'conditions': instance.conditions.map((e) => e.toJson()).toList(),
    };

_BlockParameter _$BlockParameterFromJson(Map<String, dynamic> json) =>
    _BlockParameter(
      tag: json['tag'] as String,
      name: json['name'] as String,
      value: json['value'] as Object,
      type: $enumDecode(_$ValueTypeEnumMap, json['type']),
      unit: $enumDecode(_$ValueUnitEnumMap, json['unit']),
    );

Map<String, dynamic> _$BlockParameterToJson(_BlockParameter instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'name': instance.name,
      'value': instance.value,
      'type': _$ValueTypeEnumMap[instance.type]!,
      'unit': _$ValueUnitEnumMap[instance.unit]!,
    };

const _$ValueTypeEnumMap = {
  ValueType.int: 'int',
  ValueType.bool: 'bool',
  ValueType.double: 'double',
};

const _$ValueUnitEnumMap = {
  ValueUnit.any: 'any',
  ValueUnit.onOff: 'onOff',
  ValueUnit.power: 'power',
  ValueUnit.rain: 'rain',
  ValueUnit.rainTotal: 'rainTotal',
  ValueUnit.rainRate: 'rainRate',
  ValueUnit.energy: 'energy',
  ValueUnit.voltage: 'voltage',
  ValueUnit.humidity: 'humidity',
  ValueUnit.windAngle: 'windAngle',
  ValueUnit.luminance: 'luminance',
  ValueUnit.windSpeed: 'windSpeed',
  ValueUnit.gustSpeed: 'gustSpeed',
  ValueUnit.snow: 'snow',
  ValueUnit.snowDepth: 'snowDepth',
  ValueUnit.snowWeight: 'snowWeight',
  ValueUnit.ultraviolet: 'ultraviolet',
  ValueUnit.temperature: 'temperature',
};

_BlockState _$BlockStateFromJson(Map<String, dynamic> json) => _BlockState(
      value: json['value'] as bool,
      repeated: (json['repeated'] as num).toInt(),
      tags: (json['tags'] as List<dynamic>)
          .map((e) => BlockParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastChanged: json['lastChanged'] == null
          ? null
          : DateTime.parse(json['lastChanged'] as String),
    );

Map<String, dynamic> _$BlockStateToJson(_BlockState instance) =>
    <String, dynamic>{
      'value': instance.value,
      'repeated': instance.repeated,
      'tags': instance.tags.map((e) => e.toJson()).toList(),
      'lastChanged': instance.lastChanged?.toIso8601String(),
    };

_BlockTrigger _$BlockTriggerFromJson(Map<String, dynamic> json) =>
    _BlockTrigger(
      any: json['any'] as bool,
      repeatCount: (json['repeatCount'] as num).toInt(),
      repeatAfter: (json['repeatAfter'] as num).toInt(),
      debounceCount: (json['debounceCount'] as num).toInt(),
      debounceAfter: (json['debounceAfter'] as num).toInt(),
      onTags:
          (json['onTags'] as List<dynamic>).map((e) => e as String).toList(),
      onTypes: (json['onTypes'] as List<dynamic>)
          .map((e) => $enumDecode(_$BlockTriggerOnTypeEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$BlockTriggerToJson(_BlockTrigger instance) =>
    <String, dynamic>{
      'any': instance.any,
      'repeatCount': instance.repeatCount,
      'repeatAfter': instance.repeatAfter,
      'debounceCount': instance.debounceCount,
      'debounceAfter': instance.debounceAfter,
      'onTags': instance.onTags,
      'onTypes':
          instance.onTypes.map((e) => _$BlockTriggerOnTypeEnumMap[e]!).toList(),
    };

const _$BlockTriggerOnTypeEnumMap = {
  BlockTriggerOnType.any: 'any',
  BlockTriggerOnType.none: 'none',
  BlockTriggerOnType.device: 'device',
};

_BlockCondition _$BlockConditionFromJson(Map<String, dynamic> json) =>
    _BlockCondition(
      label: json['label'] as String,
      expression: json['expression'] as String,
      description: json['description'] as String,
      variables: (json['variables'] as List<dynamic>)
          .map((e) => BlockVariable.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BlockConditionToJson(_BlockCondition instance) =>
    <String, dynamic>{
      'label': instance.label,
      'expression': instance.expression,
      'description': instance.description,
      'variables': instance.variables.map((e) => e.toJson()).toList(),
    };

_BlockVariable _$BlockVariableFromJson(Map<String, dynamic> json) =>
    _BlockVariable(
      tag: json['tag'] as String,
      name: json['name'] as String,
      label: json['label'] as String,
      type: $enumDecode(_$ValueTypeEnumMap, json['type']),
      unit: $enumDecode(_$ValueUnitEnumMap, json['unit']),
      description: json['description'] as String,
    );

Map<String, dynamic> _$BlockVariableToJson(_BlockVariable instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'name': instance.name,
      'label': instance.label,
      'type': _$ValueTypeEnumMap[instance.type]!,
      'unit': _$ValueUnitEnumMap[instance.unit]!,
      'description': instance.description,
    };

_BlockAction _$BlockActionFromJson(Map<String, dynamic> json) => _BlockAction(
      label: json['label'] as String,
      description: json['description'] as String,
      type: $enumDecode(_$BlockActionTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$BlockActionToJson(_BlockAction instance) =>
    <String, dynamic>{
      'label': instance.label,
      'description': instance.description,
      'type': _$BlockActionTypeEnumMap[instance.type]!,
    };

const _$BlockActionTypeEnumMap = {
  BlockActionType.notification: 'notification',
};
