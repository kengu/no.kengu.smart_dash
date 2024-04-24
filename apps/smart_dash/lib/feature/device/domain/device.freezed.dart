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
  List<Capability> get capabilities => throw _privateConstructorUsedError;

  /// Get the timestamp for when device's was last updated
  DateTime get lastUpdated => throw _privateConstructorUsedError;

  /// Get device's measured rain since last measurement (default null)
  double? get rain => throw _privateConstructorUsedError;

  /// Get device's measured rain rate. (default null)
  double? get rainRate => throw _privateConstructorUsedError;

  /// Get device's measured rain since last reset. Reset method is device dependent. (default null)
  double? get rainTotal => throw _privateConstructorUsedError;

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

  /// Get device's measured snow depth (default null)
  int? get snowDepth => throw _privateConstructorUsedError;

  /// Get device's measured snow depth (default null)
  int? get snowWeight => throw _privateConstructorUsedError;

  /// Get device's rain forecast (in mm) next 24h (default null)
  double? get rain1h => throw _privateConstructorUsedError;

  /// Get device's rain forecast (in mm) next 3h (default null)
  double? get rain3h => throw _privateConstructorUsedError;

  /// Get device's rain forecast (in mm) next 6h (default null)
  double? get rain6h => throw _privateConstructorUsedError;

  /// Get device's rain forecast (in mm) next 12h (default null)
  double? get rain12h => throw _privateConstructorUsedError;

  /// Get device's rain forecast (in mm) next 24h (default null)
  double? get rain1d => throw _privateConstructorUsedError;

  /// Get device's snow forecast (in cm) next 24h (default null)
  double? get snow1h => throw _privateConstructorUsedError;

  /// Get device's snow forecast (in cm) next 3h (default null)
  double? get snow3h => throw _privateConstructorUsedError;

  /// Get device's snow forecast (in cm) next 6h (default null)
  double? get snow6h => throw _privateConstructorUsedError;

  /// Get device's snow forecast (in cm) next 12h (default null)
  double? get snow12h => throw _privateConstructorUsedError;

  /// Get device's snow forecast (in cm) next 24h (default null)
  double? get snow1d => throw _privateConstructorUsedError;

  /// Get device's temperature forecast (in mm) next 24h (default null)
  double? get temperature1h => throw _privateConstructorUsedError;

  /// Get device's temperature forecast (in mm) next 3h (default null)
  double? get temperature3h => throw _privateConstructorUsedError;

  /// Get device's temperature forecast (in mm) next 6h (default null)
  double? get temperature6h => throw _privateConstructorUsedError;

  /// Get device's temperature forecast (in mm) next 12h (default null)
  double? get temperature12h => throw _privateConstructorUsedError;

  /// Get device's temperature forecast (in mm) next 24h (default null)
  double? get temperature1d => throw _privateConstructorUsedError;

  /// Serializes this Device to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Device
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      List<Capability> capabilities,
      DateTime lastUpdated,
      double? rain,
      double? rainRate,
      double? rainTotal,
      int? ultraviolet,
      int? luminance,
      double? humidity,
      double? windAngle,
      double? temperature,
      double? windSpeed,
      double? gustSpeed,
      ElectricState? electric,
      SwitchState? onOff,
      Thermostat? thermostat,
      int? snowDepth,
      int? snowWeight,
      double? rain1h,
      double? rain3h,
      double? rain6h,
      double? rain12h,
      double? rain1d,
      double? snow1h,
      double? snow3h,
      double? snow6h,
      double? snow12h,
      double? snow1d,
      double? temperature1h,
      double? temperature3h,
      double? temperature6h,
      double? temperature12h,
      double? temperature1d});

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

  /// Create a copy of Device
  /// with the given fields replaced by the non-null parameter values.
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
    Object? rainRate = freezed,
    Object? rainTotal = freezed,
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
    Object? snowDepth = freezed,
    Object? snowWeight = freezed,
    Object? rain1h = freezed,
    Object? rain3h = freezed,
    Object? rain6h = freezed,
    Object? rain12h = freezed,
    Object? rain1d = freezed,
    Object? snow1h = freezed,
    Object? snow3h = freezed,
    Object? snow6h = freezed,
    Object? snow12h = freezed,
    Object? snow1d = freezed,
    Object? temperature1h = freezed,
    Object? temperature3h = freezed,
    Object? temperature6h = freezed,
    Object? temperature12h = freezed,
    Object? temperature1d = freezed,
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
              as List<Capability>,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      rain: freezed == rain
          ? _value.rain
          : rain // ignore: cast_nullable_to_non_nullable
              as double?,
      rainRate: freezed == rainRate
          ? _value.rainRate
          : rainRate // ignore: cast_nullable_to_non_nullable
              as double?,
      rainTotal: freezed == rainTotal
          ? _value.rainTotal
          : rainTotal // ignore: cast_nullable_to_non_nullable
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
      snowDepth: freezed == snowDepth
          ? _value.snowDepth
          : snowDepth // ignore: cast_nullable_to_non_nullable
              as int?,
      snowWeight: freezed == snowWeight
          ? _value.snowWeight
          : snowWeight // ignore: cast_nullable_to_non_nullable
              as int?,
      rain1h: freezed == rain1h
          ? _value.rain1h
          : rain1h // ignore: cast_nullable_to_non_nullable
              as double?,
      rain3h: freezed == rain3h
          ? _value.rain3h
          : rain3h // ignore: cast_nullable_to_non_nullable
              as double?,
      rain6h: freezed == rain6h
          ? _value.rain6h
          : rain6h // ignore: cast_nullable_to_non_nullable
              as double?,
      rain12h: freezed == rain12h
          ? _value.rain12h
          : rain12h // ignore: cast_nullable_to_non_nullable
              as double?,
      rain1d: freezed == rain1d
          ? _value.rain1d
          : rain1d // ignore: cast_nullable_to_non_nullable
              as double?,
      snow1h: freezed == snow1h
          ? _value.snow1h
          : snow1h // ignore: cast_nullable_to_non_nullable
              as double?,
      snow3h: freezed == snow3h
          ? _value.snow3h
          : snow3h // ignore: cast_nullable_to_non_nullable
              as double?,
      snow6h: freezed == snow6h
          ? _value.snow6h
          : snow6h // ignore: cast_nullable_to_non_nullable
              as double?,
      snow12h: freezed == snow12h
          ? _value.snow12h
          : snow12h // ignore: cast_nullable_to_non_nullable
              as double?,
      snow1d: freezed == snow1d
          ? _value.snow1d
          : snow1d // ignore: cast_nullable_to_non_nullable
              as double?,
      temperature1h: freezed == temperature1h
          ? _value.temperature1h
          : temperature1h // ignore: cast_nullable_to_non_nullable
              as double?,
      temperature3h: freezed == temperature3h
          ? _value.temperature3h
          : temperature3h // ignore: cast_nullable_to_non_nullable
              as double?,
      temperature6h: freezed == temperature6h
          ? _value.temperature6h
          : temperature6h // ignore: cast_nullable_to_non_nullable
              as double?,
      temperature12h: freezed == temperature12h
          ? _value.temperature12h
          : temperature12h // ignore: cast_nullable_to_non_nullable
              as double?,
      temperature1d: freezed == temperature1d
          ? _value.temperature1d
          : temperature1d // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  /// Create a copy of Device
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of Device
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of Device
  /// with the given fields replaced by the non-null parameter values.
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
      List<Capability> capabilities,
      DateTime lastUpdated,
      double? rain,
      double? rainRate,
      double? rainTotal,
      int? ultraviolet,
      int? luminance,
      double? humidity,
      double? windAngle,
      double? temperature,
      double? windSpeed,
      double? gustSpeed,
      ElectricState? electric,
      SwitchState? onOff,
      Thermostat? thermostat,
      int? snowDepth,
      int? snowWeight,
      double? rain1h,
      double? rain3h,
      double? rain6h,
      double? rain12h,
      double? rain1d,
      double? snow1h,
      double? snow3h,
      double? snow6h,
      double? snow12h,
      double? snow1d,
      double? temperature1h,
      double? temperature3h,
      double? temperature6h,
      double? temperature12h,
      double? temperature1d});

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

  /// Create a copy of Device
  /// with the given fields replaced by the non-null parameter values.
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
    Object? rainRate = freezed,
    Object? rainTotal = freezed,
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
    Object? snowDepth = freezed,
    Object? snowWeight = freezed,
    Object? rain1h = freezed,
    Object? rain3h = freezed,
    Object? rain6h = freezed,
    Object? rain12h = freezed,
    Object? rain1d = freezed,
    Object? snow1h = freezed,
    Object? snow3h = freezed,
    Object? snow6h = freezed,
    Object? snow12h = freezed,
    Object? snow1d = freezed,
    Object? temperature1h = freezed,
    Object? temperature3h = freezed,
    Object? temperature6h = freezed,
    Object? temperature12h = freezed,
    Object? temperature1d = freezed,
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
              as List<Capability>,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      rain: freezed == rain
          ? _value.rain
          : rain // ignore: cast_nullable_to_non_nullable
              as double?,
      rainRate: freezed == rainRate
          ? _value.rainRate
          : rainRate // ignore: cast_nullable_to_non_nullable
              as double?,
      rainTotal: freezed == rainTotal
          ? _value.rainTotal
          : rainTotal // ignore: cast_nullable_to_non_nullable
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
      snowDepth: freezed == snowDepth
          ? _value.snowDepth
          : snowDepth // ignore: cast_nullable_to_non_nullable
              as int?,
      snowWeight: freezed == snowWeight
          ? _value.snowWeight
          : snowWeight // ignore: cast_nullable_to_non_nullable
              as int?,
      rain1h: freezed == rain1h
          ? _value.rain1h
          : rain1h // ignore: cast_nullable_to_non_nullable
              as double?,
      rain3h: freezed == rain3h
          ? _value.rain3h
          : rain3h // ignore: cast_nullable_to_non_nullable
              as double?,
      rain6h: freezed == rain6h
          ? _value.rain6h
          : rain6h // ignore: cast_nullable_to_non_nullable
              as double?,
      rain12h: freezed == rain12h
          ? _value.rain12h
          : rain12h // ignore: cast_nullable_to_non_nullable
              as double?,
      rain1d: freezed == rain1d
          ? _value.rain1d
          : rain1d // ignore: cast_nullable_to_non_nullable
              as double?,
      snow1h: freezed == snow1h
          ? _value.snow1h
          : snow1h // ignore: cast_nullable_to_non_nullable
              as double?,
      snow3h: freezed == snow3h
          ? _value.snow3h
          : snow3h // ignore: cast_nullable_to_non_nullable
              as double?,
      snow6h: freezed == snow6h
          ? _value.snow6h
          : snow6h // ignore: cast_nullable_to_non_nullable
              as double?,
      snow12h: freezed == snow12h
          ? _value.snow12h
          : snow12h // ignore: cast_nullable_to_non_nullable
              as double?,
      snow1d: freezed == snow1d
          ? _value.snow1d
          : snow1d // ignore: cast_nullable_to_non_nullable
              as double?,
      temperature1h: freezed == temperature1h
          ? _value.temperature1h
          : temperature1h // ignore: cast_nullable_to_non_nullable
              as double?,
      temperature3h: freezed == temperature3h
          ? _value.temperature3h
          : temperature3h // ignore: cast_nullable_to_non_nullable
              as double?,
      temperature6h: freezed == temperature6h
          ? _value.temperature6h
          : temperature6h // ignore: cast_nullable_to_non_nullable
              as double?,
      temperature12h: freezed == temperature12h
          ? _value.temperature12h
          : temperature12h // ignore: cast_nullable_to_non_nullable
              as double?,
      temperature1d: freezed == temperature1d
          ? _value.temperature1d
          : temperature1d // ignore: cast_nullable_to_non_nullable
              as double?,
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
      required final List<Capability> capabilities,
      required this.lastUpdated,
      this.rain,
      this.rainRate,
      this.rainTotal,
      this.ultraviolet,
      this.luminance,
      this.humidity,
      this.windAngle,
      this.temperature,
      this.windSpeed,
      this.gustSpeed,
      this.electric,
      this.onOff,
      this.thermostat,
      this.snowDepth,
      this.snowWeight,
      this.rain1h,
      this.rain3h,
      this.rain6h,
      this.rain12h,
      this.rain1d,
      this.snow1h,
      this.snow3h,
      this.snow6h,
      this.snow12h,
      this.snow1d,
      this.temperature1h,
      this.temperature3h,
      this.temperature6h,
      this.temperature12h,
      this.temperature1d})
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
  final List<Capability> _capabilities;

  /// The device's capabilities array
  @override
  List<Capability> get capabilities {
    if (_capabilities is EqualUnmodifiableListView) return _capabilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_capabilities);
  }

  /// Get the timestamp for when device's was last updated
  @override
  final DateTime lastUpdated;

  /// Get device's measured rain since last measurement (default null)
  @override
  final double? rain;

  /// Get device's measured rain rate. (default null)
  @override
  final double? rainRate;

  /// Get device's measured rain since last reset. Reset method is device dependent. (default null)
  @override
  final double? rainTotal;

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

  /// Get device's measured snow depth (default null)
  @override
  final int? snowDepth;

  /// Get device's measured snow depth (default null)
  @override
  final int? snowWeight;

  /// Get device's rain forecast (in mm) next 24h (default null)
  @override
  final double? rain1h;

  /// Get device's rain forecast (in mm) next 3h (default null)
  @override
  final double? rain3h;

  /// Get device's rain forecast (in mm) next 6h (default null)
  @override
  final double? rain6h;

  /// Get device's rain forecast (in mm) next 12h (default null)
  @override
  final double? rain12h;

  /// Get device's rain forecast (in mm) next 24h (default null)
  @override
  final double? rain1d;

  /// Get device's snow forecast (in cm) next 24h (default null)
  @override
  final double? snow1h;

  /// Get device's snow forecast (in cm) next 3h (default null)
  @override
  final double? snow3h;

  /// Get device's snow forecast (in cm) next 6h (default null)
  @override
  final double? snow6h;

  /// Get device's snow forecast (in cm) next 12h (default null)
  @override
  final double? snow12h;

  /// Get device's snow forecast (in cm) next 24h (default null)
  @override
  final double? snow1d;

  /// Get device's temperature forecast (in mm) next 24h (default null)
  @override
  final double? temperature1h;

  /// Get device's temperature forecast (in mm) next 3h (default null)
  @override
  final double? temperature3h;

  /// Get device's temperature forecast (in mm) next 6h (default null)
  @override
  final double? temperature6h;

  /// Get device's temperature forecast (in mm) next 12h (default null)
  @override
  final double? temperature12h;

  /// Get device's temperature forecast (in mm) next 24h (default null)
  @override
  final double? temperature1d;

  @override
  String toString() {
    return 'Device(id: $id, name: $name, service: $service, type: $type, data: $data, capabilities: $capabilities, lastUpdated: $lastUpdated, rain: $rain, rainRate: $rainRate, rainTotal: $rainTotal, ultraviolet: $ultraviolet, luminance: $luminance, humidity: $humidity, windAngle: $windAngle, temperature: $temperature, windSpeed: $windSpeed, gustSpeed: $gustSpeed, electric: $electric, onOff: $onOff, thermostat: $thermostat, snowDepth: $snowDepth, snowWeight: $snowWeight, rain1h: $rain1h, rain3h: $rain3h, rain6h: $rain6h, rain12h: $rain12h, rain1d: $rain1d, snow1h: $snow1h, snow3h: $snow3h, snow6h: $snow6h, snow12h: $snow12h, snow1d: $snow1d, temperature1h: $temperature1h, temperature3h: $temperature3h, temperature6h: $temperature6h, temperature12h: $temperature12h, temperature1d: $temperature1d)';
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
            (identical(other.rainRate, rainRate) ||
                other.rainRate == rainRate) &&
            (identical(other.rainTotal, rainTotal) ||
                other.rainTotal == rainTotal) &&
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
                other.thermostat == thermostat) &&
            (identical(other.snowDepth, snowDepth) ||
                other.snowDepth == snowDepth) &&
            (identical(other.snowWeight, snowWeight) ||
                other.snowWeight == snowWeight) &&
            (identical(other.rain1h, rain1h) || other.rain1h == rain1h) &&
            (identical(other.rain3h, rain3h) || other.rain3h == rain3h) &&
            (identical(other.rain6h, rain6h) || other.rain6h == rain6h) &&
            (identical(other.rain12h, rain12h) || other.rain12h == rain12h) &&
            (identical(other.rain1d, rain1d) || other.rain1d == rain1d) &&
            (identical(other.snow1h, snow1h) || other.snow1h == snow1h) &&
            (identical(other.snow3h, snow3h) || other.snow3h == snow3h) &&
            (identical(other.snow6h, snow6h) || other.snow6h == snow6h) &&
            (identical(other.snow12h, snow12h) || other.snow12h == snow12h) &&
            (identical(other.snow1d, snow1d) || other.snow1d == snow1d) &&
            (identical(other.temperature1h, temperature1h) ||
                other.temperature1h == temperature1h) &&
            (identical(other.temperature3h, temperature3h) ||
                other.temperature3h == temperature3h) &&
            (identical(other.temperature6h, temperature6h) ||
                other.temperature6h == temperature6h) &&
            (identical(other.temperature12h, temperature12h) ||
                other.temperature12h == temperature12h) &&
            (identical(other.temperature1d, temperature1d) ||
                other.temperature1d == temperature1d));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        service,
        type,
        const DeepCollectionEquality().hash(_data),
        const DeepCollectionEquality().hash(_capabilities),
        lastUpdated,
        rain,
        rainRate,
        rainTotal,
        ultraviolet,
        luminance,
        humidity,
        windAngle,
        temperature,
        windSpeed,
        gustSpeed,
        electric,
        onOff,
        thermostat,
        snowDepth,
        snowWeight,
        rain1h,
        rain3h,
        rain6h,
        rain12h,
        rain1d,
        snow1h,
        snow3h,
        snow6h,
        snow12h,
        snow1d,
        temperature1h,
        temperature3h,
        temperature6h,
        temperature12h,
        temperature1d
      ]);

  /// Create a copy of Device
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      required final List<Capability> capabilities,
      required final DateTime lastUpdated,
      final double? rain,
      final double? rainRate,
      final double? rainTotal,
      final int? ultraviolet,
      final int? luminance,
      final double? humidity,
      final double? windAngle,
      final double? temperature,
      final double? windSpeed,
      final double? gustSpeed,
      final ElectricState? electric,
      final SwitchState? onOff,
      final Thermostat? thermostat,
      final int? snowDepth,
      final int? snowWeight,
      final double? rain1h,
      final double? rain3h,
      final double? rain6h,
      final double? rain12h,
      final double? rain1d,
      final double? snow1h,
      final double? snow3h,
      final double? snow6h,
      final double? snow12h,
      final double? snow1d,
      final double? temperature1h,
      final double? temperature3h,
      final double? temperature6h,
      final double? temperature12h,
      final double? temperature1d}) = _$DeviceImpl;
  const _Device._() : super._();

  factory _Device.fromJson(Map<String, dynamic> json) = _$DeviceImpl.fromJson;

  /// Get the device's id
  @override
  String get id;

  /// Get the device's name
  @override
  String get name;

  /// Get the device's service
  @override
  String get service;

  /// Get the device's type
  @override
  DeviceType get type;

  /// Get the device's data object (is unmodifiable)
  @override
  Map<String, Object?> get data;

  /// The device's capabilities array
  @override
  List<Capability> get capabilities;

  /// Get the timestamp for when device's was last updated
  @override
  DateTime get lastUpdated;

  /// Get device's measured rain since last measurement (default null)
  @override
  double? get rain;

  /// Get device's measured rain rate. (default null)
  @override
  double? get rainRate;

  /// Get device's measured rain since last reset. Reset method is device dependent. (default null)
  @override
  double? get rainTotal;

  /// Get device's measured ultraviolet radiation (default null)
  @override
  int? get ultraviolet;

  /// Get device's measured luminance (default null)
  @override
  int? get luminance;

  /// Get device's measured temperature (default null)
  @override
  double? get humidity;

  /// Get device's measured temperature (default null)
  @override
  double? get windAngle;

  /// Get device's measured temperature (default null)
  @override
  double? get temperature;

  /// Get device's measured wind speed (default null)
  @override
  double? get windSpeed;

  /// Get device's measured gust speed (default null)
  @override
  double? get gustSpeed;

  /// Get the device's electric state information (default null)
  @override
  ElectricState? get electric;

  /// Get the device's switch state information (default null)
  @override
  SwitchState? get onOff;

  /// Get the device's thermostat information (default null)
  @override
  Thermostat? get thermostat;

  /// Get device's measured snow depth (default null)
  @override
  int? get snowDepth;

  /// Get device's measured snow depth (default null)
  @override
  int? get snowWeight;

  /// Get device's rain forecast (in mm) next 24h (default null)
  @override
  double? get rain1h;

  /// Get device's rain forecast (in mm) next 3h (default null)
  @override
  double? get rain3h;

  /// Get device's rain forecast (in mm) next 6h (default null)
  @override
  double? get rain6h;

  /// Get device's rain forecast (in mm) next 12h (default null)
  @override
  double? get rain12h;

  /// Get device's rain forecast (in mm) next 24h (default null)
  @override
  double? get rain1d;

  /// Get device's snow forecast (in cm) next 24h (default null)
  @override
  double? get snow1h;

  /// Get device's snow forecast (in cm) next 3h (default null)
  @override
  double? get snow3h;

  /// Get device's snow forecast (in cm) next 6h (default null)
  @override
  double? get snow6h;

  /// Get device's snow forecast (in cm) next 12h (default null)
  @override
  double? get snow12h;

  /// Get device's snow forecast (in cm) next 24h (default null)
  @override
  double? get snow1d;

  /// Get device's temperature forecast (in mm) next 24h (default null)
  @override
  double? get temperature1h;

  /// Get device's temperature forecast (in mm) next 3h (default null)
  @override
  double? get temperature3h;

  /// Get device's temperature forecast (in mm) next 6h (default null)
  @override
  double? get temperature6h;

  /// Get device's temperature forecast (in mm) next 12h (default null)
  @override
  double? get temperature12h;

  /// Get device's temperature forecast (in mm) next 24h (default null)
  @override
  double? get temperature1d;

  /// Create a copy of Device
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Serializes this Identity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Identity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of Identity
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of Identity
  /// with the given fields replaced by the non-null parameter values.
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, deviceId, serviceKey);

  /// Create a copy of Identity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of Identity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IdentityImplCopyWith<_$IdentityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
