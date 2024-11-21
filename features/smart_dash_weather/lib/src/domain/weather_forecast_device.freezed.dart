// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_forecast_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeatherForecastDevice _$WeatherForecastDeviceFromJson(
    Map<String, dynamic> json) {
  return _WeatherForecastDevice.fromJson(json);
}

/// @nodoc
mixin _$WeatherForecastDevice {
  @JsonKey(name: 'service')
  String get service => throw _privateConstructorUsedError;
  @JsonKey(name: 'state')
  WeatherState get state => throw _privateConstructorUsedError;

  /// Serializes this WeatherForecastDevice to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeatherForecastDevice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherForecastDeviceCopyWith<WeatherForecastDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherForecastDeviceCopyWith<$Res> {
  factory $WeatherForecastDeviceCopyWith(WeatherForecastDevice value,
          $Res Function(WeatherForecastDevice) then) =
      _$WeatherForecastDeviceCopyWithImpl<$Res, WeatherForecastDevice>;
  @useResult
  $Res call(
      {@JsonKey(name: 'service') String service,
      @JsonKey(name: 'state') WeatherState state});

  $WeatherStateCopyWith<$Res> get state;
}

/// @nodoc
class _$WeatherForecastDeviceCopyWithImpl<$Res,
        $Val extends WeatherForecastDevice>
    implements $WeatherForecastDeviceCopyWith<$Res> {
  _$WeatherForecastDeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherForecastDevice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? service = null,
    Object? state = null,
  }) {
    return _then(_value.copyWith(
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as WeatherState,
    ) as $Val);
  }

  /// Create a copy of WeatherForecastDevice
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
abstract class _$$WeatherForecastDeviceImplCopyWith<$Res>
    implements $WeatherForecastDeviceCopyWith<$Res> {
  factory _$$WeatherForecastDeviceImplCopyWith(
          _$WeatherForecastDeviceImpl value,
          $Res Function(_$WeatherForecastDeviceImpl) then) =
      __$$WeatherForecastDeviceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'service') String service,
      @JsonKey(name: 'state') WeatherState state});

  @override
  $WeatherStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$WeatherForecastDeviceImplCopyWithImpl<$Res>
    extends _$WeatherForecastDeviceCopyWithImpl<$Res,
        _$WeatherForecastDeviceImpl>
    implements _$$WeatherForecastDeviceImplCopyWith<$Res> {
  __$$WeatherForecastDeviceImplCopyWithImpl(_$WeatherForecastDeviceImpl _value,
      $Res Function(_$WeatherForecastDeviceImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeatherForecastDevice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? service = null,
    Object? state = null,
  }) {
    return _then(_$WeatherForecastDeviceImpl(
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as WeatherState,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherForecastDeviceImpl extends _WeatherForecastDevice {
  const _$WeatherForecastDeviceImpl(
      {@JsonKey(name: 'service') required this.service,
      @JsonKey(name: 'state') required this.state})
      : super._();

  factory _$WeatherForecastDeviceImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherForecastDeviceImplFromJson(json);

  @override
  @JsonKey(name: 'service')
  final String service;
  @override
  @JsonKey(name: 'state')
  final WeatherState state;

  @override
  String toString() {
    return 'WeatherForecastDevice(service: $service, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherForecastDeviceImpl &&
            (identical(other.service, service) || other.service == service) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, service, state);

  /// Create a copy of WeatherForecastDevice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherForecastDeviceImplCopyWith<_$WeatherForecastDeviceImpl>
      get copyWith => __$$WeatherForecastDeviceImplCopyWithImpl<
          _$WeatherForecastDeviceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherForecastDeviceImplToJson(
      this,
    );
  }
}

abstract class _WeatherForecastDevice extends WeatherForecastDevice {
  const factory _WeatherForecastDevice(
          {@JsonKey(name: 'service') required final String service,
          @JsonKey(name: 'state') required final WeatherState state}) =
      _$WeatherForecastDeviceImpl;
  const _WeatherForecastDevice._() : super._();

  factory _WeatherForecastDevice.fromJson(Map<String, dynamic> json) =
      _$WeatherForecastDeviceImpl.fromJson;

  @override
  @JsonKey(name: 'service')
  String get service;
  @override
  @JsonKey(name: 'state')
  WeatherState get state;

  /// Create a copy of WeatherForecastDevice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherForecastDeviceImplCopyWith<_$WeatherForecastDeviceImpl>
      get copyWith => throw _privateConstructorUsedError;
}
