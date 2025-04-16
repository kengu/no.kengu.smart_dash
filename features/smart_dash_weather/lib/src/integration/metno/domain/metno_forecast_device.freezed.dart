// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'metno_forecast_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MetNoForecastDevice {
  @JsonKey(name: 'state')
  WeatherState get state;

  /// Create a copy of MetNoForecastDevice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MetNoForecastDeviceCopyWith<MetNoForecastDevice> get copyWith =>
      _$MetNoForecastDeviceCopyWithImpl<MetNoForecastDevice>(
          this as MetNoForecastDevice, _$identity);

  /// Serializes this MetNoForecastDevice to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MetNoForecastDevice &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, state);

  @override
  String toString() {
    return 'MetNoForecastDevice(state: $state)';
  }
}

/// @nodoc
abstract mixin class $MetNoForecastDeviceCopyWith<$Res> {
  factory $MetNoForecastDeviceCopyWith(
          MetNoForecastDevice value, $Res Function(MetNoForecastDevice) _then) =
      _$MetNoForecastDeviceCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: 'state') WeatherState state});

  $WeatherStateCopyWith<$Res> get state;
}

/// @nodoc
class _$MetNoForecastDeviceCopyWithImpl<$Res>
    implements $MetNoForecastDeviceCopyWith<$Res> {
  _$MetNoForecastDeviceCopyWithImpl(this._self, this._then);

  final MetNoForecastDevice _self;
  final $Res Function(MetNoForecastDevice) _then;

  /// Create a copy of MetNoForecastDevice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
  }) {
    return _then(_self.copyWith(
      state: null == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as WeatherState,
    ));
  }

  /// Create a copy of MetNoForecastDevice
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
class _MetNoForecastDevice extends MetNoForecastDevice {
  const _MetNoForecastDevice({@JsonKey(name: 'state') required this.state})
      : super._();
  factory _MetNoForecastDevice.fromJson(Map<String, dynamic> json) =>
      _$MetNoForecastDeviceFromJson(json);

  @override
  @JsonKey(name: 'state')
  final WeatherState state;

  /// Create a copy of MetNoForecastDevice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MetNoForecastDeviceCopyWith<_MetNoForecastDevice> get copyWith =>
      __$MetNoForecastDeviceCopyWithImpl<_MetNoForecastDevice>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MetNoForecastDeviceToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MetNoForecastDevice &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, state);

  @override
  String toString() {
    return 'MetNoForecastDevice(state: $state)';
  }
}

/// @nodoc
abstract mixin class _$MetNoForecastDeviceCopyWith<$Res>
    implements $MetNoForecastDeviceCopyWith<$Res> {
  factory _$MetNoForecastDeviceCopyWith(_MetNoForecastDevice value,
          $Res Function(_MetNoForecastDevice) _then) =
      __$MetNoForecastDeviceCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: 'state') WeatherState state});

  @override
  $WeatherStateCopyWith<$Res> get state;
}

/// @nodoc
class __$MetNoForecastDeviceCopyWithImpl<$Res>
    implements _$MetNoForecastDeviceCopyWith<$Res> {
  __$MetNoForecastDeviceCopyWithImpl(this._self, this._then);

  final _MetNoForecastDevice _self;
  final $Res Function(_MetNoForecastDevice) _then;

  /// Create a copy of MetNoForecastDevice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? state = null,
  }) {
    return _then(_MetNoForecastDevice(
      state: null == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as WeatherState,
    ));
  }

  /// Create a copy of MetNoForecastDevice
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
