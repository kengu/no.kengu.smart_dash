// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NetworkInfo {
  NetworkDeviceInfo get local => throw _privateConstructorUsedError;
  List<NetworkDeviceInfo> get devices => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NetworkInfoCopyWith<NetworkInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkInfoCopyWith<$Res> {
  factory $NetworkInfoCopyWith(
          NetworkInfo value, $Res Function(NetworkInfo) then) =
      _$NetworkInfoCopyWithImpl<$Res, NetworkInfo>;
  @useResult
  $Res call({NetworkDeviceInfo local, List<NetworkDeviceInfo> devices});

  $NetworkDeviceInfoCopyWith<$Res> get local;
}

/// @nodoc
class _$NetworkInfoCopyWithImpl<$Res, $Val extends NetworkInfo>
    implements $NetworkInfoCopyWith<$Res> {
  _$NetworkInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? local = null,
    Object? devices = null,
  }) {
    return _then(_value.copyWith(
      local: null == local
          ? _value.local
          : local // ignore: cast_nullable_to_non_nullable
              as NetworkDeviceInfo,
      devices: null == devices
          ? _value.devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<NetworkDeviceInfo>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NetworkDeviceInfoCopyWith<$Res> get local {
    return $NetworkDeviceInfoCopyWith<$Res>(_value.local, (value) {
      return _then(_value.copyWith(local: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NetworkInfoImplCopyWith<$Res>
    implements $NetworkInfoCopyWith<$Res> {
  factory _$$NetworkInfoImplCopyWith(
          _$NetworkInfoImpl value, $Res Function(_$NetworkInfoImpl) then) =
      __$$NetworkInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({NetworkDeviceInfo local, List<NetworkDeviceInfo> devices});

  @override
  $NetworkDeviceInfoCopyWith<$Res> get local;
}

/// @nodoc
class __$$NetworkInfoImplCopyWithImpl<$Res>
    extends _$NetworkInfoCopyWithImpl<$Res, _$NetworkInfoImpl>
    implements _$$NetworkInfoImplCopyWith<$Res> {
  __$$NetworkInfoImplCopyWithImpl(
      _$NetworkInfoImpl _value, $Res Function(_$NetworkInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? local = null,
    Object? devices = null,
  }) {
    return _then(_$NetworkInfoImpl(
      local: null == local
          ? _value.local
          : local // ignore: cast_nullable_to_non_nullable
              as NetworkDeviceInfo,
      devices: null == devices
          ? _value._devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<NetworkDeviceInfo>,
    ));
  }
}

/// @nodoc

class _$NetworkInfoImpl implements _NetworkInfo {
  const _$NetworkInfoImpl(
      {required this.local, required final List<NetworkDeviceInfo> devices})
      : _devices = devices;

  @override
  final NetworkDeviceInfo local;
  final List<NetworkDeviceInfo> _devices;
  @override
  List<NetworkDeviceInfo> get devices {
    if (_devices is EqualUnmodifiableListView) return _devices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devices);
  }

  @override
  String toString() {
    return 'NetworkInfo(local: $local, devices: $devices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkInfoImpl &&
            (identical(other.local, local) || other.local == local) &&
            const DeepCollectionEquality().equals(other._devices, _devices));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, local, const DeepCollectionEquality().hash(_devices));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkInfoImplCopyWith<_$NetworkInfoImpl> get copyWith =>
      __$$NetworkInfoImplCopyWithImpl<_$NetworkInfoImpl>(this, _$identity);
}

abstract class _NetworkInfo implements NetworkInfo {
  const factory _NetworkInfo(
      {required final NetworkDeviceInfo local,
      required final List<NetworkDeviceInfo> devices}) = _$NetworkInfoImpl;

  @override
  NetworkDeviceInfo get local;
  @override
  List<NetworkDeviceInfo> get devices;
  @override
  @JsonKey(ignore: true)
  _$$NetworkInfoImplCopyWith<_$NetworkInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NetworkDeviceInfo _$NetworkDeviceInfoFromJson(Map<String, dynamic> json) {
  return _NetworkDeviceInfo.fromJson(json);
}

/// @nodoc
mixin _$NetworkDeviceInfo {
  String get hostId => throw _privateConstructorUsedError;
  String get ipAddress => throw _privateConstructorUsedError;
  String get deviceName => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;
  String? get hostName => throw _privateConstructorUsedError;
  String? get macAddress => throw _privateConstructorUsedError;
  String? get vendorName => throw _privateConstructorUsedError;
  DateTime? get aliveWhen => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NetworkDeviceInfoCopyWith<NetworkDeviceInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkDeviceInfoCopyWith<$Res> {
  factory $NetworkDeviceInfoCopyWith(
          NetworkDeviceInfo value, $Res Function(NetworkDeviceInfo) then) =
      _$NetworkDeviceInfoCopyWithImpl<$Res, NetworkDeviceInfo>;
  @useResult
  $Res call(
      {String hostId,
      String ipAddress,
      String deviceName,
      bool isAvailable,
      String? hostName,
      String? macAddress,
      String? vendorName,
      DateTime? aliveWhen});
}

/// @nodoc
class _$NetworkDeviceInfoCopyWithImpl<$Res, $Val extends NetworkDeviceInfo>
    implements $NetworkDeviceInfoCopyWith<$Res> {
  _$NetworkDeviceInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hostId = null,
    Object? ipAddress = null,
    Object? deviceName = null,
    Object? isAvailable = null,
    Object? hostName = freezed,
    Object? macAddress = freezed,
    Object? vendorName = freezed,
    Object? aliveWhen = freezed,
  }) {
    return _then(_value.copyWith(
      hostId: null == hostId
          ? _value.hostId
          : hostId // ignore: cast_nullable_to_non_nullable
              as String,
      ipAddress: null == ipAddress
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String,
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      hostName: freezed == hostName
          ? _value.hostName
          : hostName // ignore: cast_nullable_to_non_nullable
              as String?,
      macAddress: freezed == macAddress
          ? _value.macAddress
          : macAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorName: freezed == vendorName
          ? _value.vendorName
          : vendorName // ignore: cast_nullable_to_non_nullable
              as String?,
      aliveWhen: freezed == aliveWhen
          ? _value.aliveWhen
          : aliveWhen // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NetworkDeviceInfoImplCopyWith<$Res>
    implements $NetworkDeviceInfoCopyWith<$Res> {
  factory _$$NetworkDeviceInfoImplCopyWith(_$NetworkDeviceInfoImpl value,
          $Res Function(_$NetworkDeviceInfoImpl) then) =
      __$$NetworkDeviceInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String hostId,
      String ipAddress,
      String deviceName,
      bool isAvailable,
      String? hostName,
      String? macAddress,
      String? vendorName,
      DateTime? aliveWhen});
}

/// @nodoc
class __$$NetworkDeviceInfoImplCopyWithImpl<$Res>
    extends _$NetworkDeviceInfoCopyWithImpl<$Res, _$NetworkDeviceInfoImpl>
    implements _$$NetworkDeviceInfoImplCopyWith<$Res> {
  __$$NetworkDeviceInfoImplCopyWithImpl(_$NetworkDeviceInfoImpl _value,
      $Res Function(_$NetworkDeviceInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hostId = null,
    Object? ipAddress = null,
    Object? deviceName = null,
    Object? isAvailable = null,
    Object? hostName = freezed,
    Object? macAddress = freezed,
    Object? vendorName = freezed,
    Object? aliveWhen = freezed,
  }) {
    return _then(_$NetworkDeviceInfoImpl(
      hostId: null == hostId
          ? _value.hostId
          : hostId // ignore: cast_nullable_to_non_nullable
              as String,
      ipAddress: null == ipAddress
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String,
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      hostName: freezed == hostName
          ? _value.hostName
          : hostName // ignore: cast_nullable_to_non_nullable
              as String?,
      macAddress: freezed == macAddress
          ? _value.macAddress
          : macAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorName: freezed == vendorName
          ? _value.vendorName
          : vendorName // ignore: cast_nullable_to_non_nullable
              as String?,
      aliveWhen: freezed == aliveWhen
          ? _value.aliveWhen
          : aliveWhen // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NetworkDeviceInfoImpl extends _NetworkDeviceInfo {
  const _$NetworkDeviceInfoImpl(
      {required this.hostId,
      required this.ipAddress,
      required this.deviceName,
      required this.isAvailable,
      this.hostName,
      this.macAddress,
      this.vendorName,
      this.aliveWhen})
      : super._();

  factory _$NetworkDeviceInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$NetworkDeviceInfoImplFromJson(json);

  @override
  final String hostId;
  @override
  final String ipAddress;
  @override
  final String deviceName;
  @override
  final bool isAvailable;
  @override
  final String? hostName;
  @override
  final String? macAddress;
  @override
  final String? vendorName;
  @override
  final DateTime? aliveWhen;

  @override
  String toString() {
    return 'NetworkDeviceInfo(hostId: $hostId, ipAddress: $ipAddress, deviceName: $deviceName, isAvailable: $isAvailable, hostName: $hostName, macAddress: $macAddress, vendorName: $vendorName, aliveWhen: $aliveWhen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkDeviceInfoImpl &&
            (identical(other.hostId, hostId) || other.hostId == hostId) &&
            (identical(other.ipAddress, ipAddress) ||
                other.ipAddress == ipAddress) &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.hostName, hostName) ||
                other.hostName == hostName) &&
            (identical(other.macAddress, macAddress) ||
                other.macAddress == macAddress) &&
            (identical(other.vendorName, vendorName) ||
                other.vendorName == vendorName) &&
            (identical(other.aliveWhen, aliveWhen) ||
                other.aliveWhen == aliveWhen));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, hostId, ipAddress, deviceName,
      isAvailable, hostName, macAddress, vendorName, aliveWhen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkDeviceInfoImplCopyWith<_$NetworkDeviceInfoImpl> get copyWith =>
      __$$NetworkDeviceInfoImplCopyWithImpl<_$NetworkDeviceInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NetworkDeviceInfoImplToJson(
      this,
    );
  }
}

abstract class _NetworkDeviceInfo extends NetworkDeviceInfo {
  const factory _NetworkDeviceInfo(
      {required final String hostId,
      required final String ipAddress,
      required final String deviceName,
      required final bool isAvailable,
      final String? hostName,
      final String? macAddress,
      final String? vendorName,
      final DateTime? aliveWhen}) = _$NetworkDeviceInfoImpl;
  const _NetworkDeviceInfo._() : super._();

  factory _NetworkDeviceInfo.fromJson(Map<String, dynamic> json) =
      _$NetworkDeviceInfoImpl.fromJson;

  @override
  String get hostId;
  @override
  String get ipAddress;
  @override
  String get deviceName;
  @override
  bool get isAvailable;
  @override
  String? get hostName;
  @override
  String? get macAddress;
  @override
  String? get vendorName;
  @override
  DateTime? get aliveWhen;
  @override
  @JsonKey(ignore: true)
  _$$NetworkDeviceInfoImplCopyWith<_$NetworkDeviceInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
