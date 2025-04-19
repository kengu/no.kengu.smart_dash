// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nysny_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NySnySensor {
  @JsonKey(name: 'id')
  String get id;
  @JsonKey(name: 'data')
  NySnySensorData get data;
  @JsonKey(name: 'meta')
  NySnySensorMeta get meta;

  /// Create a copy of NySnySensor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NySnySensorCopyWith<NySnySensor> get copyWith =>
      _$NySnySensorCopyWithImpl<NySnySensor>(this as NySnySensor, _$identity);

  /// Serializes this NySnySensor to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NySnySensor &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, data, meta);

  @override
  String toString() {
    return 'NySnySensor(id: $id, data: $data, meta: $meta)';
  }
}

/// @nodoc
abstract mixin class $NySnySensorCopyWith<$Res> {
  factory $NySnySensorCopyWith(
          NySnySensor value, $Res Function(NySnySensor) _then) =
      _$NySnySensorCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'data') NySnySensorData data,
      @JsonKey(name: 'meta') NySnySensorMeta meta});

  $NySnySensorDataCopyWith<$Res> get data;
  $NySnySensorMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$NySnySensorCopyWithImpl<$Res> implements $NySnySensorCopyWith<$Res> {
  _$NySnySensorCopyWithImpl(this._self, this._then);

  final NySnySensor _self;
  final $Res Function(NySnySensor) _then;

  /// Create a copy of NySnySensor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? data = null,
    Object? meta = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as NySnySensorData,
      meta: null == meta
          ? _self.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as NySnySensorMeta,
    ));
  }

  /// Create a copy of NySnySensor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NySnySensorDataCopyWith<$Res> get data {
    return $NySnySensorDataCopyWith<$Res>(_self.data, (value) {
      return _then(_self.copyWith(data: value));
    });
  }

  /// Create a copy of NySnySensor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NySnySensorMetaCopyWith<$Res> get meta {
    return $NySnySensorMetaCopyWith<$Res>(_self.meta, (value) {
      return _then(_self.copyWith(meta: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _NySnySensor extends NySnySensor {
  const _NySnySensor(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'data') required this.data,
      @JsonKey(name: 'meta') required this.meta})
      : super._();
  factory _NySnySensor.fromJson(Map<String, dynamic> json) =>
      _$NySnySensorFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'data')
  final NySnySensorData data;
  @override
  @JsonKey(name: 'meta')
  final NySnySensorMeta meta;

  /// Create a copy of NySnySensor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NySnySensorCopyWith<_NySnySensor> get copyWith =>
      __$NySnySensorCopyWithImpl<_NySnySensor>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NySnySensorToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NySnySensor &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, data, meta);

  @override
  String toString() {
    return 'NySnySensor(id: $id, data: $data, meta: $meta)';
  }
}

/// @nodoc
abstract mixin class _$NySnySensorCopyWith<$Res>
    implements $NySnySensorCopyWith<$Res> {
  factory _$NySnySensorCopyWith(
          _NySnySensor value, $Res Function(_NySnySensor) _then) =
      __$NySnySensorCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'data') NySnySensorData data,
      @JsonKey(name: 'meta') NySnySensorMeta meta});

  @override
  $NySnySensorDataCopyWith<$Res> get data;
  @override
  $NySnySensorMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$NySnySensorCopyWithImpl<$Res> implements _$NySnySensorCopyWith<$Res> {
  __$NySnySensorCopyWithImpl(this._self, this._then);

  final _NySnySensor _self;
  final $Res Function(_NySnySensor) _then;

  /// Create a copy of NySnySensor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? data = null,
    Object? meta = null,
  }) {
    return _then(_NySnySensor(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as NySnySensorData,
      meta: null == meta
          ? _self.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as NySnySensorMeta,
    ));
  }

  /// Create a copy of NySnySensor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NySnySensorDataCopyWith<$Res> get data {
    return $NySnySensorDataCopyWith<$Res>(_self.data, (value) {
      return _then(_self.copyWith(data: value));
    });
  }

  /// Create a copy of NySnySensor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NySnySensorMetaCopyWith<$Res> get meta {
    return $NySnySensorMetaCopyWith<$Res>(_self.meta, (value) {
      return _then(_self.copyWith(meta: value));
    });
  }
}

/// @nodoc
mixin _$NySnySensorMeta {
  @JsonKey(name: 'locationname')
  String get name;
  @JsonKey(name: 'active', fromJson: _boolFromString, toJson: _boolToString)
  bool get active;
  @JsonKey(name: 'road')
  String get road;
  @JsonKey(name: 'lat')
  String get lat;
  @JsonKey(name: 'lon')
  String get lon;
  @JsonKey(name: 'moh')
  String get alt;

  /// Create a copy of NySnySensorMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NySnySensorMetaCopyWith<NySnySensorMeta> get copyWith =>
      _$NySnySensorMetaCopyWithImpl<NySnySensorMeta>(
          this as NySnySensorMeta, _$identity);

  /// Serializes this NySnySensorMeta to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NySnySensorMeta &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.road, road) || other.road == road) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.alt, alt) || other.alt == alt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, active, road, lat, lon, alt);

  @override
  String toString() {
    return 'NySnySensorMeta(name: $name, active: $active, road: $road, lat: $lat, lon: $lon, alt: $alt)';
  }
}

/// @nodoc
abstract mixin class $NySnySensorMetaCopyWith<$Res> {
  factory $NySnySensorMetaCopyWith(
          NySnySensorMeta value, $Res Function(NySnySensorMeta) _then) =
      _$NySnySensorMetaCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'locationname') String name,
      @JsonKey(name: 'active', fromJson: _boolFromString, toJson: _boolToString)
      bool active,
      @JsonKey(name: 'road') String road,
      @JsonKey(name: 'lat') String lat,
      @JsonKey(name: 'lon') String lon,
      @JsonKey(name: 'moh') String alt});
}

/// @nodoc
class _$NySnySensorMetaCopyWithImpl<$Res>
    implements $NySnySensorMetaCopyWith<$Res> {
  _$NySnySensorMetaCopyWithImpl(this._self, this._then);

  final NySnySensorMeta _self;
  final $Res Function(NySnySensorMeta) _then;

  /// Create a copy of NySnySensorMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? active = null,
    Object? road = null,
    Object? lat = null,
    Object? lon = null,
    Object? alt = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _self.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      road: null == road
          ? _self.road
          : road // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String,
      lon: null == lon
          ? _self.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as String,
      alt: null == alt
          ? _self.alt
          : alt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _NySnySensorMeta extends NySnySensorMeta {
  const _NySnySensorMeta(
      {@JsonKey(name: 'locationname') required this.name,
      @JsonKey(name: 'active', fromJson: _boolFromString, toJson: _boolToString)
      required this.active,
      @JsonKey(name: 'road') required this.road,
      @JsonKey(name: 'lat') required this.lat,
      @JsonKey(name: 'lon') required this.lon,
      @JsonKey(name: 'moh') required this.alt})
      : super._();
  factory _NySnySensorMeta.fromJson(Map<String, dynamic> json) =>
      _$NySnySensorMetaFromJson(json);

  @override
  @JsonKey(name: 'locationname')
  final String name;
  @override
  @JsonKey(name: 'active', fromJson: _boolFromString, toJson: _boolToString)
  final bool active;
  @override
  @JsonKey(name: 'road')
  final String road;
  @override
  @JsonKey(name: 'lat')
  final String lat;
  @override
  @JsonKey(name: 'lon')
  final String lon;
  @override
  @JsonKey(name: 'moh')
  final String alt;

  /// Create a copy of NySnySensorMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NySnySensorMetaCopyWith<_NySnySensorMeta> get copyWith =>
      __$NySnySensorMetaCopyWithImpl<_NySnySensorMeta>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NySnySensorMetaToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NySnySensorMeta &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.road, road) || other.road == road) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.alt, alt) || other.alt == alt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, active, road, lat, lon, alt);

  @override
  String toString() {
    return 'NySnySensorMeta(name: $name, active: $active, road: $road, lat: $lat, lon: $lon, alt: $alt)';
  }
}

/// @nodoc
abstract mixin class _$NySnySensorMetaCopyWith<$Res>
    implements $NySnySensorMetaCopyWith<$Res> {
  factory _$NySnySensorMetaCopyWith(
          _NySnySensorMeta value, $Res Function(_NySnySensorMeta) _then) =
      __$NySnySensorMetaCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'locationname') String name,
      @JsonKey(name: 'active', fromJson: _boolFromString, toJson: _boolToString)
      bool active,
      @JsonKey(name: 'road') String road,
      @JsonKey(name: 'lat') String lat,
      @JsonKey(name: 'lon') String lon,
      @JsonKey(name: 'moh') String alt});
}

/// @nodoc
class __$NySnySensorMetaCopyWithImpl<$Res>
    implements _$NySnySensorMetaCopyWith<$Res> {
  __$NySnySensorMetaCopyWithImpl(this._self, this._then);

  final _NySnySensorMeta _self;
  final $Res Function(_NySnySensorMeta) _then;

  /// Create a copy of NySnySensorMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? active = null,
    Object? road = null,
    Object? lat = null,
    Object? lon = null,
    Object? alt = null,
  }) {
    return _then(_NySnySensorMeta(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _self.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      road: null == road
          ? _self.road
          : road // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String,
      lon: null == lon
          ? _self.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as String,
      alt: null == alt
          ? _self.alt
          : alt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$NySnySensorData {
  @JsonKey(name: 'time')
  DateTime get time;
  @JsonKey(name: 'snowdept')
  double get depth;
  @JsonKey(name: 'loadsqm')
  double get load;
  @JsonKey(name: 'airtemp')
  double get airtemp;
  @JsonKey(name: 'voltage')
  double get voltage;
  @JsonKey(name: 'nexttime')
  DateTime get nextTime;
  @JsonKey(name: 'valid', fromJson: _boolFromString, toJson: _boolToString)
  bool get valid;
  @JsonKey(name: 'badreading', fromJson: _boolFromString, toJson: _boolToString)
  bool get badReading;

  /// Create a copy of NySnySensorData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NySnySensorDataCopyWith<NySnySensorData> get copyWith =>
      _$NySnySensorDataCopyWithImpl<NySnySensorData>(
          this as NySnySensorData, _$identity);

  /// Serializes this NySnySensorData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NySnySensorData &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.depth, depth) || other.depth == depth) &&
            (identical(other.load, load) || other.load == load) &&
            (identical(other.airtemp, airtemp) || other.airtemp == airtemp) &&
            (identical(other.voltage, voltage) || other.voltage == voltage) &&
            (identical(other.nextTime, nextTime) ||
                other.nextTime == nextTime) &&
            (identical(other.valid, valid) || other.valid == valid) &&
            (identical(other.badReading, badReading) ||
                other.badReading == badReading));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, time, depth, load, airtemp,
      voltage, nextTime, valid, badReading);

  @override
  String toString() {
    return 'NySnySensorData(time: $time, depth: $depth, load: $load, airtemp: $airtemp, voltage: $voltage, nextTime: $nextTime, valid: $valid, badReading: $badReading)';
  }
}

/// @nodoc
abstract mixin class $NySnySensorDataCopyWith<$Res> {
  factory $NySnySensorDataCopyWith(
          NySnySensorData value, $Res Function(NySnySensorData) _then) =
      _$NySnySensorDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'time') DateTime time,
      @JsonKey(name: 'snowdept') double depth,
      @JsonKey(name: 'loadsqm') double load,
      @JsonKey(name: 'airtemp') double airtemp,
      @JsonKey(name: 'voltage') double voltage,
      @JsonKey(name: 'nexttime') DateTime nextTime,
      @JsonKey(name: 'valid', fromJson: _boolFromString, toJson: _boolToString)
      bool valid,
      @JsonKey(
          name: 'badreading', fromJson: _boolFromString, toJson: _boolToString)
      bool badReading});
}

/// @nodoc
class _$NySnySensorDataCopyWithImpl<$Res>
    implements $NySnySensorDataCopyWith<$Res> {
  _$NySnySensorDataCopyWithImpl(this._self, this._then);

  final NySnySensorData _self;
  final $Res Function(NySnySensorData) _then;

  /// Create a copy of NySnySensorData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? depth = null,
    Object? load = null,
    Object? airtemp = null,
    Object? voltage = null,
    Object? nextTime = null,
    Object? valid = null,
    Object? badReading = null,
  }) {
    return _then(_self.copyWith(
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      depth: null == depth
          ? _self.depth
          : depth // ignore: cast_nullable_to_non_nullable
              as double,
      load: null == load
          ? _self.load
          : load // ignore: cast_nullable_to_non_nullable
              as double,
      airtemp: null == airtemp
          ? _self.airtemp
          : airtemp // ignore: cast_nullable_to_non_nullable
              as double,
      voltage: null == voltage
          ? _self.voltage
          : voltage // ignore: cast_nullable_to_non_nullable
              as double,
      nextTime: null == nextTime
          ? _self.nextTime
          : nextTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      valid: null == valid
          ? _self.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as bool,
      badReading: null == badReading
          ? _self.badReading
          : badReading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _NySnySensorData extends NySnySensorData {
  const _NySnySensorData(
      {@JsonKey(name: 'time') required this.time,
      @JsonKey(name: 'snowdept') required this.depth,
      @JsonKey(name: 'loadsqm') required this.load,
      @JsonKey(name: 'airtemp') required this.airtemp,
      @JsonKey(name: 'voltage') required this.voltage,
      @JsonKey(name: 'nexttime') required this.nextTime,
      @JsonKey(name: 'valid', fromJson: _boolFromString, toJson: _boolToString)
      required this.valid,
      @JsonKey(
          name: 'badreading', fromJson: _boolFromString, toJson: _boolToString)
      required this.badReading})
      : super._();
  factory _NySnySensorData.fromJson(Map<String, dynamic> json) =>
      _$NySnySensorDataFromJson(json);

  @override
  @JsonKey(name: 'time')
  final DateTime time;
  @override
  @JsonKey(name: 'snowdept')
  final double depth;
  @override
  @JsonKey(name: 'loadsqm')
  final double load;
  @override
  @JsonKey(name: 'airtemp')
  final double airtemp;
  @override
  @JsonKey(name: 'voltage')
  final double voltage;
  @override
  @JsonKey(name: 'nexttime')
  final DateTime nextTime;
  @override
  @JsonKey(name: 'valid', fromJson: _boolFromString, toJson: _boolToString)
  final bool valid;
  @override
  @JsonKey(name: 'badreading', fromJson: _boolFromString, toJson: _boolToString)
  final bool badReading;

  /// Create a copy of NySnySensorData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NySnySensorDataCopyWith<_NySnySensorData> get copyWith =>
      __$NySnySensorDataCopyWithImpl<_NySnySensorData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NySnySensorDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NySnySensorData &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.depth, depth) || other.depth == depth) &&
            (identical(other.load, load) || other.load == load) &&
            (identical(other.airtemp, airtemp) || other.airtemp == airtemp) &&
            (identical(other.voltage, voltage) || other.voltage == voltage) &&
            (identical(other.nextTime, nextTime) ||
                other.nextTime == nextTime) &&
            (identical(other.valid, valid) || other.valid == valid) &&
            (identical(other.badReading, badReading) ||
                other.badReading == badReading));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, time, depth, load, airtemp,
      voltage, nextTime, valid, badReading);

  @override
  String toString() {
    return 'NySnySensorData(time: $time, depth: $depth, load: $load, airtemp: $airtemp, voltage: $voltage, nextTime: $nextTime, valid: $valid, badReading: $badReading)';
  }
}

/// @nodoc
abstract mixin class _$NySnySensorDataCopyWith<$Res>
    implements $NySnySensorDataCopyWith<$Res> {
  factory _$NySnySensorDataCopyWith(
          _NySnySensorData value, $Res Function(_NySnySensorData) _then) =
      __$NySnySensorDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'time') DateTime time,
      @JsonKey(name: 'snowdept') double depth,
      @JsonKey(name: 'loadsqm') double load,
      @JsonKey(name: 'airtemp') double airtemp,
      @JsonKey(name: 'voltage') double voltage,
      @JsonKey(name: 'nexttime') DateTime nextTime,
      @JsonKey(name: 'valid', fromJson: _boolFromString, toJson: _boolToString)
      bool valid,
      @JsonKey(
          name: 'badreading', fromJson: _boolFromString, toJson: _boolToString)
      bool badReading});
}

/// @nodoc
class __$NySnySensorDataCopyWithImpl<$Res>
    implements _$NySnySensorDataCopyWith<$Res> {
  __$NySnySensorDataCopyWithImpl(this._self, this._then);

  final _NySnySensorData _self;
  final $Res Function(_NySnySensorData) _then;

  /// Create a copy of NySnySensorData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? time = null,
    Object? depth = null,
    Object? load = null,
    Object? airtemp = null,
    Object? voltage = null,
    Object? nextTime = null,
    Object? valid = null,
    Object? badReading = null,
  }) {
    return _then(_NySnySensorData(
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      depth: null == depth
          ? _self.depth
          : depth // ignore: cast_nullable_to_non_nullable
              as double,
      load: null == load
          ? _self.load
          : load // ignore: cast_nullable_to_non_nullable
              as double,
      airtemp: null == airtemp
          ? _self.airtemp
          : airtemp // ignore: cast_nullable_to_non_nullable
              as double,
      voltage: null == voltage
          ? _self.voltage
          : voltage // ignore: cast_nullable_to_non_nullable
              as double,
      nextTime: null == nextTime
          ? _self.nextTime
          : nextTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      valid: null == valid
          ? _self.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as bool,
      badReading: null == badReading
          ? _self.badReading
          : badReading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
