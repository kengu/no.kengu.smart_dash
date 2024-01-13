// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'camera_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CameraResponse _$CameraResponseFromJson(Map<String, dynamic> json) {
  return _CameraResponse.fromJson(json);
}

/// @nodoc
mixin _$CameraResponse {
  @JsonKey(name: 'data')
  Camera get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CameraResponseCopyWith<CameraResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CameraResponseCopyWith<$Res> {
  factory $CameraResponseCopyWith(
          CameraResponse value, $Res Function(CameraResponse) then) =
      _$CameraResponseCopyWithImpl<$Res, CameraResponse>;
  @useResult
  $Res call({@JsonKey(name: 'data') Camera data});

  $CameraCopyWith<$Res> get data;
}

/// @nodoc
class _$CameraResponseCopyWithImpl<$Res, $Val extends CameraResponse>
    implements $CameraResponseCopyWith<$Res> {
  _$CameraResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Camera,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CameraCopyWith<$Res> get data {
    return $CameraCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CameraResponseImplCopyWith<$Res>
    implements $CameraResponseCopyWith<$Res> {
  factory _$$CameraResponseImplCopyWith(_$CameraResponseImpl value,
          $Res Function(_$CameraResponseImpl) then) =
      __$$CameraResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'data') Camera data});

  @override
  $CameraCopyWith<$Res> get data;
}

/// @nodoc
class __$$CameraResponseImplCopyWithImpl<$Res>
    extends _$CameraResponseCopyWithImpl<$Res, _$CameraResponseImpl>
    implements _$$CameraResponseImplCopyWith<$Res> {
  __$$CameraResponseImplCopyWithImpl(
      _$CameraResponseImpl _value, $Res Function(_$CameraResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$CameraResponseImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Camera,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CameraResponseImpl implements _CameraResponse {
  const _$CameraResponseImpl({@JsonKey(name: 'data') required this.data});

  factory _$CameraResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CameraResponseImplFromJson(json);

  @override
  @JsonKey(name: 'data')
  final Camera data;

  @override
  String toString() {
    return 'CameraResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CameraResponseImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CameraResponseImplCopyWith<_$CameraResponseImpl> get copyWith =>
      __$$CameraResponseImplCopyWithImpl<_$CameraResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CameraResponseImplToJson(
      this,
    );
  }
}

abstract class _CameraResponse implements CameraResponse {
  const factory _CameraResponse(
          {@JsonKey(name: 'data') required final Camera data}) =
      _$CameraResponseImpl;

  factory _CameraResponse.fromJson(Map<String, dynamic> json) =
      _$CameraResponseImpl.fromJson;

  @override
  @JsonKey(name: 'data')
  Camera get data;
  @override
  @JsonKey(ignore: true)
  _$$CameraResponseImplCopyWith<_$CameraResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
