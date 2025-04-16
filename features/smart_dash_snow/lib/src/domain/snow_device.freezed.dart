// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'snow_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SnowDevice {
  @JsonKey(name: 'state')
  SnowState get state;
  @JsonKey(name: 'service')
  String get service;

  /// Create a copy of SnowDevice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SnowDeviceCopyWith<SnowDevice> get copyWith =>
      _$SnowDeviceCopyWithImpl<SnowDevice>(this as SnowDevice, _$identity);

  /// Serializes this SnowDevice to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SnowDevice &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.service, service) || other.service == service));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, state, service);

  @override
  String toString() {
    return 'SnowDevice(state: $state, service: $service)';
  }
}

/// @nodoc
abstract mixin class $SnowDeviceCopyWith<$Res> {
  factory $SnowDeviceCopyWith(
          SnowDevice value, $Res Function(SnowDevice) _then) =
      _$SnowDeviceCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'state') SnowState state,
      @JsonKey(name: 'service') String service});

  $SnowStateCopyWith<$Res> get state;
}

/// @nodoc
class _$SnowDeviceCopyWithImpl<$Res> implements $SnowDeviceCopyWith<$Res> {
  _$SnowDeviceCopyWithImpl(this._self, this._then);

  final SnowDevice _self;
  final $Res Function(SnowDevice) _then;

  /// Create a copy of SnowDevice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? service = null,
  }) {
    return _then(_self.copyWith(
      state: null == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as SnowState,
      service: null == service
          ? _self.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of SnowDevice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SnowStateCopyWith<$Res> get state {
    return $SnowStateCopyWith<$Res>(_self.state, (value) {
      return _then(_self.copyWith(state: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _SnowDevice extends SnowDevice {
  const _SnowDevice(
      {@JsonKey(name: 'state') required this.state,
      @JsonKey(name: 'service') required this.service})
      : super._();
  factory _SnowDevice.fromJson(Map<String, dynamic> json) =>
      _$SnowDeviceFromJson(json);

  @override
  @JsonKey(name: 'state')
  final SnowState state;
  @override
  @JsonKey(name: 'service')
  final String service;

  /// Create a copy of SnowDevice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SnowDeviceCopyWith<_SnowDevice> get copyWith =>
      __$SnowDeviceCopyWithImpl<_SnowDevice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SnowDeviceToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SnowDevice &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.service, service) || other.service == service));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, state, service);

  @override
  String toString() {
    return 'SnowDevice(state: $state, service: $service)';
  }
}

/// @nodoc
abstract mixin class _$SnowDeviceCopyWith<$Res>
    implements $SnowDeviceCopyWith<$Res> {
  factory _$SnowDeviceCopyWith(
          _SnowDevice value, $Res Function(_SnowDevice) _then) =
      __$SnowDeviceCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'state') SnowState state,
      @JsonKey(name: 'service') String service});

  @override
  $SnowStateCopyWith<$Res> get state;
}

/// @nodoc
class __$SnowDeviceCopyWithImpl<$Res> implements _$SnowDeviceCopyWith<$Res> {
  __$SnowDeviceCopyWithImpl(this._self, this._then);

  final _SnowDevice _self;
  final $Res Function(_SnowDevice) _then;

  /// Create a copy of SnowDevice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? state = null,
    Object? service = null,
  }) {
    return _then(_SnowDevice(
      state: null == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as SnowState,
      service: null == service
          ? _self.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of SnowDevice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SnowStateCopyWith<$Res> get state {
    return $SnowStateCopyWith<$Res>(_self.state, (value) {
      return _then(_self.copyWith(state: value));
    });
  }
}

// dart format on
