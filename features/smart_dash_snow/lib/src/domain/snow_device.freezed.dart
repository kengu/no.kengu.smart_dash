// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'snow_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SnowDevice _$SnowDeviceFromJson(Map<String, dynamic> json) {
  return _SnowDevice.fromJson(json);
}

/// @nodoc
mixin _$SnowDevice {
  @JsonKey(name: 'state')
  SnowState get state => throw _privateConstructorUsedError;
  @JsonKey(name: 'service')
  String get service => throw _privateConstructorUsedError;

  /// Serializes this SnowDevice to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SnowDevice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SnowDeviceCopyWith<SnowDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SnowDeviceCopyWith<$Res> {
  factory $SnowDeviceCopyWith(
          SnowDevice value, $Res Function(SnowDevice) then) =
      _$SnowDeviceCopyWithImpl<$Res, SnowDevice>;
  @useResult
  $Res call(
      {@JsonKey(name: 'state') SnowState state,
      @JsonKey(name: 'service') String service});

  $SnowStateCopyWith<$Res> get state;
}

/// @nodoc
class _$SnowDeviceCopyWithImpl<$Res, $Val extends SnowDevice>
    implements $SnowDeviceCopyWith<$Res> {
  _$SnowDeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SnowDevice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? service = null,
  }) {
    return _then(_value.copyWith(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as SnowState,
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of SnowDevice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SnowStateCopyWith<$Res> get state {
    return $SnowStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SnowDeviceImplCopyWith<$Res>
    implements $SnowDeviceCopyWith<$Res> {
  factory _$$SnowDeviceImplCopyWith(
          _$SnowDeviceImpl value, $Res Function(_$SnowDeviceImpl) then) =
      __$$SnowDeviceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'state') SnowState state,
      @JsonKey(name: 'service') String service});

  @override
  $SnowStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$SnowDeviceImplCopyWithImpl<$Res>
    extends _$SnowDeviceCopyWithImpl<$Res, _$SnowDeviceImpl>
    implements _$$SnowDeviceImplCopyWith<$Res> {
  __$$SnowDeviceImplCopyWithImpl(
      _$SnowDeviceImpl _value, $Res Function(_$SnowDeviceImpl) _then)
      : super(_value, _then);

  /// Create a copy of SnowDevice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? service = null,
  }) {
    return _then(_$SnowDeviceImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as SnowState,
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SnowDeviceImpl extends _SnowDevice {
  const _$SnowDeviceImpl(
      {@JsonKey(name: 'state') required this.state,
      @JsonKey(name: 'service') required this.service})
      : super._();

  factory _$SnowDeviceImpl.fromJson(Map<String, dynamic> json) =>
      _$$SnowDeviceImplFromJson(json);

  @override
  @JsonKey(name: 'state')
  final SnowState state;
  @override
  @JsonKey(name: 'service')
  final String service;

  @override
  String toString() {
    return 'SnowDevice(state: $state, service: $service)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SnowDeviceImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.service, service) || other.service == service));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, state, service);

  /// Create a copy of SnowDevice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SnowDeviceImplCopyWith<_$SnowDeviceImpl> get copyWith =>
      __$$SnowDeviceImplCopyWithImpl<_$SnowDeviceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SnowDeviceImplToJson(
      this,
    );
  }
}

abstract class _SnowDevice extends SnowDevice {
  const factory _SnowDevice(
          {@JsonKey(name: 'state') required final SnowState state,
          @JsonKey(name: 'service') required final String service}) =
      _$SnowDeviceImpl;
  const _SnowDevice._() : super._();

  factory _SnowDevice.fromJson(Map<String, dynamic> json) =
      _$SnowDeviceImpl.fromJson;

  @override
  @JsonKey(name: 'state')
  SnowState get state;
  @override
  @JsonKey(name: 'service')
  String get service;

  /// Create a copy of SnowDevice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SnowDeviceImplCopyWith<_$SnowDeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
