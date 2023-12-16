// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sikom_response_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SikomResponseData _$SikomResponseDataFromJson(Map<String, dynamic> json) {
  return _SikomResponseData.fromJson(json);
}

/// @nodoc
mixin _$SikomResponseData {
  @JsonKey(name: 'bpapi_status')
  String get bpapiStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'bpapi_message')
  String get bpapiMessage => throw _privateConstructorUsedError;
  @JsonKey(name: 'bpapi_array')
  List<SikomResponseDataArrayObject>? get bpapiArray =>
      throw _privateConstructorUsedError;
  List<Object>? get result => throw _privateConstructorUsedError;
  @JsonKey(name: 'scalar_result')
  Object? get scalarResult => throw _privateConstructorUsedError;
  @JsonKey(name: 'device')
  SikomDevice? get device => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SikomResponseDataCopyWith<SikomResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SikomResponseDataCopyWith<$Res> {
  factory $SikomResponseDataCopyWith(
          SikomResponseData value, $Res Function(SikomResponseData) then) =
      _$SikomResponseDataCopyWithImpl<$Res, SikomResponseData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'bpapi_status') String bpapiStatus,
      @JsonKey(name: 'bpapi_message') String bpapiMessage,
      @JsonKey(name: 'bpapi_array')
      List<SikomResponseDataArrayObject>? bpapiArray,
      List<Object>? result,
      @JsonKey(name: 'scalar_result') Object? scalarResult,
      @JsonKey(name: 'device') SikomDevice? device});

  $SikomDeviceCopyWith<$Res>? get device;
}

/// @nodoc
class _$SikomResponseDataCopyWithImpl<$Res, $Val extends SikomResponseData>
    implements $SikomResponseDataCopyWith<$Res> {
  _$SikomResponseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bpapiStatus = null,
    Object? bpapiMessage = null,
    Object? bpapiArray = freezed,
    Object? result = freezed,
    Object? scalarResult = freezed,
    Object? device = freezed,
  }) {
    return _then(_value.copyWith(
      bpapiStatus: null == bpapiStatus
          ? _value.bpapiStatus
          : bpapiStatus // ignore: cast_nullable_to_non_nullable
              as String,
      bpapiMessage: null == bpapiMessage
          ? _value.bpapiMessage
          : bpapiMessage // ignore: cast_nullable_to_non_nullable
              as String,
      bpapiArray: freezed == bpapiArray
          ? _value.bpapiArray
          : bpapiArray // ignore: cast_nullable_to_non_nullable
              as List<SikomResponseDataArrayObject>?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as List<Object>?,
      scalarResult:
          freezed == scalarResult ? _value.scalarResult : scalarResult,
      device: freezed == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as SikomDevice?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomDeviceCopyWith<$Res>? get device {
    if (_value.device == null) {
      return null;
    }

    return $SikomDeviceCopyWith<$Res>(_value.device!, (value) {
      return _then(_value.copyWith(device: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SikomResponseDataImplCopyWith<$Res>
    implements $SikomResponseDataCopyWith<$Res> {
  factory _$$SikomResponseDataImplCopyWith(_$SikomResponseDataImpl value,
          $Res Function(_$SikomResponseDataImpl) then) =
      __$$SikomResponseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'bpapi_status') String bpapiStatus,
      @JsonKey(name: 'bpapi_message') String bpapiMessage,
      @JsonKey(name: 'bpapi_array')
      List<SikomResponseDataArrayObject>? bpapiArray,
      List<Object>? result,
      @JsonKey(name: 'scalar_result') Object? scalarResult,
      @JsonKey(name: 'device') SikomDevice? device});

  @override
  $SikomDeviceCopyWith<$Res>? get device;
}

/// @nodoc
class __$$SikomResponseDataImplCopyWithImpl<$Res>
    extends _$SikomResponseDataCopyWithImpl<$Res, _$SikomResponseDataImpl>
    implements _$$SikomResponseDataImplCopyWith<$Res> {
  __$$SikomResponseDataImplCopyWithImpl(_$SikomResponseDataImpl _value,
      $Res Function(_$SikomResponseDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bpapiStatus = null,
    Object? bpapiMessage = null,
    Object? bpapiArray = freezed,
    Object? result = freezed,
    Object? scalarResult = freezed,
    Object? device = freezed,
  }) {
    return _then(_$SikomResponseDataImpl(
      bpapiStatus: null == bpapiStatus
          ? _value.bpapiStatus
          : bpapiStatus // ignore: cast_nullable_to_non_nullable
              as String,
      bpapiMessage: null == bpapiMessage
          ? _value.bpapiMessage
          : bpapiMessage // ignore: cast_nullable_to_non_nullable
              as String,
      bpapiArray: freezed == bpapiArray
          ? _value._bpapiArray
          : bpapiArray // ignore: cast_nullable_to_non_nullable
              as List<SikomResponseDataArrayObject>?,
      result: freezed == result
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<Object>?,
      scalarResult:
          freezed == scalarResult ? _value.scalarResult : scalarResult,
      device: freezed == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as SikomDevice?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SikomResponseDataImpl extends _SikomResponseData {
  const _$SikomResponseDataImpl(
      {@JsonKey(name: 'bpapi_status') required this.bpapiStatus,
      @JsonKey(name: 'bpapi_message') required this.bpapiMessage,
      @JsonKey(name: 'bpapi_array')
      final List<SikomResponseDataArrayObject>? bpapiArray,
      final List<Object>? result,
      @JsonKey(name: 'scalar_result') this.scalarResult,
      @JsonKey(name: 'device') this.device})
      : _bpapiArray = bpapiArray,
        _result = result,
        super._();

  factory _$SikomResponseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SikomResponseDataImplFromJson(json);

  @override
  @JsonKey(name: 'bpapi_status')
  final String bpapiStatus;
  @override
  @JsonKey(name: 'bpapi_message')
  final String bpapiMessage;
  final List<SikomResponseDataArrayObject>? _bpapiArray;
  @override
  @JsonKey(name: 'bpapi_array')
  List<SikomResponseDataArrayObject>? get bpapiArray {
    final value = _bpapiArray;
    if (value == null) return null;
    if (_bpapiArray is EqualUnmodifiableListView) return _bpapiArray;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Object>? _result;
  @override
  List<Object>? get result {
    final value = _result;
    if (value == null) return null;
    if (_result is EqualUnmodifiableListView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'scalar_result')
  final Object? scalarResult;
  @override
  @JsonKey(name: 'device')
  final SikomDevice? device;

  @override
  String toString() {
    return 'SikomResponseData(bpapiStatus: $bpapiStatus, bpapiMessage: $bpapiMessage, bpapiArray: $bpapiArray, result: $result, scalarResult: $scalarResult, device: $device)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SikomResponseDataImpl &&
            (identical(other.bpapiStatus, bpapiStatus) ||
                other.bpapiStatus == bpapiStatus) &&
            (identical(other.bpapiMessage, bpapiMessage) ||
                other.bpapiMessage == bpapiMessage) &&
            const DeepCollectionEquality()
                .equals(other._bpapiArray, _bpapiArray) &&
            const DeepCollectionEquality().equals(other._result, _result) &&
            const DeepCollectionEquality()
                .equals(other.scalarResult, scalarResult) &&
            (identical(other.device, device) || other.device == device));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      bpapiStatus,
      bpapiMessage,
      const DeepCollectionEquality().hash(_bpapiArray),
      const DeepCollectionEquality().hash(_result),
      const DeepCollectionEquality().hash(scalarResult),
      device);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SikomResponseDataImplCopyWith<_$SikomResponseDataImpl> get copyWith =>
      __$$SikomResponseDataImplCopyWithImpl<_$SikomResponseDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SikomResponseDataImplToJson(
      this,
    );
  }
}

abstract class _SikomResponseData extends SikomResponseData {
  const factory _SikomResponseData(
          {@JsonKey(name: 'bpapi_status') required final String bpapiStatus,
          @JsonKey(name: 'bpapi_message') required final String bpapiMessage,
          @JsonKey(name: 'bpapi_array')
          final List<SikomResponseDataArrayObject>? bpapiArray,
          final List<Object>? result,
          @JsonKey(name: 'scalar_result') final Object? scalarResult,
          @JsonKey(name: 'device') final SikomDevice? device}) =
      _$SikomResponseDataImpl;
  const _SikomResponseData._() : super._();

  factory _SikomResponseData.fromJson(Map<String, dynamic> json) =
      _$SikomResponseDataImpl.fromJson;

  @override
  @JsonKey(name: 'bpapi_status')
  String get bpapiStatus;
  @override
  @JsonKey(name: 'bpapi_message')
  String get bpapiMessage;
  @override
  @JsonKey(name: 'bpapi_array')
  List<SikomResponseDataArrayObject>? get bpapiArray;
  @override
  List<Object>? get result;
  @override
  @JsonKey(name: 'scalar_result')
  Object? get scalarResult;
  @override
  @JsonKey(name: 'device')
  SikomDevice? get device;
  @override
  @JsonKey(ignore: true)
  _$$SikomResponseDataImplCopyWith<_$SikomResponseDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SikomResponseDataArrayObject _$SikomResponseDataArrayObjectFromJson(
    Map<String, dynamic> json) {
  return _SikomResponseDataArrayObject.fromJson(json);
}

/// @nodoc
mixin _$SikomResponseDataArrayObject {
  @JsonKey(name: 'gateway')
  SikomGateway? get gateway => throw _privateConstructorUsedError;
  @JsonKey(name: 'device')
  SikomDevice? get device => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SikomResponseDataArrayObjectCopyWith<SikomResponseDataArrayObject>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SikomResponseDataArrayObjectCopyWith<$Res> {
  factory $SikomResponseDataArrayObjectCopyWith(
          SikomResponseDataArrayObject value,
          $Res Function(SikomResponseDataArrayObject) then) =
      _$SikomResponseDataArrayObjectCopyWithImpl<$Res,
          SikomResponseDataArrayObject>;
  @useResult
  $Res call(
      {@JsonKey(name: 'gateway') SikomGateway? gateway,
      @JsonKey(name: 'device') SikomDevice? device});

  $SikomGatewayCopyWith<$Res>? get gateway;
  $SikomDeviceCopyWith<$Res>? get device;
}

/// @nodoc
class _$SikomResponseDataArrayObjectCopyWithImpl<$Res,
        $Val extends SikomResponseDataArrayObject>
    implements $SikomResponseDataArrayObjectCopyWith<$Res> {
  _$SikomResponseDataArrayObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gateway = freezed,
    Object? device = freezed,
  }) {
    return _then(_value.copyWith(
      gateway: freezed == gateway
          ? _value.gateway
          : gateway // ignore: cast_nullable_to_non_nullable
              as SikomGateway?,
      device: freezed == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as SikomDevice?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomGatewayCopyWith<$Res>? get gateway {
    if (_value.gateway == null) {
      return null;
    }

    return $SikomGatewayCopyWith<$Res>(_value.gateway!, (value) {
      return _then(_value.copyWith(gateway: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomDeviceCopyWith<$Res>? get device {
    if (_value.device == null) {
      return null;
    }

    return $SikomDeviceCopyWith<$Res>(_value.device!, (value) {
      return _then(_value.copyWith(device: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SikomResponseDataArrayObjectImplCopyWith<$Res>
    implements $SikomResponseDataArrayObjectCopyWith<$Res> {
  factory _$$SikomResponseDataArrayObjectImplCopyWith(
          _$SikomResponseDataArrayObjectImpl value,
          $Res Function(_$SikomResponseDataArrayObjectImpl) then) =
      __$$SikomResponseDataArrayObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'gateway') SikomGateway? gateway,
      @JsonKey(name: 'device') SikomDevice? device});

  @override
  $SikomGatewayCopyWith<$Res>? get gateway;
  @override
  $SikomDeviceCopyWith<$Res>? get device;
}

/// @nodoc
class __$$SikomResponseDataArrayObjectImplCopyWithImpl<$Res>
    extends _$SikomResponseDataArrayObjectCopyWithImpl<$Res,
        _$SikomResponseDataArrayObjectImpl>
    implements _$$SikomResponseDataArrayObjectImplCopyWith<$Res> {
  __$$SikomResponseDataArrayObjectImplCopyWithImpl(
      _$SikomResponseDataArrayObjectImpl _value,
      $Res Function(_$SikomResponseDataArrayObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gateway = freezed,
    Object? device = freezed,
  }) {
    return _then(_$SikomResponseDataArrayObjectImpl(
      gateway: freezed == gateway
          ? _value.gateway
          : gateway // ignore: cast_nullable_to_non_nullable
              as SikomGateway?,
      device: freezed == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as SikomDevice?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SikomResponseDataArrayObjectImpl
    implements _SikomResponseDataArrayObject {
  const _$SikomResponseDataArrayObjectImpl(
      {@JsonKey(name: 'gateway') this.gateway,
      @JsonKey(name: 'device') this.device});

  factory _$SikomResponseDataArrayObjectImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SikomResponseDataArrayObjectImplFromJson(json);

  @override
  @JsonKey(name: 'gateway')
  final SikomGateway? gateway;
  @override
  @JsonKey(name: 'device')
  final SikomDevice? device;

  @override
  String toString() {
    return 'SikomResponseDataArrayObject(gateway: $gateway, device: $device)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SikomResponseDataArrayObjectImpl &&
            (identical(other.gateway, gateway) || other.gateway == gateway) &&
            (identical(other.device, device) || other.device == device));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, gateway, device);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SikomResponseDataArrayObjectImplCopyWith<
          _$SikomResponseDataArrayObjectImpl>
      get copyWith => __$$SikomResponseDataArrayObjectImplCopyWithImpl<
          _$SikomResponseDataArrayObjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SikomResponseDataArrayObjectImplToJson(
      this,
    );
  }
}

abstract class _SikomResponseDataArrayObject
    implements SikomResponseDataArrayObject {
  const factory _SikomResponseDataArrayObject(
          {@JsonKey(name: 'gateway') final SikomGateway? gateway,
          @JsonKey(name: 'device') final SikomDevice? device}) =
      _$SikomResponseDataArrayObjectImpl;

  factory _SikomResponseDataArrayObject.fromJson(Map<String, dynamic> json) =
      _$SikomResponseDataArrayObjectImpl.fromJson;

  @override
  @JsonKey(name: 'gateway')
  SikomGateway? get gateway;
  @override
  @JsonKey(name: 'device')
  SikomDevice? get device;
  @override
  @JsonKey(ignore: true)
  _$$SikomResponseDataArrayObjectImplCopyWith<
          _$SikomResponseDataArrayObjectImpl>
      get copyWith => throw _privateConstructorUsedError;
}
