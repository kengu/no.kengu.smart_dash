// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'switch_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SwitchStateImpl _$$SwitchStateImplFromJson(Map<String, dynamic> json) =>
    _$SwitchStateImpl(
      state: json['state'] as bool,
      mode: $enumDecode(_$SwitchModeEnumMap, json['mode']),
      onMode: $enumDecode(_$SwitchModeEnumMap, json['onMode']),
      offMode: $enumDecode(_$SwitchModeEnumMap, json['offMode']),
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$SwitchStateImplToJson(_$SwitchStateImpl instance) =>
    <String, dynamic>{
      'state': instance.state,
      'mode': _$SwitchModeEnumMap[instance.mode]!,
      'onMode': _$SwitchModeEnumMap[instance.onMode]!,
      'offMode': _$SwitchModeEnumMap[instance.offMode]!,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
    };

const _$SwitchModeEnumMap = {
  SwitchMode.on: 'on',
  SwitchMode.off: 'off',
  SwitchMode.eco: 'eco',
  SwitchMode.comfort: 'comfort',
  SwitchMode.antiFreeze: 'antiFreeze',
};
