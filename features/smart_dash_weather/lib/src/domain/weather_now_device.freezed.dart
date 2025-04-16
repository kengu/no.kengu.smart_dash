// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_now_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeatherNowDevice {
  @JsonKey(name: 'service')
  String get service;
  @JsonKey(name: 'state')
  WeatherState get state;

  /// Create a copy of WeatherNowDevice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WeatherNowDeviceCopyWith<WeatherNowDevice> get copyWith =>
      _$WeatherNowDeviceCopyWithImpl<WeatherNowDevice>(
          this as WeatherNowDevice, _$identity);

  /// Serializes this WeatherNowDevice to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeatherNowDevice &&
            (identical(other.service, service) || other.service == service) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, service, state);

  @override
  String toString() {
    return 'WeatherNowDevice(service: $service, state: $state)';
  }
}

/// @nodoc
abstract mixin class $WeatherNowDeviceCopyWith<$Res> {
  factory $WeatherNowDeviceCopyWith(
          WeatherNowDevice value, $Res Function(WeatherNowDevice) _then) =
      _$WeatherNowDeviceCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'service') String service,
      @JsonKey(name: 'state') WeatherState state});

  $WeatherStateCopyWith<$Res> get state;
}

/// @nodoc
class _$WeatherNowDeviceCopyWithImpl<$Res>
    implements $WeatherNowDeviceCopyWith<$Res> {
  _$WeatherNowDeviceCopyWithImpl(this._self, this._then);

  final WeatherNowDevice _self;
  final $Res Function(WeatherNowDevice) _then;

  /// Create a copy of WeatherNowDevice
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

  /// Create a copy of WeatherNowDevice
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
class _WeatherNowDevice extends WeatherNowDevice {
  const _WeatherNowDevice(
      {@JsonKey(name: 'service') required this.service,
      @JsonKey(name: 'state') required this.state})
      : super._();
  factory _WeatherNowDevice.fromJson(Map<String, dynamic> json) =>
      _$WeatherNowDeviceFromJson(json);

  @override
  @JsonKey(name: 'service')
  final String service;
  @override
  @JsonKey(name: 'state')
  final WeatherState state;

  /// Create a copy of WeatherNowDevice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WeatherNowDeviceCopyWith<_WeatherNowDevice> get copyWith =>
      __$WeatherNowDeviceCopyWithImpl<_WeatherNowDevice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WeatherNowDeviceToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WeatherNowDevice &&
            (identical(other.service, service) || other.service == service) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, service, state);

  @override
  String toString() {
    return 'WeatherNowDevice(service: $service, state: $state)';
  }
}

/// @nodoc
abstract mixin class _$WeatherNowDeviceCopyWith<$Res>
    implements $WeatherNowDeviceCopyWith<$Res> {
  factory _$WeatherNowDeviceCopyWith(
          _WeatherNowDevice value, $Res Function(_WeatherNowDevice) _then) =
      __$WeatherNowDeviceCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'service') String service,
      @JsonKey(name: 'state') WeatherState state});

  @override
  $WeatherStateCopyWith<$Res> get state;
}

/// @nodoc
class __$WeatherNowDeviceCopyWithImpl<$Res>
    implements _$WeatherNowDeviceCopyWith<$Res> {
  __$WeatherNowDeviceCopyWithImpl(this._self, this._then);

  final _WeatherNowDevice _self;
  final $Res Function(_WeatherNowDevice) _then;

  /// Create a copy of WeatherNowDevice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? service = null,
    Object? state = null,
  }) {
    return _then(_WeatherNowDevice(
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

  /// Create a copy of WeatherNowDevice
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
