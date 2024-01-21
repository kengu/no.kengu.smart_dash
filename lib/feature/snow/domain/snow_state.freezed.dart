// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'snow_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SnowState _$SnowStateFromJson(Map<String, dynamic> json) {
  return _SnowState.fromJson(json);
}

/// @nodoc
mixin _$SnowState {
  /// Measurement location
  @JsonKey(name: 'location')
  String get location => throw _privateConstructorUsedError;

  /// Snow depth in cm
  @JsonKey(name: 'depth')
  int get depth => throw _privateConstructorUsedError;

  /// Elevation above sea level
  @JsonKey(name: 'elevation')
  int get elevation => throw _privateConstructorUsedError;

  /// Water equivalent if all snow was melted (in kg/m2)
  @JsonKey(name: 'equivalent')
  int get equivalent => throw _privateConstructorUsedError;

  /// Air temperature at measurement time (in °C)
  @JsonKey(name: 'temperature')
  double get temperature => throw _privateConstructorUsedError;

  /// Time of next scheduled measurement update
  @JsonKey(name: 'nextUpdate')
  DateTime get nextUpdate => throw _privateConstructorUsedError;

  /// Time of current measurement update
  @JsonKey(name: 'lastUpdated')
  DateTime get lastUpdated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SnowStateCopyWith<SnowState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SnowStateCopyWith<$Res> {
  factory $SnowStateCopyWith(SnowState value, $Res Function(SnowState) then) =
      _$SnowStateCopyWithImpl<$Res, SnowState>;
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
class _$SnowStateCopyWithImpl<$Res, $Val extends SnowState>
    implements $SnowStateCopyWith<$Res> {
  _$SnowStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      depth: null == depth
          ? _value.depth
          : depth // ignore: cast_nullable_to_non_nullable
              as int,
      elevation: null == elevation
          ? _value.elevation
          : elevation // ignore: cast_nullable_to_non_nullable
              as int,
      equivalent: null == equivalent
          ? _value.equivalent
          : equivalent // ignore: cast_nullable_to_non_nullable
              as int,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      nextUpdate: null == nextUpdate
          ? _value.nextUpdate
          : nextUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SnowStateImplCopyWith<$Res>
    implements $SnowStateCopyWith<$Res> {
  factory _$$SnowStateImplCopyWith(
          _$SnowStateImpl value, $Res Function(_$SnowStateImpl) then) =
      __$$SnowStateImplCopyWithImpl<$Res>;
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
class __$$SnowStateImplCopyWithImpl<$Res>
    extends _$SnowStateCopyWithImpl<$Res, _$SnowStateImpl>
    implements _$$SnowStateImplCopyWith<$Res> {
  __$$SnowStateImplCopyWithImpl(
      _$SnowStateImpl _value, $Res Function(_$SnowStateImpl) _then)
      : super(_value, _then);

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
    return _then(_$SnowStateImpl(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      depth: null == depth
          ? _value.depth
          : depth // ignore: cast_nullable_to_non_nullable
              as int,
      elevation: null == elevation
          ? _value.elevation
          : elevation // ignore: cast_nullable_to_non_nullable
              as int,
      equivalent: null == equivalent
          ? _value.equivalent
          : equivalent // ignore: cast_nullable_to_non_nullable
              as int,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      nextUpdate: null == nextUpdate
          ? _value.nextUpdate
          : nextUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SnowStateImpl extends _SnowState {
  const _$SnowStateImpl(
      {@JsonKey(name: 'location') required this.location,
      @JsonKey(name: 'depth') required this.depth,
      @JsonKey(name: 'elevation') required this.elevation,
      @JsonKey(name: 'equivalent') required this.equivalent,
      @JsonKey(name: 'temperature') required this.temperature,
      @JsonKey(name: 'nextUpdate') required this.nextUpdate,
      @JsonKey(name: 'lastUpdated') required this.lastUpdated})
      : super._();

  factory _$SnowStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$SnowStateImplFromJson(json);

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

  @override
  String toString() {
    return 'SnowState(location: $location, depth: $depth, elevation: $elevation, equivalent: $equivalent, temperature: $temperature, nextUpdate: $nextUpdate, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SnowStateImpl &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, location, depth, elevation,
      equivalent, temperature, nextUpdate, lastUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SnowStateImplCopyWith<_$SnowStateImpl> get copyWith =>
      __$$SnowStateImplCopyWithImpl<_$SnowStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SnowStateImplToJson(
      this,
    );
  }
}

abstract class _SnowState extends SnowState {
  const factory _SnowState(
          {@JsonKey(name: 'location') required final String location,
          @JsonKey(name: 'depth') required final int depth,
          @JsonKey(name: 'elevation') required final int elevation,
          @JsonKey(name: 'equivalent') required final int equivalent,
          @JsonKey(name: 'temperature') required final double temperature,
          @JsonKey(name: 'nextUpdate') required final DateTime nextUpdate,
          @JsonKey(name: 'lastUpdated') required final DateTime lastUpdated}) =
      _$SnowStateImpl;
  const _SnowState._() : super._();

  factory _SnowState.fromJson(Map<String, dynamic> json) =
      _$SnowStateImpl.fromJson;

  @override

  /// Measurement location
  @JsonKey(name: 'location')
  String get location;
  @override

  /// Snow depth in cm
  @JsonKey(name: 'depth')
  int get depth;
  @override

  /// Elevation above sea level
  @JsonKey(name: 'elevation')
  int get elevation;
  @override

  /// Water equivalent if all snow was melted (in kg/m2)
  @JsonKey(name: 'equivalent')
  int get equivalent;
  @override

  /// Air temperature at measurement time (in °C)
  @JsonKey(name: 'temperature')
  double get temperature;
  @override

  /// Time of next scheduled measurement update
  @JsonKey(name: 'nextUpdate')
  DateTime get nextUpdate;
  @override

  /// Time of current measurement update
  @JsonKey(name: 'lastUpdated')
  DateTime get lastUpdated;
  @override
  @JsonKey(ignore: true)
  _$$SnowStateImplCopyWith<_$SnowStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
