// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nysny_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NySnyDevice _$NySnyDeviceFromJson(Map<String, dynamic> json) {
  return _NySnyDevice.fromJson(json);
}

/// @nodoc
mixin _$NySnyDevice {
  @JsonKey(name: 'state')
  SnowState get state => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NySnyDeviceCopyWith<NySnyDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NySnyDeviceCopyWith<$Res> {
  factory $NySnyDeviceCopyWith(
          NySnyDevice value, $Res Function(NySnyDevice) then) =
      _$NySnyDeviceCopyWithImpl<$Res, NySnyDevice>;
  @useResult
  $Res call({@JsonKey(name: 'state') SnowState state});

  $SnowStateCopyWith<$Res> get state;
}

/// @nodoc
class _$NySnyDeviceCopyWithImpl<$Res, $Val extends NySnyDevice>
    implements $NySnyDeviceCopyWith<$Res> {
  _$NySnyDeviceCopyWithImpl(this._value, this._then);

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
              as SnowState,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SnowStateCopyWith<$Res> get state {
    return $SnowStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NySnyDeviceImplCopyWith<$Res>
    implements $NySnyDeviceCopyWith<$Res> {
  factory _$$NySnyDeviceImplCopyWith(
          _$NySnyDeviceImpl value, $Res Function(_$NySnyDeviceImpl) then) =
      __$$NySnyDeviceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'state') SnowState state});

  @override
  $SnowStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$NySnyDeviceImplCopyWithImpl<$Res>
    extends _$NySnyDeviceCopyWithImpl<$Res, _$NySnyDeviceImpl>
    implements _$$NySnyDeviceImplCopyWith<$Res> {
  __$$NySnyDeviceImplCopyWithImpl(
      _$NySnyDeviceImpl _value, $Res Function(_$NySnyDeviceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
  }) {
    return _then(_$NySnyDeviceImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as SnowState,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NySnyDeviceImpl extends _NySnyDevice {
  const _$NySnyDeviceImpl({@JsonKey(name: 'state') required this.state})
      : super._();

  factory _$NySnyDeviceImpl.fromJson(Map<String, dynamic> json) =>
      _$$NySnyDeviceImplFromJson(json);

  @override
  @JsonKey(name: 'state')
  final SnowState state;

  @override
  String toString() {
    return 'NySnyDevice(state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NySnyDeviceImpl &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NySnyDeviceImplCopyWith<_$NySnyDeviceImpl> get copyWith =>
      __$$NySnyDeviceImplCopyWithImpl<_$NySnyDeviceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NySnyDeviceImplToJson(
      this,
    );
  }
}

abstract class _NySnyDevice extends NySnyDevice {
  const factory _NySnyDevice(
          {@JsonKey(name: 'state') required final SnowState state}) =
      _$NySnyDeviceImpl;
  const _NySnyDevice._() : super._();

  factory _NySnyDevice.fromJson(Map<String, dynamic> json) =
      _$NySnyDeviceImpl.fromJson;

  @override
  @JsonKey(name: 'state')
  SnowState get state;
  @override
  @JsonKey(ignore: true)
  _$$NySnyDeviceImplCopyWith<_$NySnyDeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
