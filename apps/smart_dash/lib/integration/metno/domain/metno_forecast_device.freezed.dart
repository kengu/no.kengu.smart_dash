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
  Weather get state => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MetNoForecastDeviceCopyWith<MetNoForecastDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetNoForecastDeviceCopyWith<$Res> {
  factory $MetNoForecastDeviceCopyWith(
          MetNoForecastDevice value, $Res Function(MetNoForecastDevice) then) =
      _$MetNoForecastDeviceCopyWithImpl<$Res, MetNoForecastDevice>;
  @useResult
  $Res call({@JsonKey(name: 'state') Weather state});

  $WeatherCopyWith<$Res> get state;
}

/// @nodoc
class _$MetNoForecastDeviceCopyWithImpl<$Res, $Val extends MetNoForecastDevice>
    implements $MetNoForecastDeviceCopyWith<$Res> {
  _$MetNoForecastDeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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

  @override
  @pragma('vm:prefer-inline')
  $WeatherCopyWith<$Res> get state {
    return $WeatherCopyWith<$Res>(_value.state, (value) {
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
  $Res call({@JsonKey(name: 'state') Weather state});

  @override
  $WeatherCopyWith<$Res> get state;
}

/// @nodoc
class __$$MetNoForecastDeviceImplCopyWithImpl<$Res>
    extends _$MetNoForecastDeviceCopyWithImpl<$Res, _$MetNoForecastDeviceImpl>
    implements _$$MetNoForecastDeviceImplCopyWith<$Res> {
  __$$MetNoForecastDeviceImplCopyWithImpl(_$MetNoForecastDeviceImpl _value,
      $Res Function(_$MetNoForecastDeviceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
  }) {
    return _then(_$MetNoForecastDeviceImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as Weather,
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
  final Weather state;

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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, state);

  @JsonKey(ignore: true)
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
          {@JsonKey(name: 'state') required final Weather state}) =
      _$MetNoForecastDeviceImpl;
  const _MetNoForecastDevice._() : super._();

  factory _MetNoForecastDevice.fromJson(Map<String, dynamic> json) =
      _$MetNoForecastDeviceImpl.fromJson;

  @override
  @JsonKey(name: 'state')
  Weather get state;
  @override
  @JsonKey(ignore: true)
  _$$MetNoForecastDeviceImplCopyWith<_$MetNoForecastDeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
