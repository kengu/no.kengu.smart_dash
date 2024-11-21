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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Thermostat _$ThermostatFromJson(Map<String, dynamic> json) {
  return _Thermostat.fromJson(json);
}

/// @nodoc
mixin _$Thermostat {
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

  /// Serializes this Thermostat to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Thermostat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      {double? temperatureMin,
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

  /// Create a copy of Thermostat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperatureMin = freezed,
    Object? temperatureMax = freezed,
    Object? temperatureEco = freezed,
    Object? temperatureComfort = freezed,
    Object? temperatureEcoAdjustment = freezed,
    Object? temperatureComfortAdjustment = freezed,
    Object? lastUpdated = null,
  }) {
    return _then(_value.copyWith(
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
      {double? temperatureMin,
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

  /// Create a copy of Thermostat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperatureMin = freezed,
    Object? temperatureMax = freezed,
    Object? temperatureEco = freezed,
    Object? temperatureComfort = freezed,
    Object? temperatureEcoAdjustment = freezed,
    Object? temperatureComfortAdjustment = freezed,
    Object? lastUpdated = null,
  }) {
    return _then(_$ThermostatImpl(
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
      {this.temperatureMin,
      this.temperatureMax,
      this.temperatureEco,
      this.temperatureComfort,
      this.temperatureEcoAdjustment,
      this.temperatureComfortAdjustment,
      required this.lastUpdated})
      : super._();

  factory _$ThermostatImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThermostatImplFromJson(json);

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
    return 'Thermostat(temperatureMin: $temperatureMin, temperatureMax: $temperatureMax, temperatureEco: $temperatureEco, temperatureComfort: $temperatureComfort, temperatureEcoAdjustment: $temperatureEcoAdjustment, temperatureComfortAdjustment: $temperatureComfortAdjustment, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThermostatImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      temperatureMin,
      temperatureMax,
      temperatureEco,
      temperatureComfort,
      temperatureEcoAdjustment,
      temperatureComfortAdjustment,
      lastUpdated);

  /// Create a copy of Thermostat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      {final double? temperatureMin,
      final double? temperatureMax,
      final double? temperatureEco,
      final double? temperatureComfort,
      final double? temperatureEcoAdjustment,
      final double? temperatureComfortAdjustment,
      required final DateTime lastUpdated}) = _$ThermostatImpl;
  const _Thermostat._() : super._();

  factory _Thermostat.fromJson(Map<String, dynamic> json) =
      _$ThermostatImpl.fromJson;

  /// Minimum allowed temperature (default null)
  @override
  double? get temperatureMin;

  /// Maximum allowed temperature (default null)
  @override
  double? get temperatureMax;

  /// Thermostat target temperature in [SwitchMode.eco]
  @override
  double? get temperatureEco;

  /// Thermostat target temperature in [SwitchMode.comfort]
  @override
  double? get temperatureComfort;

  /// The amount of temperature adjustment applied to
  /// [temperatureEco] when regulated
  @override
  double? get temperatureEcoAdjustment;

  /// The amount of temperature adjustment applied to
  /// [temperatureComfort] when regulated
  @override
  double? get temperatureComfortAdjustment;

  /// [DateTime] timestamp of when data was updated last
  @override
  DateTime get lastUpdated;

  /// Create a copy of Thermostat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThermostatImplCopyWith<_$ThermostatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
