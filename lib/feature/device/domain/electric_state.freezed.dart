// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'electric_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ElectricState _$ElectricStateFromJson(Map<String, dynamic> json) {
  return _ElectricState.fromJson(json);
}

/// @nodoc
mixin _$ElectricState {
  /// Get device's measured voltage (in V, default null)
  int? get voltage => throw _privateConstructorUsedError;

  /// Last measured power usage (watt)
  int? get currentPower => throw _privateConstructorUsedError;

  /// Energy accumulated from start (in watt/h, default null)
  int? get cumulative => throw _privateConstructorUsedError;

  /// Energy accumulated from midnight (in watt/h, default null)
  int? get cumulativeToday => throw _privateConstructorUsedError;

  /// Flag indicating that power is currently regulated (up or down)
  bool? get isPowerRegulated => throw _privateConstructorUsedError;

  /// Last estimated regulated power usage reduction (in negative watts)
  int? get estimatedRegulatedPower => throw _privateConstructorUsedError;

  /// Last estimated unregulated power usage (watt)
  int? get estimatedUnregulatedPower => throw _privateConstructorUsedError;

  /// [DateTime] timestamp of when data was updated last
  DateTime get lastUpdated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ElectricStateCopyWith<ElectricState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ElectricStateCopyWith<$Res> {
  factory $ElectricStateCopyWith(
          ElectricState value, $Res Function(ElectricState) then) =
      _$ElectricStateCopyWithImpl<$Res, ElectricState>;
  @useResult
  $Res call(
      {int? voltage,
      int? currentPower,
      int? cumulative,
      int? cumulativeToday,
      bool? isPowerRegulated,
      int? estimatedRegulatedPower,
      int? estimatedUnregulatedPower,
      DateTime lastUpdated});
}

/// @nodoc
class _$ElectricStateCopyWithImpl<$Res, $Val extends ElectricState>
    implements $ElectricStateCopyWith<$Res> {
  _$ElectricStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? voltage = freezed,
    Object? currentPower = freezed,
    Object? cumulative = freezed,
    Object? cumulativeToday = freezed,
    Object? isPowerRegulated = freezed,
    Object? estimatedRegulatedPower = freezed,
    Object? estimatedUnregulatedPower = freezed,
    Object? lastUpdated = null,
  }) {
    return _then(_value.copyWith(
      voltage: freezed == voltage
          ? _value.voltage
          : voltage // ignore: cast_nullable_to_non_nullable
              as int?,
      currentPower: freezed == currentPower
          ? _value.currentPower
          : currentPower // ignore: cast_nullable_to_non_nullable
              as int?,
      cumulative: freezed == cumulative
          ? _value.cumulative
          : cumulative // ignore: cast_nullable_to_non_nullable
              as int?,
      cumulativeToday: freezed == cumulativeToday
          ? _value.cumulativeToday
          : cumulativeToday // ignore: cast_nullable_to_non_nullable
              as int?,
      isPowerRegulated: freezed == isPowerRegulated
          ? _value.isPowerRegulated
          : isPowerRegulated // ignore: cast_nullable_to_non_nullable
              as bool?,
      estimatedRegulatedPower: freezed == estimatedRegulatedPower
          ? _value.estimatedRegulatedPower
          : estimatedRegulatedPower // ignore: cast_nullable_to_non_nullable
              as int?,
      estimatedUnregulatedPower: freezed == estimatedUnregulatedPower
          ? _value.estimatedUnregulatedPower
          : estimatedUnregulatedPower // ignore: cast_nullable_to_non_nullable
              as int?,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ElectricStateImplCopyWith<$Res>
    implements $ElectricStateCopyWith<$Res> {
  factory _$$ElectricStateImplCopyWith(
          _$ElectricStateImpl value, $Res Function(_$ElectricStateImpl) then) =
      __$$ElectricStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? voltage,
      int? currentPower,
      int? cumulative,
      int? cumulativeToday,
      bool? isPowerRegulated,
      int? estimatedRegulatedPower,
      int? estimatedUnregulatedPower,
      DateTime lastUpdated});
}

/// @nodoc
class __$$ElectricStateImplCopyWithImpl<$Res>
    extends _$ElectricStateCopyWithImpl<$Res, _$ElectricStateImpl>
    implements _$$ElectricStateImplCopyWith<$Res> {
  __$$ElectricStateImplCopyWithImpl(
      _$ElectricStateImpl _value, $Res Function(_$ElectricStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? voltage = freezed,
    Object? currentPower = freezed,
    Object? cumulative = freezed,
    Object? cumulativeToday = freezed,
    Object? isPowerRegulated = freezed,
    Object? estimatedRegulatedPower = freezed,
    Object? estimatedUnregulatedPower = freezed,
    Object? lastUpdated = null,
  }) {
    return _then(_$ElectricStateImpl(
      voltage: freezed == voltage
          ? _value.voltage
          : voltage // ignore: cast_nullable_to_non_nullable
              as int?,
      currentPower: freezed == currentPower
          ? _value.currentPower
          : currentPower // ignore: cast_nullable_to_non_nullable
              as int?,
      cumulative: freezed == cumulative
          ? _value.cumulative
          : cumulative // ignore: cast_nullable_to_non_nullable
              as int?,
      cumulativeToday: freezed == cumulativeToday
          ? _value.cumulativeToday
          : cumulativeToday // ignore: cast_nullable_to_non_nullable
              as int?,
      isPowerRegulated: freezed == isPowerRegulated
          ? _value.isPowerRegulated
          : isPowerRegulated // ignore: cast_nullable_to_non_nullable
              as bool?,
      estimatedRegulatedPower: freezed == estimatedRegulatedPower
          ? _value.estimatedRegulatedPower
          : estimatedRegulatedPower // ignore: cast_nullable_to_non_nullable
              as int?,
      estimatedUnregulatedPower: freezed == estimatedUnregulatedPower
          ? _value.estimatedUnregulatedPower
          : estimatedUnregulatedPower // ignore: cast_nullable_to_non_nullable
              as int?,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ElectricStateImpl extends _ElectricState {
  const _$ElectricStateImpl(
      {this.voltage,
      this.currentPower,
      this.cumulative,
      this.cumulativeToday,
      this.isPowerRegulated,
      this.estimatedRegulatedPower,
      this.estimatedUnregulatedPower,
      required this.lastUpdated})
      : super._();

  factory _$ElectricStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ElectricStateImplFromJson(json);

  /// Get device's measured voltage (in V, default null)
  @override
  final int? voltage;

  /// Last measured power usage (watt)
  @override
  final int? currentPower;

  /// Energy accumulated from start (in watt/h, default null)
  @override
  final int? cumulative;

  /// Energy accumulated from midnight (in watt/h, default null)
  @override
  final int? cumulativeToday;

  /// Flag indicating that power is currently regulated (up or down)
  @override
  final bool? isPowerRegulated;

  /// Last estimated regulated power usage reduction (in negative watts)
  @override
  final int? estimatedRegulatedPower;

  /// Last estimated unregulated power usage (watt)
  @override
  final int? estimatedUnregulatedPower;

  /// [DateTime] timestamp of when data was updated last
  @override
  final DateTime lastUpdated;

  @override
  String toString() {
    return 'ElectricState(voltage: $voltage, currentPower: $currentPower, cumulative: $cumulative, cumulativeToday: $cumulativeToday, isPowerRegulated: $isPowerRegulated, estimatedRegulatedPower: $estimatedRegulatedPower, estimatedUnregulatedPower: $estimatedUnregulatedPower, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ElectricStateImpl &&
            (identical(other.voltage, voltage) || other.voltage == voltage) &&
            (identical(other.currentPower, currentPower) ||
                other.currentPower == currentPower) &&
            (identical(other.cumulative, cumulative) ||
                other.cumulative == cumulative) &&
            (identical(other.cumulativeToday, cumulativeToday) ||
                other.cumulativeToday == cumulativeToday) &&
            (identical(other.isPowerRegulated, isPowerRegulated) ||
                other.isPowerRegulated == isPowerRegulated) &&
            (identical(
                    other.estimatedRegulatedPower, estimatedRegulatedPower) ||
                other.estimatedRegulatedPower == estimatedRegulatedPower) &&
            (identical(other.estimatedUnregulatedPower,
                    estimatedUnregulatedPower) ||
                other.estimatedUnregulatedPower == estimatedUnregulatedPower) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      voltage,
      currentPower,
      cumulative,
      cumulativeToday,
      isPowerRegulated,
      estimatedRegulatedPower,
      estimatedUnregulatedPower,
      lastUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ElectricStateImplCopyWith<_$ElectricStateImpl> get copyWith =>
      __$$ElectricStateImplCopyWithImpl<_$ElectricStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ElectricStateImplToJson(
      this,
    );
  }
}

abstract class _ElectricState extends ElectricState {
  const factory _ElectricState(
      {final int? voltage,
      final int? currentPower,
      final int? cumulative,
      final int? cumulativeToday,
      final bool? isPowerRegulated,
      final int? estimatedRegulatedPower,
      final int? estimatedUnregulatedPower,
      required final DateTime lastUpdated}) = _$ElectricStateImpl;
  const _ElectricState._() : super._();

  factory _ElectricState.fromJson(Map<String, dynamic> json) =
      _$ElectricStateImpl.fromJson;

  @override

  /// Get device's measured voltage (in V, default null)
  int? get voltage;
  @override

  /// Last measured power usage (watt)
  int? get currentPower;
  @override

  /// Energy accumulated from start (in watt/h, default null)
  int? get cumulative;
  @override

  /// Energy accumulated from midnight (in watt/h, default null)
  int? get cumulativeToday;
  @override

  /// Flag indicating that power is currently regulated (up or down)
  bool? get isPowerRegulated;
  @override

  /// Last estimated regulated power usage reduction (in negative watts)
  int? get estimatedRegulatedPower;
  @override

  /// Last estimated unregulated power usage (watt)
  int? get estimatedUnregulatedPower;
  @override

  /// [DateTime] timestamp of when data was updated last
  DateTime get lastUpdated;
  @override
  @JsonKey(ignore: true)
  _$$ElectricStateImplCopyWith<_$ElectricStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
