// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NetworkInfo {
  NetworkDeviceInfo get local;
  List<NetworkDeviceInfo> get devices;

  /// Create a copy of NetworkInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NetworkInfoCopyWith<NetworkInfo> get copyWith =>
      _$NetworkInfoCopyWithImpl<NetworkInfo>(this as NetworkInfo, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NetworkInfo &&
            (identical(other.local, local) || other.local == local) &&
            const DeepCollectionEquality().equals(other.devices, devices));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, local, const DeepCollectionEquality().hash(devices));

  @override
  String toString() {
    return 'NetworkInfo(local: $local, devices: $devices)';
  }
}

/// @nodoc
abstract mixin class $NetworkInfoCopyWith<$Res> {
  factory $NetworkInfoCopyWith(
          NetworkInfo value, $Res Function(NetworkInfo) _then) =
      _$NetworkInfoCopyWithImpl;
  @useResult
  $Res call({NetworkDeviceInfo local, List<NetworkDeviceInfo> devices});

  $NetworkDeviceInfoCopyWith<$Res> get local;
}

/// @nodoc
class _$NetworkInfoCopyWithImpl<$Res> implements $NetworkInfoCopyWith<$Res> {
  _$NetworkInfoCopyWithImpl(this._self, this._then);

  final NetworkInfo _self;
  final $Res Function(NetworkInfo) _then;

  /// Create a copy of NetworkInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? local = null,
    Object? devices = null,
  }) {
    return _then(_self.copyWith(
      local: null == local
          ? _self.local
          : local // ignore: cast_nullable_to_non_nullable
              as NetworkDeviceInfo,
      devices: null == devices
          ? _self.devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<NetworkDeviceInfo>,
    ));
  }

  /// Create a copy of NetworkInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NetworkDeviceInfoCopyWith<$Res> get local {
    return $NetworkDeviceInfoCopyWith<$Res>(_self.local, (value) {
      return _then(_self.copyWith(local: value));
    });
  }
}

/// @nodoc

class _NetworkInfo implements NetworkInfo {
  const _NetworkInfo(
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

  /// Create a copy of NetworkInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NetworkInfoCopyWith<_NetworkInfo> get copyWith =>
      __$NetworkInfoCopyWithImpl<_NetworkInfo>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NetworkInfo &&
            (identical(other.local, local) || other.local == local) &&
            const DeepCollectionEquality().equals(other._devices, _devices));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, local, const DeepCollectionEquality().hash(_devices));

  @override
  String toString() {
    return 'NetworkInfo(local: $local, devices: $devices)';
  }
}

/// @nodoc
abstract mixin class _$NetworkInfoCopyWith<$Res>
    implements $NetworkInfoCopyWith<$Res> {
  factory _$NetworkInfoCopyWith(
          _NetworkInfo value, $Res Function(_NetworkInfo) _then) =
      __$NetworkInfoCopyWithImpl;
  @override
  @useResult
  $Res call({NetworkDeviceInfo local, List<NetworkDeviceInfo> devices});

  @override
  $NetworkDeviceInfoCopyWith<$Res> get local;
}

/// @nodoc
class __$NetworkInfoCopyWithImpl<$Res> implements _$NetworkInfoCopyWith<$Res> {
  __$NetworkInfoCopyWithImpl(this._self, this._then);

  final _NetworkInfo _self;
  final $Res Function(_NetworkInfo) _then;

  /// Create a copy of NetworkInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? local = null,
    Object? devices = null,
  }) {
    return _then(_NetworkInfo(
      local: null == local
          ? _self.local
          : local // ignore: cast_nullable_to_non_nullable
              as NetworkDeviceInfo,
      devices: null == devices
          ? _self._devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<NetworkDeviceInfo>,
    ));
  }

  /// Create a copy of NetworkInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NetworkDeviceInfoCopyWith<$Res> get local {
    return $NetworkDeviceInfoCopyWith<$Res>(_self.local, (value) {
      return _then(_self.copyWith(local: value));
    });
  }
}

/// @nodoc
mixin _$NetworkDeviceInfo {
  String get hostId;
  String get ipAddress;
  String get deviceName;
  bool get isAvailable;
  String? get hostName;
  String? get macAddress;
  String? get vendorName;
  DateTime? get aliveWhen;

  /// Create a copy of NetworkDeviceInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NetworkDeviceInfoCopyWith<NetworkDeviceInfo> get copyWith =>
      _$NetworkDeviceInfoCopyWithImpl<NetworkDeviceInfo>(
          this as NetworkDeviceInfo, _$identity);

  /// Serializes this NetworkDeviceInfo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NetworkDeviceInfo &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hostId, ipAddress, deviceName,
      isAvailable, hostName, macAddress, vendorName, aliveWhen);

  @override
  String toString() {
    return 'NetworkDeviceInfo(hostId: $hostId, ipAddress: $ipAddress, deviceName: $deviceName, isAvailable: $isAvailable, hostName: $hostName, macAddress: $macAddress, vendorName: $vendorName, aliveWhen: $aliveWhen)';
  }
}

/// @nodoc
abstract mixin class $NetworkDeviceInfoCopyWith<$Res> {
  factory $NetworkDeviceInfoCopyWith(
          NetworkDeviceInfo value, $Res Function(NetworkDeviceInfo) _then) =
      _$NetworkDeviceInfoCopyWithImpl;
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
class _$NetworkDeviceInfoCopyWithImpl<$Res>
    implements $NetworkDeviceInfoCopyWith<$Res> {
  _$NetworkDeviceInfoCopyWithImpl(this._self, this._then);

  final NetworkDeviceInfo _self;
  final $Res Function(NetworkDeviceInfo) _then;

  /// Create a copy of NetworkDeviceInfo
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_self.copyWith(
      hostId: null == hostId
          ? _self.hostId
          : hostId // ignore: cast_nullable_to_non_nullable
              as String,
      ipAddress: null == ipAddress
          ? _self.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String,
      deviceName: null == deviceName
          ? _self.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      isAvailable: null == isAvailable
          ? _self.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      hostName: freezed == hostName
          ? _self.hostName
          : hostName // ignore: cast_nullable_to_non_nullable
              as String?,
      macAddress: freezed == macAddress
          ? _self.macAddress
          : macAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorName: freezed == vendorName
          ? _self.vendorName
          : vendorName // ignore: cast_nullable_to_non_nullable
              as String?,
      aliveWhen: freezed == aliveWhen
          ? _self.aliveWhen
          : aliveWhen // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _NetworkDeviceInfo extends NetworkDeviceInfo {
  const _NetworkDeviceInfo(
      {required this.hostId,
      required this.ipAddress,
      required this.deviceName,
      required this.isAvailable,
      this.hostName,
      this.macAddress,
      this.vendorName,
      this.aliveWhen})
      : super._();
  factory _NetworkDeviceInfo.fromJson(Map<String, dynamic> json) =>
      _$NetworkDeviceInfoFromJson(json);

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

  /// Create a copy of NetworkDeviceInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NetworkDeviceInfoCopyWith<_NetworkDeviceInfo> get copyWith =>
      __$NetworkDeviceInfoCopyWithImpl<_NetworkDeviceInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NetworkDeviceInfoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NetworkDeviceInfo &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hostId, ipAddress, deviceName,
      isAvailable, hostName, macAddress, vendorName, aliveWhen);

  @override
  String toString() {
    return 'NetworkDeviceInfo(hostId: $hostId, ipAddress: $ipAddress, deviceName: $deviceName, isAvailable: $isAvailable, hostName: $hostName, macAddress: $macAddress, vendorName: $vendorName, aliveWhen: $aliveWhen)';
  }
}

/// @nodoc
abstract mixin class _$NetworkDeviceInfoCopyWith<$Res>
    implements $NetworkDeviceInfoCopyWith<$Res> {
  factory _$NetworkDeviceInfoCopyWith(
          _NetworkDeviceInfo value, $Res Function(_NetworkDeviceInfo) _then) =
      __$NetworkDeviceInfoCopyWithImpl;
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
class __$NetworkDeviceInfoCopyWithImpl<$Res>
    implements _$NetworkDeviceInfoCopyWith<$Res> {
  __$NetworkDeviceInfoCopyWithImpl(this._self, this._then);

  final _NetworkDeviceInfo _self;
  final $Res Function(_NetworkDeviceInfo) _then;

  /// Create a copy of NetworkDeviceInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_NetworkDeviceInfo(
      hostId: null == hostId
          ? _self.hostId
          : hostId // ignore: cast_nullable_to_non_nullable
              as String,
      ipAddress: null == ipAddress
          ? _self.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String,
      deviceName: null == deviceName
          ? _self.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      isAvailable: null == isAvailable
          ? _self.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      hostName: freezed == hostName
          ? _self.hostName
          : hostName // ignore: cast_nullable_to_non_nullable
              as String?,
      macAddress: freezed == macAddress
          ? _self.macAddress
          : macAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorName: freezed == vendorName
          ? _self.vendorName
          : vendorName // ignore: cast_nullable_to_non_nullable
              as String?,
      aliveWhen: freezed == aliveWhen
          ? _self.aliveWhen
          : aliveWhen // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
