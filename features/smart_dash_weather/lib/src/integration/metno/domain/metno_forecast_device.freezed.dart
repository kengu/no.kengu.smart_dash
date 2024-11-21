// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'metno_forecast_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MetNoForecastDevice _$MetNoForecastDeviceFromJson(Map<String, dynamic> json) {
  return _MetNoForecastDevice.fromJson(json);
}

/// @nodoc
mixin _$MetNoForecastDevice {
  @JsonKey(name: 'state')
  WeatherState get state => throw _privateConstructorUsedError;

  /// Serializes this MetNoForecastDevice to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MetNoForecastDevice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MetNoForecastDeviceCopyWith<MetNoForecastDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetNoForecastDeviceCopyWith<$Res> {
  factory $MetNoForecastDeviceCopyWith(
          MetNoForecastDevice value, $Res Function(MetNoForecastDevice) then) =
      _$MetNoForecastDeviceCopyWithImpl<$Res, MetNoForecastDevice>;
  @useResult
  $Res call({@JsonKey(name: 'state') WeatherState state});

  $WeatherStateCopyWith<$Res> get state;
}

/// @nodoc
class _$MetNoForecastDeviceCopyWithImpl<$Res, $Val extends MetNoForecastDevice>
    implements $MetNoForecastDeviceCopyWith<$Res> {
  _$MetNoForecastDeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MetNoForecastDevice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
  }) {
    return _then(_value.copyWith(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as WeatherState,
    ) as $Val);
  }

  /// Create a copy of MetNoForecastDevice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherStateCopyWith<$Res> get state {
    return $WeatherStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MetNoForecastDeviceImplCopyWith<$Res>
    implements $MetNoForecastDeviceCopyWith<$Res> {
  factory _$$MetNoForecastDeviceImplCopyWith(_$MetNoForecastDeviceImpl value,
          $Res Function(_$MetNoForecastDeviceImpl) then) =
      __$$MetNoForecastDeviceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'state') WeatherState state});

  @override
  $WeatherStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$MetNoForecastDeviceImplCopyWithImpl<$Res>
    extends _$MetNoForecastDeviceCopyWithImpl<$Res, _$MetNoForecastDeviceImpl>
    implements _$$MetNoForecastDeviceImplCopyWith<$Res> {
  __$$MetNoForecastDeviceImplCopyWithImpl(_$MetNoForecastDeviceImpl _value,
      $Res Function(_$MetNoForecastDeviceImpl) _then)
      : super(_value, _then);

  /// Create a copy of MetNoForecastDevice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
  }) {
    return _then(_$MetNoForecastDeviceImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as WeatherState,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetNoForecastDeviceImpl extends _MetNoForecastDevice {
  const _$MetNoForecastDeviceImpl({@JsonKey(name: 'state') required this.state})
      : super._();

  factory _$MetNoForecastDeviceImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetNoForecastDeviceImplFromJson(json);

  @override
  @JsonKey(name: 'state')
  final WeatherState state;

  @override
  String toString() {
    return 'MetNoForecastDevice(state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetNoForecastDeviceImpl &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, state);

  /// Create a copy of MetNoForecastDevice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MetNoForecastDeviceImplCopyWith<_$MetNoForecastDeviceImpl> get copyWith =>
      __$$MetNoForecastDeviceImplCopyWithImpl<_$MetNoForecastDeviceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetNoForecastDeviceImplToJson(
      this,
    );
  }
}

abstract class _MetNoForecastDevice extends MetNoForecastDevice {
  const factory _MetNoForecastDevice(
          {@JsonKey(name: 'state') required final WeatherState state}) =
      _$MetNoForecastDeviceImpl;
  const _MetNoForecastDevice._() : super._();

  factory _MetNoForecastDevice.fromJson(Map<String, dynamic> json) =
      _$MetNoForecastDeviceImpl.fromJson;

  @override
  @JsonKey(name: 'state')
  WeatherState get state;

  /// Create a copy of MetNoForecastDevice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetNoForecastDeviceImplCopyWith<_$MetNoForecastDeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
