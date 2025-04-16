// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_forecast_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeatherForecastDevice {
  @JsonKey(name: 'service')
  String get service;
  @JsonKey(name: 'state')
  WeatherState get state;

  /// Create a copy of WeatherForecastDevice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WeatherForecastDeviceCopyWith<WeatherForecastDevice> get copyWith =>
      _$WeatherForecastDeviceCopyWithImpl<WeatherForecastDevice>(
          this as WeatherForecastDevice, _$identity);

  /// Serializes this WeatherForecastDevice to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeatherForecastDevice &&
            (identical(other.service, service) || other.service == service) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, service, state);

  @override
  String toString() {
    return 'WeatherForecastDevice(service: $service, state: $state)';
  }
}

/// @nodoc
abstract mixin class $WeatherForecastDeviceCopyWith<$Res> {
  factory $WeatherForecastDeviceCopyWith(WeatherForecastDevice value,
          $Res Function(WeatherForecastDevice) _then) =
      _$WeatherForecastDeviceCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'service') String service,
      @JsonKey(name: 'state') WeatherState state});

  $WeatherStateCopyWith<$Res> get state;
}

/// @nodoc
class _$WeatherForecastDeviceCopyWithImpl<$Res>
    implements $WeatherForecastDeviceCopyWith<$Res> {
  _$WeatherForecastDeviceCopyWithImpl(this._self, this._then);

  final WeatherForecastDevice _self;
  final $Res Function(WeatherForecastDevice) _then;

  /// Create a copy of WeatherForecastDevice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? service = null,
    Object? state = null,
  }) {
    return _then(_self.copyWith(
      service: null == service
          ? _self.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as WeatherState,
    ));
  }

  /// Create a copy of WeatherForecastDevice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherStateCopyWith<$Res> get state {
    return $WeatherStateCopyWith<$Res>(_self.state, (value) {
      return _then(_self.copyWith(state: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _WeatherForecastDevice extends WeatherForecastDevice {
  const _WeatherForecastDevice(
      {@JsonKey(name: 'service') required this.service,
      @JsonKey(name: 'state') required this.state})
      : super._();
  factory _WeatherForecastDevice.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastDeviceFromJson(json);

  @override
  @JsonKey(name: 'service')
  final String service;
  @override
  @JsonKey(name: 'state')
  final WeatherState state;

  /// Create a copy of WeatherForecastDevice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WeatherForecastDeviceCopyWith<_WeatherForecastDevice> get copyWith =>
      __$WeatherForecastDeviceCopyWithImpl<_WeatherForecastDevice>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WeatherForecastDeviceToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WeatherForecastDevice &&
            (identical(other.service, service) || other.service == service) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, service, state);

  @override
  String toString() {
    return 'WeatherForecastDevice(service: $service, state: $state)';
  }
}

/// @nodoc
abstract mixin class _$WeatherForecastDeviceCopyWith<$Res>
    implements $WeatherForecastDeviceCopyWith<$Res> {
  factory _$WeatherForecastDeviceCopyWith(_WeatherForecastDevice value,
          $Res Function(_WeatherForecastDevice) _then) =
      __$WeatherForecastDeviceCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'service') String service,
      @JsonKey(name: 'state') WeatherState state});

  @override
  $WeatherStateCopyWith<$Res> get state;
}

/// @nodoc
class __$WeatherForecastDeviceCopyWithImpl<$Res>
    implements _$WeatherForecastDeviceCopyWith<$Res> {
  __$WeatherForecastDeviceCopyWithImpl(this._self, this._then);

  final _WeatherForecastDevice _self;
  final $Res Function(_WeatherForecastDevice) _then;

  /// Create a copy of WeatherForecastDevice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? service = null,
    Object? state = null,
  }) {
    return _then(_WeatherForecastDevice(
      service: null == service
          ? _self.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as WeatherState,
    ));
  }

  /// Create a copy of WeatherForecastDevice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherStateCopyWith<$Res> get state {
    return $WeatherStateCopyWith<$Res>(_self.state, (value) {
      return _then(_self.copyWith(state: value));
    });
  }
}

// dart format on
