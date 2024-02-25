// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Device _$DeviceFromJson(Map<String, dynamic> json) {
  return _Device.fromJson(json);
}

/// @nodoc
mixin _$Device {
  /// Get the device's id
  String get id => throw _privateConstructorUsedError;

  /// Get the device's name
  String get name => throw _privateConstructorUsedError;

  /// Get the device's service
  String get service => throw _privateConstructorUsedError;

  /// Get the device's type
  DeviceType get type => throw _privateConstructorUsedError;

  /// Get the device's data object (is unmodifiable)
  Map<String, Object?> get data => throw _privateConstructorUsedError;

  /// The device's capabilities array
  List<DeviceCapability> get capabilities => throw _privateConstructorUsedError;

  /// Get the timestamp for when device's was last updated
  DateTime get lastUpdated => throw _privateConstructorUsedError;

  /// Get device's measured temperature (default null)
  double? get rain => throw _privateConstructorUsedError;

  /// Get device's measured ultraviolet radiation (default null)
  int? get ultraviolet => throw _privateConstructorUsedError;

  /// Get device's measured luminance (default null)
  int? get luminance => throw _privateConstructorUsedError;

  /// Get device's measured temperature (default null)
  double? get humidity => throw _privateConstructorUsedError;

  /// Get device's measured temperature (default null)
  double? get windAngle => throw _privateConstructorUsedError;

  /// Get device's measured temperature (default null)
  double? get temperature => throw _privateConstructorUsedError;

  /// Get device's measured wind speed (default null)
  double? get windSpeed => throw _privateConstructorUsedError;

  /// Get device's measured gust speed (default null)
  double? get gustSpeed => throw _privateConstructorUsedError;

  /// Get the device's electric state information (default null)
  ElectricState? get electric => throw _privateConstructorUsedError;

  /// Get the device's switch state information (default null)
  SwitchState? get onOff => throw _privateConstructorUsedError;

  /// Get the device's thermostat information (default null)
  Thermostat? get thermostat => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeviceCopyWith<Device> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceCopyWith<$Res> {
  factory $DeviceCopyWith(Device value, $Res Function(Device) then) =
      _$DeviceCopyWithImpl<$Res, Device>;
  @useResult
  $Res call(
      {String id,
      String name,
      String service,
      DeviceType type,
      Map<String, Object?> data,
      List<DeviceCapability> capabilities,
      DateTime lastUpdated,
      double? rain,
      int? ultraviolet,
      int? luminance,
      double? humidity,
      double? windAngle,
      double? temperature,
      double? windSpeed,
      double? gustSpeed,
      ElectricState? electric,
      SwitchState? onOff,
      Thermostat? thermostat});

  $ElectricStateCopyWith<$Res>? get electric;
  $SwitchStateCopyWith<$Res>? get onOff;
  $ThermostatCopyWith<$Res>? get thermostat;
}

/// @nodoc
class _$DeviceCopyWithImpl<$Res, $Val extends Device>
    implements $DeviceCopyWith<$Res> {
  _$DeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? service = null,
    Object? type = null,
    Object? data = null,
    Object? capabilities = null,
    Object? lastUpdated = null,
    Object? rain = freezed,
    Object? ultraviolet = freezed,
    Object? luminance = freezed,
    Object? humidity = freezed,
    Object? windAngle = freezed,
    Object? temperature = freezed,
    Object? windSpeed = freezed,
    Object? gustSpeed = freezed,
    Object? electric = freezed,
    Object? onOff = freezed,
    Object? thermostat = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DeviceType,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>,
      capabilities: null == capabilities
          ? _value.capabilities
          : capabilities // ignore: cast_nullable_to_non_nullable
              as List<DeviceCapability>,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      rain: freezed == rain
          ? _value.rain
          : rain // ignore: cast_nullable_to_non_nullable
              as double?,
      ultraviolet: freezed == ultraviolet
          ? _value.ultraviolet
          : ultraviolet // ignore: cast_nullable_to_non_nullable
              as int?,
      luminance: freezed == luminance
          ? _value.luminance
          : luminance // ignore: cast_nullable_to_non_nullable
              as int?,
      humidity: freezed == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double?,
      windAngle: freezed == windAngle
          ? _value.windAngle
          : windAngle // ignore: cast_nullable_to_non_nullable
              as double?,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      windSpeed: freezed == windSpeed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as double?,
      gustSpeed: freezed == gustSpeed
          ? _value.gustSpeed
          : gustSpeed // ignore: cast_nullable_to_non_nullable
              as double?,
      electric: freezed == electric
          ? _value.electric
          : electric // ignore: cast_nullable_to_non_nullable
              as ElectricState?,
      onOff: freezed == onOff
          ? _value.onOff
          : onOff // ignore: cast_nullable_to_non_nullable
              as SwitchState?,
      thermostat: freezed == thermostat
          ? _value.thermostat
          : thermostat // ignore: cast_nullable_to_non_nullable
              as Thermostat?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ElectricStateCopyWith<$Res>? get electric {
    if (_value.electric == null) {
      return null;
    }

    return $ElectricStateCopyWith<$Res>(_value.electric!, (value) {
      return _then(_value.copyWith(electric: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SwitchStateCopyWith<$Res>? get onOff {
    if (_value.onOff == null) {
      return null;
    }

    return $SwitchStateCopyWith<$Res>(_value.onOff!, (value) {
      return _then(_value.copyWith(onOff: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ThermostatCopyWith<$Res>? get thermostat {
    if (_value.thermostat == null) {
      return null;
    }

    return $ThermostatCopyWith<$Res>(_value.thermostat!, (value) {
      return _then(_value.copyWith(thermostat: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DeviceImplCopyWith<$Res> implements $DeviceCopyWith<$Res> {
  factory _$$DeviceImplCopyWith(
          _$DeviceImpl value, $Res Function(_$DeviceImpl) then) =
      __$$DeviceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String service,
      DeviceType type,
      Map<String, Object?> data,
      List<DeviceCapability> capabilities,
      DateTime lastUpdated,
      double? rain,
      int? ultraviolet,
      int? luminance,
      double? humidity,
      double? windAngle,
      double? temperature,
      double? windSpeed,
      double? gustSpeed,
      ElectricState? electric,
      SwitchState? onOff,
      Thermostat? thermostat});

  @override
  $ElectricStateCopyWith<$Res>? get electric;
  @override
  $SwitchStateCopyWith<$Res>? get onOff;
  @override
  $ThermostatCopyWith<$Res>? get thermostat;
}

/// @nodoc
class __$$DeviceImplCopyWithImpl<$Res>
    extends _$DeviceCopyWithImpl<$Res, _$DeviceImpl>
    implements _$$DeviceImplCopyWith<$Res> {
  __$$DeviceImplCopyWithImpl(
      _$DeviceImpl _value, $Res Function(_$DeviceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? service = null,
    Object? type = null,
    Object? data = null,
    Object? capabilities = null,
    Object? lastUpdated = null,
    Object? rain = freezed,
    Object? ultraviolet = freezed,
    Object? luminance = freezed,
    Object? humidity = freezed,
    Object? windAngle = freezed,
    Object? temperature = freezed,
    Object? windSpeed = freezed,
    Object? gustSpeed = freezed,
    Object? electric = freezed,
    Object? onOff = freezed,
    Object? thermostat = freezed,
  }) {
    return _then(_$DeviceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DeviceType,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>,
      capabilities: null == capabilities
          ? _value._capabilities
          : capabilities // ignore: cast_nullable_to_non_nullable
              as List<DeviceCapability>,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      rain: freezed == rain
          ? _value.rain
          : rain // ignore: cast_nullable_to_non_nullable
              as double?,
      ultraviolet: freezed == ultraviolet
          ? _value.ultraviolet
          : ultraviolet // ignore: cast_nullable_to_non_nullable
              as int?,
      luminance: freezed == luminance
          ? _value.luminance
          : luminance // ignore: cast_nullable_to_non_nullable
              as int?,
      humidity: freezed == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double?,
      windAngle: freezed == windAngle
          ? _value.windAngle
          : windAngle // ignore: cast_nullable_to_non_nullable
              as double?,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      windSpeed: freezed == windSpeed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as double?,
      gustSpeed: freezed == gustSpeed
          ? _value.gustSpeed
          : gustSpeed // ignore: cast_nullable_to_non_nullable
              as double?,
      electric: freezed == electric
          ? _value.electric
          : electric // ignore: cast_nullable_to_non_nullable
              as ElectricState?,
      onOff: freezed == onOff
          ? _value.onOff
          : onOff // ignore: cast_nullable_to_non_nullable
              as SwitchState?,
      thermostat: freezed == thermostat
          ? _value.thermostat
          : thermostat // ignore: cast_nullable_to_non_nullable
              as Thermostat?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceImpl extends _Device {
  const _$DeviceImpl(
      {required this.id,
      required this.name,
      required this.service,
      required this.type,
      required final Map<String, Object?> data,
      required final List<DeviceCapability> capabilities,
      required this.lastUpdated,
      this.rain,
      this.ultraviolet,
      this.luminance,
      this.humidity,
      this.windAngle,
      this.temperature,
      this.windSpeed,
      this.gustSpeed,
      this.electric,
      this.onOff,
      this.thermostat})
      : _data = data,
        _capabilities = capabilities,
        super._();

  factory _$DeviceImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceImplFromJson(json);

  /// Get the device's id
  @override
  final String id;

  /// Get the device's name
  @override
  final String name;

  /// Get the device's service
  @override
  final String service;

  /// Get the device's type
  @override
  final DeviceType type;

  /// Get the device's data object (is unmodifiable)
  final Map<String, Object?> _data;

  /// Get the device's data object (is unmodifiable)
  @override
  Map<String, Object?> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  /// The device's capabilities array
  final List<DeviceCapability> _capabilities;

  /// The device's capabilities array
  @override
  List<DeviceCapability> get capabilities {
    if (_capabilities is EqualUnmodifiableListView) return _capabilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_capabilities);
  }

  /// Get the timestamp for when device's was last updated
  @override
  final DateTime lastUpdated;

  /// Get device's measured temperature (default null)
  @override
  final double? rain;

  /// Get device's measured ultraviolet radiation (default null)
  @override
  final int? ultraviolet;

  /// Get device's measured luminance (default null)
  @override
  final int? luminance;

  /// Get device's measured temperature (default null)
  @override
  final double? humidity;

  /// Get device's measured temperature (default null)
  @override
  final double? windAngle;

  /// Get device's measured temperature (default null)
  @override
  final double? temperature;

  /// Get device's measured wind speed (default null)
  @override
  final double? windSpeed;

  /// Get device's measured gust speed (default null)
  @override
  final double? gustSpeed;

  /// Get the device's electric state information (default null)
  @override
  final ElectricState? electric;

  /// Get the device's switch state information (default null)
  @override
  final SwitchState? onOff;

  /// Get the device's thermostat information (default null)
  @override
  final Thermostat? thermostat;

  @override
  String toString() {
    return 'Device(id: $id, name: $name, service: $service, type: $type, data: $data, capabilities: $capabilities, lastUpdated: $lastUpdated, rain: $rain, ultraviolet: $ultraviolet, luminance: $luminance, humidity: $humidity, windAngle: $windAngle, temperature: $temperature, windSpeed: $windSpeed, gustSpeed: $gustSpeed, electric: $electric, onOff: $onOff, thermostat: $thermostat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.service, service) || other.service == service) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality()
                .equals(other._capabilities, _capabilities) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            (identical(other.rain, rain) || other.rain == rain) &&
            (identical(other.ultraviolet, ultraviolet) ||
                other.ultraviolet == ultraviolet) &&
            (identical(other.luminance, luminance) ||
                other.luminance == luminance) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.windAngle, windAngle) ||
                other.windAngle == windAngle) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.windSpeed, windSpeed) ||
                other.windSpeed == windSpeed) &&
            (identical(other.gustSpeed, gustSpeed) ||
                other.gustSpeed == gustSpeed) &&
            (identical(other.electric, electric) ||
                other.electric == electric) &&
            (identical(other.onOff, onOff) || other.onOff == onOff) &&
            (identical(other.thermostat, thermostat) ||
                other.thermostat == thermostat));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      service,
      type,
      const DeepCollectionEquality().hash(_data),
      const DeepCollectionEquality().hash(_capabilities),
      lastUpdated,
      rain,
      ultraviolet,
      luminance,
      humidity,
      windAngle,
      temperature,
      windSpeed,
      gustSpeed,
      electric,
      onOff,
      thermostat);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceImplCopyWith<_$DeviceImpl> get copyWith =>
      __$$DeviceImplCopyWithImpl<_$DeviceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceImplToJson(
      this,
    );
  }
}

abstract class _Device extends Device {
  const factory _Device(
      {required final String id,
      required final String name,
      required final String service,
      required final DeviceType type,
      required final Map<String, Object?> data,
      required final List<DeviceCapability> capabilities,
      required final DateTime lastUpdated,
      final double? rain,
      final int? ultraviolet,
      final int? luminance,
      final double? humidity,
      final double? windAngle,
      final double? temperature,
      final double? windSpeed,
      final double? gustSpeed,
      final ElectricState? electric,
      final SwitchState? onOff,
      final Thermostat? thermostat}) = _$DeviceImpl;
  const _Device._() : super._();

  factory _Device.fromJson(Map<String, dynamic> json) = _$DeviceImpl.fromJson;

  @override

  /// Get the device's id
  String get id;
  @override

  /// Get the device's name
  String get name;
  @override

  /// Get the device's service
  String get service;
  @override

  /// Get the device's type
  DeviceType get type;
  @override

  /// Get the device's data object (is unmodifiable)
  Map<String, Object?> get data;
  @override

  /// The device's capabilities array
  List<DeviceCapability> get capabilities;
  @override

  /// Get the timestamp for when device's was last updated
  DateTime get lastUpdated;
  @override

  /// Get device's measured temperature (default null)
  double? get rain;
  @override

  /// Get device's measured ultraviolet radiation (default null)
  int? get ultraviolet;
  @override

  /// Get device's measured luminance (default null)
  int? get luminance;
  @override

  /// Get device's measured temperature (default null)
  double? get humidity;
  @override

  /// Get device's measured temperature (default null)
  double? get windAngle;
  @override

  /// Get device's measured temperature (default null)
  double? get temperature;
  @override

  /// Get device's measured wind speed (default null)
  double? get windSpeed;
  @override

  /// Get device's measured gust speed (default null)
  double? get gustSpeed;
  @override

  /// Get the device's electric state information (default null)
  ElectricState? get electric;
  @override

  /// Get the device's switch state information (default null)
  SwitchState? get onOff;
  @override

  /// Get the device's thermostat information (default null)
  Thermostat? get thermostat;
  @override
  @JsonKey(ignore: true)
  _$$DeviceImplCopyWith<_$DeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Identity _$IdentityFromJson(Map<String, dynamic> json) {
  return _Identity.fromJson(json);
}

/// @nodoc
mixin _$Identity {
  String get deviceId => throw _privateConstructorUsedError;
  String get serviceKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdentityCopyWith<Identity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdentityCopyWith<$Res> {
  factory $IdentityCopyWith(Identity value, $Res Function(Identity) then) =
      _$IdentityCopyWithImpl<$Res, Identity>;
  @useResult
  $Res call({String deviceId, String serviceKey});
}

/// @nodoc
class _$IdentityCopyWithImpl<$Res, $Val extends Identity>
    implements $IdentityCopyWith<$Res> {
  _$IdentityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? serviceKey = null,
  }) {
    return _then(_value.copyWith(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      serviceKey: null == serviceKey
          ? _value.serviceKey
          : serviceKey // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IdentityImplCopyWith<$Res>
    implements $IdentityCopyWith<$Res> {
  factory _$$IdentityImplCopyWith(
          _$IdentityImpl value, $Res Function(_$IdentityImpl) then) =
      __$$IdentityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String deviceId, String serviceKey});
}

/// @nodoc
class __$$IdentityImplCopyWithImpl<$Res>
    extends _$IdentityCopyWithImpl<$Res, _$IdentityImpl>
    implements _$$IdentityImplCopyWith<$Res> {
  __$$IdentityImplCopyWithImpl(
      _$IdentityImpl _value, $Res Function(_$IdentityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? serviceKey = null,
  }) {
    return _then(_$IdentityImpl(
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      serviceKey: null == serviceKey
          ? _value.serviceKey
          : serviceKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IdentityImpl extends _Identity {
  const _$IdentityImpl({required this.deviceId, required this.serviceKey})
      : super._();

  factory _$IdentityImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdentityImplFromJson(json);

  @override
  final String deviceId;
  @override
  final String serviceKey;

  @override
  String toString() {
    return 'Identity(deviceId: $deviceId, serviceKey: $serviceKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdentityImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.serviceKey, serviceKey) ||
                other.serviceKey == serviceKey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, deviceId, serviceKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IdentityImplCopyWith<_$IdentityImpl> get copyWith =>
      __$$IdentityImplCopyWithImpl<_$IdentityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IdentityImplToJson(
      this,
    );
  }
}

abstract class _Identity extends Identity {
  const factory _Identity(
      {required final String deviceId,
      required final String serviceKey}) = _$IdentityImpl;
  const _Identity._() : super._();

  factory _Identity.fromJson(Map<String, dynamic> json) =
      _$IdentityImpl.fromJson;

  @override
  String get deviceId;
  @override
  String get serviceKey;
  @override
  @JsonKey(ignore: true)
  _$$IdentityImplCopyWith<_$IdentityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
