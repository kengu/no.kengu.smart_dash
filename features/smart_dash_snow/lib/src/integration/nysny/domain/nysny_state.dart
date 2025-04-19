import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dash_snow/smart_dash_snow.dart';

part 'nysny_state.freezed.dart';
part 'nysny_state.g.dart';

@freezed
sealed class NySnySensor with _$NySnySensor {
  const NySnySensor._();
  const factory NySnySensor({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'data') required NySnySensorData data,
    @JsonKey(name: 'meta') required NySnySensorMeta meta,
  }) = _NySnySensor;

  factory NySnySensor.fromJson(Map<String, Object?> json) =>
      _$NySnySensorFromJson(json);

  SnowState toSnowState() {
    return SnowState(
      location: meta.name,
      depth: data.depth.toInt(),
      elevation: int.tryParse(meta.alt) ?? 0,
      equivalent: data.load.toInt(),
      temperature: data.airtemp,
      lastUpdated: data.time,
      nextUpdate: data.nextTime,
    );
  }
}

@freezed
sealed class NySnySensorMeta with _$NySnySensorMeta {
  const NySnySensorMeta._();
  const factory NySnySensorMeta({
    @JsonKey(name: 'locationname') required String name,
    @JsonKey(
      name: 'active',
      fromJson: _boolFromString,
      toJson: _boolToString,
    )
    required bool active,
    @JsonKey(name: 'road') required String road,
    @JsonKey(name: 'lat') required String lat,
    @JsonKey(name: 'lon') required String lon,
    @JsonKey(name: 'moh') required String alt,
  }) = _NySnySensorMeta;

  factory NySnySensorMeta.fromJson(Map<String, Object?> json) =>
      _$NySnySensorMetaFromJson(json);
}

@freezed
sealed class NySnySensorData with _$NySnySensorData {
  const NySnySensorData._();
  const factory NySnySensorData({
    @JsonKey(name: 'time') required DateTime time,
    @JsonKey(name: 'snowdept') required double depth,
    @JsonKey(name: 'loadsqm') required double load,
    @JsonKey(name: 'airtemp') required double airtemp,
    @JsonKey(name: 'voltage') required double voltage,
    @JsonKey(name: 'nexttime') required DateTime nextTime,
    @JsonKey(
      name: 'valid',
      fromJson: _boolFromString,
      toJson: _boolToString,
    )
    required bool valid,
    @JsonKey(
      name: 'badreading',
      fromJson: _boolFromString,
      toJson: _boolToString,
    )
    required bool badReading,
  }) = _NySnySensorData;

  factory NySnySensorData.fromJson(Map<String, Object?> json) =>
      _$NySnySensorDataFromJson(json);
}

bool _boolFromString(dynamic value) {
  return value == "1" || value == 1;
}

String _boolToString(bool value) {
  return value ? "1" : "0";
}
