// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'snow_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SnowState {
  /// Measurement location
  @JsonKey(name: 'location')
  String get location;

  /// Snow depth in cm
  @JsonKey(name: 'depth')
  int get depth;

  /// Elevation above sea level
  @JsonKey(name: 'elevation')
  int get elevation;

  /// Water equivalent if all snow was melted (in kg/m2)
  @JsonKey(name: 'equivalent')
  int get equivalent;

  /// Air temperature at measurement time (in °C)
  @JsonKey(name: 'temperature')
  double get temperature;

  /// Time of next scheduled measurement update
  @JsonKey(name: 'nextUpdate')
  DateTime get nextUpdate;

  /// Time of current measurement update
  @JsonKey(name: 'lastUpdated')
  DateTime get lastUpdated;

  /// Create a copy of SnowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SnowStateCopyWith<SnowState> get copyWith =>
      _$SnowStateCopyWithImpl<SnowState>(this as SnowState, _$identity);

  /// Serializes this SnowState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SnowState &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.depth, depth) || other.depth == depth) &&
            (identical(other.elevation, elevation) ||
                other.elevation == elevation) &&
            (identical(other.equivalent, equivalent) ||
                other.equivalent == equivalent) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.nextUpdate, nextUpdate) ||
                other.nextUpdate == nextUpdate) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, location, depth, elevation,
      equivalent, temperature, nextUpdate, lastUpdated);

  @override
  String toString() {
    return 'SnowState(location: $location, depth: $depth, elevation: $elevation, equivalent: $equivalent, temperature: $temperature, nextUpdate: $nextUpdate, lastUpdated: $lastUpdated)';
  }
}

/// @nodoc
abstract mixin class $SnowStateCopyWith<$Res> {
  factory $SnowStateCopyWith(SnowState value, $Res Function(SnowState) _then) =
      _$SnowStateCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'location') String location,
      @JsonKey(name: 'depth') int depth,
      @JsonKey(name: 'elevation') int elevation,
      @JsonKey(name: 'equivalent') int equivalent,
      @JsonKey(name: 'temperature') double temperature,
      @JsonKey(name: 'nextUpdate') DateTime nextUpdate,
      @JsonKey(name: 'lastUpdated') DateTime lastUpdated});
}

/// @nodoc
class _$SnowStateCopyWithImpl<$Res> implements $SnowStateCopyWith<$Res> {
  _$SnowStateCopyWithImpl(this._self, this._then);

  final SnowState _self;
  final $Res Function(SnowState) _then;

  /// Create a copy of SnowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? depth = null,
    Object? elevation = null,
    Object? equivalent = null,
    Object? temperature = null,
    Object? nextUpdate = null,
    Object? lastUpdated = null,
  }) {
    return _then(_self.copyWith(
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      depth: null == depth
          ? _self.depth
          : depth // ignore: cast_nullable_to_non_nullable
              as int,
      elevation: null == elevation
          ? _self.elevation
          : elevation // ignore: cast_nullable_to_non_nullable
              as int,
      equivalent: null == equivalent
          ? _self.equivalent
          : equivalent // ignore: cast_nullable_to_non_nullable
              as int,
      temperature: null == temperature
          ? _self.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      nextUpdate: null == nextUpdate
          ? _self.nextUpdate
          : nextUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastUpdated: null == lastUpdated
          ? _self.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SnowState extends SnowState {
  const _SnowState(
      {@JsonKey(name: 'location') required this.location,
      @JsonKey(name: 'depth') required this.depth,
      @JsonKey(name: 'elevation') required this.elevation,
      @JsonKey(name: 'equivalent') required this.equivalent,
      @JsonKey(name: 'temperature') required this.temperature,
      @JsonKey(name: 'nextUpdate') required this.nextUpdate,
      @JsonKey(name: 'lastUpdated') required this.lastUpdated})
      : super._();
  factory _SnowState.fromJson(Map<String, dynamic> json) =>
      _$SnowStateFromJson(json);

  /// Measurement location
  @override
  @JsonKey(name: 'location')
  final String location;

  /// Snow depth in cm
  @override
  @JsonKey(name: 'depth')
  final int depth;

  /// Elevation above sea level
  @override
  @JsonKey(name: 'elevation')
  final int elevation;

  /// Water equivalent if all snow was melted (in kg/m2)
  @override
  @JsonKey(name: 'equivalent')
  final int equivalent;

  /// Air temperature at measurement time (in °C)
  @override
  @JsonKey(name: 'temperature')
  final double temperature;

  /// Time of next scheduled measurement update
  @override
  @JsonKey(name: 'nextUpdate')
  final DateTime nextUpdate;

  /// Time of current measurement update
  @override
  @JsonKey(name: 'lastUpdated')
  final DateTime lastUpdated;

  /// Create a copy of SnowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SnowStateCopyWith<_SnowState> get copyWith =>
      __$SnowStateCopyWithImpl<_SnowState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SnowStateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SnowState &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.depth, depth) || other.depth == depth) &&
            (identical(other.elevation, elevation) ||
                other.elevation == elevation) &&
            (identical(other.equivalent, equivalent) ||
                other.equivalent == equivalent) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.nextUpdate, nextUpdate) ||
                other.nextUpdate == nextUpdate) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, location, depth, elevation,
      equivalent, temperature, nextUpdate, lastUpdated);

  @override
  String toString() {
    return 'SnowState(location: $location, depth: $depth, elevation: $elevation, equivalent: $equivalent, temperature: $temperature, nextUpdate: $nextUpdate, lastUpdated: $lastUpdated)';
  }
}

/// @nodoc
abstract mixin class _$SnowStateCopyWith<$Res>
    implements $SnowStateCopyWith<$Res> {
  factory _$SnowStateCopyWith(
          _SnowState value, $Res Function(_SnowState) _then) =
      __$SnowStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'location') String location,
      @JsonKey(name: 'depth') int depth,
      @JsonKey(name: 'elevation') int elevation,
      @JsonKey(name: 'equivalent') int equivalent,
      @JsonKey(name: 'temperature') double temperature,
      @JsonKey(name: 'nextUpdate') DateTime nextUpdate,
      @JsonKey(name: 'lastUpdated') DateTime lastUpdated});
}

/// @nodoc
class __$SnowStateCopyWithImpl<$Res> implements _$SnowStateCopyWith<$Res> {
  __$SnowStateCopyWithImpl(this._self, this._then);

  final _SnowState _self;
  final $Res Function(_SnowState) _then;

  /// Create a copy of SnowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? location = null,
    Object? depth = null,
    Object? elevation = null,
    Object? equivalent = null,
    Object? temperature = null,
    Object? nextUpdate = null,
    Object? lastUpdated = null,
  }) {
    return _then(_SnowState(
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      depth: null == depth
          ? _self.depth
          : depth // ignore: cast_nullable_to_non_nullable
              as int,
      elevation: null == elevation
          ? _self.elevation
          : elevation // ignore: cast_nullable_to_non_nullable
              as int,
      equivalent: null == equivalent
          ? _self.equivalent
          : equivalent // ignore: cast_nullable_to_non_nullable
              as int,
      temperature: null == temperature
          ? _self.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      nextUpdate: null == nextUpdate
          ? _self.nextUpdate
          : nextUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastUpdated: null == lastUpdated
          ? _self.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
