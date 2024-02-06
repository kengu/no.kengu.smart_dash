// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thermostat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Thermostat _$ThermostatFromJson(Map<String, dynamic> json) {
  return _Thermostat.fromJson(json);
}

/// @nodoc
mixin _$Thermostat {
  /// Thermostat target temperature when switched on
  double? get temperatureTarget => throw _privateConstructorUsedError;

  /// Minimum allowed temperature (default null)
  double? get temperatureMin => throw _privateConstructorUsedError;

  /// Maximum allowed temperature (default null)
  double? get temperatureMax => throw _privateConstructorUsedError;

  /// Thermostat target temperature in [SwitchMode.eco]
  double? get temperatureEco => throw _privateConstructorUsedError;

  /// Thermostat target temperature in [SwitchMode.comfort]
  double? get temperatureComfort => throw _privateConstructorUsedError;

  /// The amount of temperature adjustment applied to
  /// [temperatureEco] when regulated
  double? get temperatureEcoAdjustment => throw _privateConstructorUsedError;

  /// The amount of temperature adjustment applied to
  /// [temperatureComfort] when regulated
  double? get temperatureComfortAdjustment =>
      throw _privateConstructorUsedError;

  /// [DateTime] timestamp of when data was updated last
  DateTime get lastUpdated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ThermostatCopyWith<Thermostat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThermostatCopyWith<$Res> {
  factory $ThermostatCopyWith(
          Thermostat value, $Res Function(Thermostat) then) =
      _$ThermostatCopyWithImpl<$Res, Thermostat>;
  @useResult
  $Res call(
      {double? temperatureTarget,
      double? temperatureMin,
      double? temperatureMax,
      double? temperatureEco,
      double? temperatureComfort,
      double? temperatureEcoAdjustment,
      double? temperatureComfortAdjustment,
      DateTime lastUpdated});
}

/// @nodoc
class _$ThermostatCopyWithImpl<$Res, $Val extends Thermostat>
    implements $ThermostatCopyWith<$Res> {
  _$ThermostatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperatureTarget = freezed,
    Object? temperatureMin = freezed,
    Object? temperatureMax = freezed,
    Object? temperatureEco = freezed,
    Object? temperatureComfort = freezed,
    Object? temperatureEcoAdjustment = freezed,
    Object? temperatureComfortAdjustment = freezed,
    Object? lastUpdated = null,
  }) {
    return _then(_value.copyWith(
      temperatureTarget: freezed == temperatureTarget
          ? _value.temperatureTarget
          : temperatureTarget // ignore: cast_nullable_to_non_nullable
              as double?,
      temperatureMin: freezed == temperatureMin
          ? _value.temperatureMin
          : temperatureMin // ignore: cast_nullable_to_non_nullable
              as double?,
      temperatureMax: freezed == temperatureMax
          ? _value.temperatureMax
          : temperatureMax // ignore: cast_nullable_to_non_nullable
              as double?,
      temperatureEco: freezed == temperatureEco
          ? _value.temperatureEco
          : temperatureEco // ignore: cast_nullable_to_non_nullable
              as double?,
      temperatureComfort: freezed == temperatureComfort
          ? _value.temperatureComfort
          : temperatureComfort // ignore: cast_nullable_to_non_nullable
              as double?,
      temperatureEcoAdjustment: freezed == temperatureEcoAdjustment
          ? _value.temperatureEcoAdjustment
          : temperatureEcoAdjustment // ignore: cast_nullable_to_non_nullable
              as double?,
      temperatureComfortAdjustment: freezed == temperatureComfortAdjustment
          ? _value.temperatureComfortAdjustment
          : temperatureComfortAdjustment // ignore: cast_nullable_to_non_nullable
              as double?,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThermostatImplCopyWith<$Res>
    implements $ThermostatCopyWith<$Res> {
  factory _$$ThermostatImplCopyWith(
          _$ThermostatImpl value, $Res Function(_$ThermostatImpl) then) =
      __$$ThermostatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? temperatureTarget,
      double? temperatureMin,
      double? temperatureMax,
      double? temperatureEco,
      double? temperatureComfort,
      double? temperatureEcoAdjustment,
      double? temperatureComfortAdjustment,
      DateTime lastUpdated});
}

/// @nodoc
class __$$ThermostatImplCopyWithImpl<$Res>
    extends _$ThermostatCopyWithImpl<$Res, _$ThermostatImpl>
    implements _$$ThermostatImplCopyWith<$Res> {
  __$$ThermostatImplCopyWithImpl(
      _$ThermostatImpl _value, $Res Function(_$ThermostatImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperatureTarget = freezed,
    Object? temperatureMin = freezed,
    Object? temperatureMax = freezed,
    Object? temperatureEco = freezed,
    Object? temperatureComfort = freezed,
    Object? temperatureEcoAdjustment = freezed,
    Object? temperatureComfortAdjustment = freezed,
    Object? lastUpdated = null,
  }) {
    return _then(_$ThermostatImpl(
      temperatureTarget: freezed == temperatureTarget
          ? _value.temperatureTarget
          : temperatureTarget // ignore: cast_nullable_to_non_nullable
              as double?,
      temperatureMin: freezed == temperatureMin
          ? _value.temperatureMin
          : temperatureMin // ignore: cast_nullable_to_non_nullable
              as double?,
      temperatureMax: freezed == temperatureMax
          ? _value.temperatureMax
          : temperatureMax // ignore: cast_nullable_to_non_nullable
              as double?,
      temperatureEco: freezed == temperatureEco
          ? _value.temperatureEco
          : temperatureEco // ignore: cast_nullable_to_non_nullable
              as double?,
      temperatureComfort: freezed == temperatureComfort
          ? _value.temperatureComfort
          : temperatureComfort // ignore: cast_nullable_to_non_nullable
              as double?,
      temperatureEcoAdjustment: freezed == temperatureEcoAdjustment
          ? _value.temperatureEcoAdjustment
          : temperatureEcoAdjustment // ignore: cast_nullable_to_non_nullable
              as double?,
      temperatureComfortAdjustment: freezed == temperatureComfortAdjustment
          ? _value.temperatureComfortAdjustment
          : temperatureComfortAdjustment // ignore: cast_nullable_to_non_nullable
              as double?,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ThermostatImpl extends _Thermostat {
  const _$ThermostatImpl(
      {this.temperatureTarget,
      this.temperatureMin,
      this.temperatureMax,
      this.temperatureEco,
      this.temperatureComfort,
      this.temperatureEcoAdjustment,
      this.temperatureComfortAdjustment,
      required this.lastUpdated})
      : super._();

  factory _$ThermostatImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThermostatImplFromJson(json);

  /// Thermostat target temperature when switched on
  @override
  final double? temperatureTarget;

  /// Minimum allowed temperature (default null)
  @override
  final double? temperatureMin;

  /// Maximum allowed temperature (default null)
  @override
  final double? temperatureMax;

  /// Thermostat target temperature in [SwitchMode.eco]
  @override
  final double? temperatureEco;

  /// Thermostat target temperature in [SwitchMode.comfort]
  @override
  final double? temperatureComfort;

  /// The amount of temperature adjustment applied to
  /// [temperatureEco] when regulated
  @override
  final double? temperatureEcoAdjustment;

  /// The amount of temperature adjustment applied to
  /// [temperatureComfort] when regulated
  @override
  final double? temperatureComfortAdjustment;

  /// [DateTime] timestamp of when data was updated last
  @override
  final DateTime lastUpdated;

  @override
  String toString() {
    return 'Thermostat(temperatureTarget: $temperatureTarget, temperatureMin: $temperatureMin, temperatureMax: $temperatureMax, temperatureEco: $temperatureEco, temperatureComfort: $temperatureComfort, temperatureEcoAdjustment: $temperatureEcoAdjustment, temperatureComfortAdjustment: $temperatureComfortAdjustment, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThermostatImpl &&
            (identical(other.temperatureTarget, temperatureTarget) ||
                other.temperatureTarget == temperatureTarget) &&
            (identical(other.temperatureMin, temperatureMin) ||
                other.temperatureMin == temperatureMin) &&
            (identical(other.temperatureMax, temperatureMax) ||
                other.temperatureMax == temperatureMax) &&
            (identical(other.temperatureEco, temperatureEco) ||
                other.temperatureEco == temperatureEco) &&
            (identical(other.temperatureComfort, temperatureComfort) ||
                other.temperatureComfort == temperatureComfort) &&
            (identical(
                    other.temperatureEcoAdjustment, temperatureEcoAdjustment) ||
                other.temperatureEcoAdjustment == temperatureEcoAdjustment) &&
            (identical(other.temperatureComfortAdjustment,
                    temperatureComfortAdjustment) ||
                other.temperatureComfortAdjustment ==
                    temperatureComfortAdjustment) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      temperatureTarget,
      temperatureMin,
      temperatureMax,
      temperatureEco,
      temperatureComfort,
      temperatureEcoAdjustment,
      temperatureComfortAdjustment,
      lastUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThermostatImplCopyWith<_$ThermostatImpl> get copyWith =>
      __$$ThermostatImplCopyWithImpl<_$ThermostatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ThermostatImplToJson(
      this,
    );
  }
}

abstract class _Thermostat extends Thermostat {
  const factory _Thermostat(
      {final double? temperatureTarget,
      final double? temperatureMin,
      final double? temperatureMax,
      final double? temperatureEco,
      final double? temperatureComfort,
      final double? temperatureEcoAdjustment,
      final double? temperatureComfortAdjustment,
      required final DateTime lastUpdated}) = _$ThermostatImpl;
  const _Thermostat._() : super._();

  factory _Thermostat.fromJson(Map<String, dynamic> json) =
      _$ThermostatImpl.fromJson;

  @override

  /// Thermostat target temperature when switched on
  double? get temperatureTarget;
  @override

  /// Minimum allowed temperature (default null)
  double? get temperatureMin;
  @override

  /// Maximum allowed temperature (default null)
  double? get temperatureMax;
  @override

  /// Thermostat target temperature in [SwitchMode.eco]
  double? get temperatureEco;
  @override

  /// Thermostat target temperature in [SwitchMode.comfort]
  double? get temperatureComfort;
  @override

  /// The amount of temperature adjustment applied to
  /// [temperatureEco] when regulated
  double? get temperatureEcoAdjustment;
  @override

  /// The amount of temperature adjustment applied to
  /// [temperatureComfort] when regulated
  double? get temperatureComfortAdjustment;
  @override

  /// [DateTime] timestamp of when data was updated last
  DateTime get lastUpdated;
  @override
  @JsonKey(ignore: true)
  _$$ThermostatImplCopyWith<_$ThermostatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
