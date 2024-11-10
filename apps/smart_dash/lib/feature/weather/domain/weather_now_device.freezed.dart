// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_now_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeatherNowDevice _$WeatherNowDeviceFromJson(Map<String, dynamic> json) {
  return _WeatherNowDevice.fromJson(json);
}

/// @nodoc
mixin _$WeatherNowDevice {
  @JsonKey(name: 'state')
  Weather get state => throw _privateConstructorUsedError;

  /// Serializes this WeatherNowDevice to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeatherNowDevice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherNowDeviceCopyWith<WeatherNowDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherNowDeviceCopyWith<$Res> {
  factory $WeatherNowDeviceCopyWith(
          WeatherNowDevice value, $Res Function(WeatherNowDevice) then) =
      _$WeatherNowDeviceCopyWithImpl<$Res, WeatherNowDevice>;
  @useResult
  $Res call({@JsonKey(name: 'state') Weather state});

  $WeatherCopyWith<$Res> get state;
}

/// @nodoc
class _$WeatherNowDeviceCopyWithImpl<$Res, $Val extends WeatherNowDevice>
    implements $WeatherNowDeviceCopyWith<$Res> {
  _$WeatherNowDeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherNowDevice
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
              as Weather,
    ) as $Val);
  }

  /// Create a copy of WeatherNowDevice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherCopyWith<$Res> get state {
    return $WeatherCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherNowDeviceImplCopyWith<$Res>
    implements $WeatherNowDeviceCopyWith<$Res> {
  factory _$$WeatherNowDeviceImplCopyWith(_$WeatherNowDeviceImpl value,
          $Res Function(_$WeatherNowDeviceImpl) then) =
      __$$WeatherNowDeviceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'state') Weather state});

  @override
  $WeatherCopyWith<$Res> get state;
}

/// @nodoc
class __$$WeatherNowDeviceImplCopyWithImpl<$Res>
    extends _$WeatherNowDeviceCopyWithImpl<$Res, _$WeatherNowDeviceImpl>
    implements _$$WeatherNowDeviceImplCopyWith<$Res> {
  __$$WeatherNowDeviceImplCopyWithImpl(_$WeatherNowDeviceImpl _value,
      $Res Function(_$WeatherNowDeviceImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeatherNowDevice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
  }) {
    return _then(_$WeatherNowDeviceImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as Weather,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherNowDeviceImpl extends _WeatherNowDevice {
  const _$WeatherNowDeviceImpl({@JsonKey(name: 'state') required this.state})
      : super._();

  factory _$WeatherNowDeviceImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherNowDeviceImplFromJson(json);

  @override
  @JsonKey(name: 'state')
  final Weather state;

  @override
  String toString() {
    return 'WeatherNowDevice(state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherNowDeviceImpl &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, state);

  /// Create a copy of WeatherNowDevice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherNowDeviceImplCopyWith<_$WeatherNowDeviceImpl> get copyWith =>
      __$$WeatherNowDeviceImplCopyWithImpl<_$WeatherNowDeviceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherNowDeviceImplToJson(
      this,
    );
  }
}

abstract class _WeatherNowDevice extends WeatherNowDevice {
  const factory _WeatherNowDevice(
          {@JsonKey(name: 'state') required final Weather state}) =
      _$WeatherNowDeviceImpl;
  const _WeatherNowDevice._() : super._();

  factory _WeatherNowDevice.fromJson(Map<String, dynamic> json) =
      _$WeatherNowDeviceImpl.fromJson;

  @override
  @JsonKey(name: 'state')
  Weather get state;

  /// Create a copy of WeatherNowDevice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherNowDeviceImplCopyWith<_$WeatherNowDeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
