// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sikom_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SikomResponse _$SikomResponseFromJson(Map<String, dynamic> json) {
  return _SikomResponse.fromJson(json);
}

/// @nodoc
mixin _$SikomResponse {
  @JsonKey(name: 'ContentEncoding')
  String? get contentEncoding => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContentType')
  String? get contentType => throw _privateConstructorUsedError;
  @JsonKey(name: 'Data')
  SikomResponseData get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'JsonRequestBehavior')
  int get jsonRequestBehavior => throw _privateConstructorUsedError;
  @JsonKey(name: 'MaxJsonLength')
  int? get maxJsonLength => throw _privateConstructorUsedError;
  @JsonKey(name: 'RecursionLimit')
  int? get recursionLimit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SikomResponseCopyWith<SikomResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SikomResponseCopyWith<$Res> {
  factory $SikomResponseCopyWith(
          SikomResponse value, $Res Function(SikomResponse) then) =
      _$SikomResponseCopyWithImpl<$Res, SikomResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ContentEncoding') String? contentEncoding,
      @JsonKey(name: 'ContentType') String? contentType,
      @JsonKey(name: 'Data') SikomResponseData data,
      @JsonKey(name: 'JsonRequestBehavior') int jsonRequestBehavior,
      @JsonKey(name: 'MaxJsonLength') int? maxJsonLength,
      @JsonKey(name: 'RecursionLimit') int? recursionLimit});

  $SikomResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class _$SikomResponseCopyWithImpl<$Res, $Val extends SikomResponse>
    implements $SikomResponseCopyWith<$Res> {
  _$SikomResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentEncoding = freezed,
    Object? contentType = freezed,
    Object? data = null,
    Object? jsonRequestBehavior = null,
    Object? maxJsonLength = freezed,
    Object? recursionLimit = freezed,
  }) {
    return _then(_value.copyWith(
      contentEncoding: freezed == contentEncoding
          ? _value.contentEncoding
          : contentEncoding // ignore: cast_nullable_to_non_nullable
              as String?,
      contentType: freezed == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SikomResponseData,
      jsonRequestBehavior: null == jsonRequestBehavior
          ? _value.jsonRequestBehavior
          : jsonRequestBehavior // ignore: cast_nullable_to_non_nullable
              as int,
      maxJsonLength: freezed == maxJsonLength
          ? _value.maxJsonLength
          : maxJsonLength // ignore: cast_nullable_to_non_nullable
              as int?,
      recursionLimit: freezed == recursionLimit
          ? _value.recursionLimit
          : recursionLimit // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomResponseDataCopyWith<$Res> get data {
    return $SikomResponseDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SikomResponseImplCopyWith<$Res>
    implements $SikomResponseCopyWith<$Res> {
  factory _$$SikomResponseImplCopyWith(
          _$SikomResponseImpl value, $Res Function(_$SikomResponseImpl) then) =
      __$$SikomResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ContentEncoding') String? contentEncoding,
      @JsonKey(name: 'ContentType') String? contentType,
      @JsonKey(name: 'Data') SikomResponseData data,
      @JsonKey(name: 'JsonRequestBehavior') int jsonRequestBehavior,
      @JsonKey(name: 'MaxJsonLength') int? maxJsonLength,
      @JsonKey(name: 'RecursionLimit') int? recursionLimit});

  @override
  $SikomResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$SikomResponseImplCopyWithImpl<$Res>
    extends _$SikomResponseCopyWithImpl<$Res, _$SikomResponseImpl>
    implements _$$SikomResponseImplCopyWith<$Res> {
  __$$SikomResponseImplCopyWithImpl(
      _$SikomResponseImpl _value, $Res Function(_$SikomResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentEncoding = freezed,
    Object? contentType = freezed,
    Object? data = null,
    Object? jsonRequestBehavior = null,
    Object? maxJsonLength = freezed,
    Object? recursionLimit = freezed,
  }) {
    return _then(_$SikomResponseImpl(
      contentEncoding: freezed == contentEncoding
          ? _value.contentEncoding
          : contentEncoding // ignore: cast_nullable_to_non_nullable
              as String?,
      contentType: freezed == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SikomResponseData,
      jsonRequestBehavior: null == jsonRequestBehavior
          ? _value.jsonRequestBehavior
          : jsonRequestBehavior // ignore: cast_nullable_to_non_nullable
              as int,
      maxJsonLength: freezed == maxJsonLength
          ? _value.maxJsonLength
          : maxJsonLength // ignore: cast_nullable_to_non_nullable
              as int?,
      recursionLimit: freezed == recursionLimit
          ? _value.recursionLimit
          : recursionLimit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SikomResponseImpl extends _SikomResponse {
  const _$SikomResponseImpl(
      {@JsonKey(name: 'ContentEncoding') this.contentEncoding,
      @JsonKey(name: 'ContentType') this.contentType,
      @JsonKey(name: 'Data') required this.data,
      @JsonKey(name: 'JsonRequestBehavior') required this.jsonRequestBehavior,
      @JsonKey(name: 'MaxJsonLength') this.maxJsonLength,
      @JsonKey(name: 'RecursionLimit') this.recursionLimit})
      : super._();

  factory _$SikomResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SikomResponseImplFromJson(json);

  @override
  @JsonKey(name: 'ContentEncoding')
  final String? contentEncoding;
  @override
  @JsonKey(name: 'ContentType')
  final String? contentType;
  @override
  @JsonKey(name: 'Data')
  final SikomResponseData data;
  @override
  @JsonKey(name: 'JsonRequestBehavior')
  final int jsonRequestBehavior;
  @override
  @JsonKey(name: 'MaxJsonLength')
  final int? maxJsonLength;
  @override
  @JsonKey(name: 'RecursionLimit')
  final int? recursionLimit;

  @override
  String toString() {
    return 'SikomResponse(contentEncoding: $contentEncoding, contentType: $contentType, data: $data, jsonRequestBehavior: $jsonRequestBehavior, maxJsonLength: $maxJsonLength, recursionLimit: $recursionLimit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SikomResponseImpl &&
            (identical(other.contentEncoding, contentEncoding) ||
                other.contentEncoding == contentEncoding) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.jsonRequestBehavior, jsonRequestBehavior) ||
                other.jsonRequestBehavior == jsonRequestBehavior) &&
            (identical(other.maxJsonLength, maxJsonLength) ||
                other.maxJsonLength == maxJsonLength) &&
            (identical(other.recursionLimit, recursionLimit) ||
                other.recursionLimit == recursionLimit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, contentEncoding, contentType,
      data, jsonRequestBehavior, maxJsonLength, recursionLimit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SikomResponseImplCopyWith<_$SikomResponseImpl> get copyWith =>
      __$$SikomResponseImplCopyWithImpl<_$SikomResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SikomResponseImplToJson(
      this,
    );
  }
}

abstract class _SikomResponse extends SikomResponse {
  const factory _SikomResponse(
          {@JsonKey(name: 'ContentEncoding') final String? contentEncoding,
          @JsonKey(name: 'ContentType') final String? contentType,
          @JsonKey(name: 'Data') required final SikomResponseData data,
          @JsonKey(name: 'JsonRequestBehavior')
          required final int jsonRequestBehavior,
          @JsonKey(name: 'MaxJsonLength') final int? maxJsonLength,
          @JsonKey(name: 'RecursionLimit') final int? recursionLimit}) =
      _$SikomResponseImpl;
  const _SikomResponse._() : super._();

  factory _SikomResponse.fromJson(Map<String, dynamic> json) =
      _$SikomResponseImpl.fromJson;

  @override
  @JsonKey(name: 'ContentEncoding')
  String? get contentEncoding;
  @override
  @JsonKey(name: 'ContentType')
  String? get contentType;
  @override
  @JsonKey(name: 'Data')
  SikomResponseData get data;
  @override
  @JsonKey(name: 'JsonRequestBehavior')
  int get jsonRequestBehavior;
  @override
  @JsonKey(name: 'MaxJsonLength')
  int? get maxJsonLength;
  @override
  @JsonKey(name: 'RecursionLimit')
  int? get recursionLimit;
  @override
  @JsonKey(ignore: true)
  _$$SikomResponseImplCopyWith<_$SikomResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
