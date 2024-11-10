// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rtl_433_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Rtl433Device _$Rtl433DeviceFromJson(Map<String, dynamic> json) {
  return _Rtl433Device.fromJson(json);
}

/// @nodoc
mixin _$Rtl433Device {
  @JsonKey(name: 'id')
  Object get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'time')
  String get time => throw _privateConstructorUsedError;
  @JsonKey(name: 'model')
  String get model => throw _privateConstructorUsedError;
  @JsonKey(name: 'mic')
  String? get mic => throw _privateConstructorUsedError;
  @JsonKey(name: 'channel')
  String? get channel => throw _privateConstructorUsedError;
  @JsonKey(name: 'subtype')
  String? get subtype => throw _privateConstructorUsedError;
  @JsonKey(name: 'battery_ok')
  double? get batteryOk => throw _privateConstructorUsedError;
  @JsonKey(name: 'battery_V')
  double? get batteryVolts => throw _privateConstructorUsedError;
  @JsonKey(name: 'temperature_C')
  double? get temperatureCelsius => throw _privateConstructorUsedError;
  @JsonKey(name: 'temperature_F')
  double? get temperatureFahrenheit => throw _privateConstructorUsedError;
  @JsonKey(name: 'setpoint_C')
  double? get targetTemperatureCelsius => throw _privateConstructorUsedError;
  @JsonKey(name: 'setpoint_F')
  double? get targetTemperatureFahrenheit => throw _privateConstructorUsedError;
  @JsonKey(name: 'humidity')
  double? get humidity => throw _privateConstructorUsedError;
  @JsonKey(name: 'moisture')
  double? get moisture => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_dir_deg')
  double? get windAngleInDegrees => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_avg_m_s')
  double? get windStrengthInMeterPerSeconds =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_avg_km_h')
  double? get windStrengthInKilometerPerHour =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_avg_mi_h')
  double? get windStrengthInMilesPerHour => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_max_m_s')
  double? get gustStrengthInMeterPerSeconds =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_max_km_h')
  double? get gustStrengthInKilometerPerHour =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_max_mi_h')
  double? get gustStrengthInMilesPerHour => throw _privateConstructorUsedError;
  @JsonKey(name: 'light_lux')
  int? get lightInLux => throw _privateConstructorUsedError;
  @JsonKey(name: 'uv')
  int? get uvRadiation => throw _privateConstructorUsedError;

  /// Rainfall from rain sensor (in mm) since last reset. Reset method is device dependent.
  @JsonKey(name: 'rain_mm')
  double? get rainInMillimeters => throw _privateConstructorUsedError;

  /// Rainfall from rain sensor (in inches) since last reset. Reset method is device dependent.
  @JsonKey(name: 'rain_in')
  double? get rainInInches => throw _privateConstructorUsedError;

  /// Rainfall rate from rain sensor (in mm) per hour.
  @JsonKey(name: 'rain_rate_mm_h')
  double? get rainRateMillimeterPerHour => throw _privateConstructorUsedError;

  /// Rainfall rate from rain sensor (in inches) per hour.
  @JsonKey(name: 'rain_rate_in_h')
  double? get rainRateInchesPerHour => throw _privateConstructorUsedError;

  /// Air pressure from barometer or Tire Pressure Monitor in hPa (psi)
  @JsonKey(name: 'pressure_hPa')
  double? get pressureInhPa => throw _privateConstructorUsedError;

  /// Serializes this Rtl433Device to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Rtl433Device
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $Rtl433DeviceCopyWith<Rtl433Device> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Rtl433DeviceCopyWith<$Res> {
  factory $Rtl433DeviceCopyWith(
          Rtl433Device value, $Res Function(Rtl433Device) then) =
      _$Rtl433DeviceCopyWithImpl<$Res, Rtl433Device>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') Object id,
      @JsonKey(name: 'time') String time,
      @JsonKey(name: 'model') String model,
      @JsonKey(name: 'mic') String? mic,
      @JsonKey(name: 'channel') String? channel,
      @JsonKey(name: 'subtype') String? subtype,
      @JsonKey(name: 'battery_ok') double? batteryOk,
      @JsonKey(name: 'battery_V') double? batteryVolts,
      @JsonKey(name: 'temperature_C') double? temperatureCelsius,
      @JsonKey(name: 'temperature_F') double? temperatureFahrenheit,
      @JsonKey(name: 'setpoint_C') double? targetTemperatureCelsius,
      @JsonKey(name: 'setpoint_F') double? targetTemperatureFahrenheit,
      @JsonKey(name: 'humidity') double? humidity,
      @JsonKey(name: 'moisture') double? moisture,
      @JsonKey(name: 'wind_dir_deg') double? windAngleInDegrees,
      @JsonKey(name: 'wind_avg_m_s') double? windStrengthInMeterPerSeconds,
      @JsonKey(name: 'wind_avg_km_h') double? windStrengthInKilometerPerHour,
      @JsonKey(name: 'wind_avg_mi_h') double? windStrengthInMilesPerHour,
      @JsonKey(name: 'wind_max_m_s') double? gustStrengthInMeterPerSeconds,
      @JsonKey(name: 'wind_max_km_h') double? gustStrengthInKilometerPerHour,
      @JsonKey(name: 'wind_max_mi_h') double? gustStrengthInMilesPerHour,
      @JsonKey(name: 'light_lux') int? lightInLux,
      @JsonKey(name: 'uv') int? uvRadiation,
      @JsonKey(name: 'rain_mm') double? rainInMillimeters,
      @JsonKey(name: 'rain_in') double? rainInInches,
      @JsonKey(name: 'rain_rate_mm_h') double? rainRateMillimeterPerHour,
      @JsonKey(name: 'rain_rate_in_h') double? rainRateInchesPerHour,
      @JsonKey(name: 'pressure_hPa') double? pressureInhPa});
}

/// @nodoc
class _$Rtl433DeviceCopyWithImpl<$Res, $Val extends Rtl433Device>
    implements $Rtl433DeviceCopyWith<$Res> {
  _$Rtl433DeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Rtl433Device
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? time = null,
    Object? model = null,
    Object? mic = freezed,
    Object? channel = freezed,
    Object? subtype = freezed,
    Object? batteryOk = freezed,
    Object? batteryVolts = freezed,
    Object? temperatureCelsius = freezed,
    Object? temperatureFahrenheit = freezed,
    Object? targetTemperatureCelsius = freezed,
    Object? targetTemperatureFahrenheit = freezed,
    Object? humidity = freezed,
    Object? moisture = freezed,
    Object? windAngleInDegrees = freezed,
    Object? windStrengthInMeterPerSeconds = freezed,
    Object? windStrengthInKilometerPerHour = freezed,
    Object? windStrengthInMilesPerHour = freezed,
    Object? gustStrengthInMeterPerSeconds = freezed,
    Object? gustStrengthInKilometerPerHour = freezed,
    Object? gustStrengthInMilesPerHour = freezed,
    Object? lightInLux = freezed,
    Object? uvRadiation = freezed,
    Object? rainInMillimeters = freezed,
    Object? rainInInches = freezed,
    Object? rainRateMillimeterPerHour = freezed,
    Object? rainRateInchesPerHour = freezed,
    Object? pressureInhPa = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id ? _value.id : id,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      mic: freezed == mic
          ? _value.mic
          : mic // ignore: cast_nullable_to_non_nullable
              as String?,
      channel: freezed == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String?,
      subtype: freezed == subtype
          ? _value.subtype
          : subtype // ignore: cast_nullable_to_non_nullable
              as String?,
      batteryOk: freezed == batteryOk
          ? _value.batteryOk
          : batteryOk // ignore: cast_nullable_to_non_nullable
              as double?,
      batteryVolts: freezed == batteryVolts
          ? _value.batteryVolts
          : batteryVolts // ignore: cast_nullable_to_non_nullable
              as double?,
      temperatureCelsius: freezed == temperatureCelsius
          ? _value.temperatureCelsius
          : temperatureCelsius // ignore: cast_nullable_to_non_nullable
              as double?,
      temperatureFahrenheit: freezed == temperatureFahrenheit
          ? _value.temperatureFahrenheit
          : temperatureFahrenheit // ignore: cast_nullable_to_non_nullable
              as double?,
      targetTemperatureCelsius: freezed == targetTemperatureCelsius
          ? _value.targetTemperatureCelsius
          : targetTemperatureCelsius // ignore: cast_nullable_to_non_nullable
              as double?,
      targetTemperatureFahrenheit: freezed == targetTemperatureFahrenheit
          ? _value.targetTemperatureFahrenheit
          : targetTemperatureFahrenheit // ignore: cast_nullable_to_non_nullable
              as double?,
      humidity: freezed == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double?,
      moisture: freezed == moisture
          ? _value.moisture
          : moisture // ignore: cast_nullable_to_non_nullable
              as double?,
      windAngleInDegrees: freezed == windAngleInDegrees
          ? _value.windAngleInDegrees
          : windAngleInDegrees // ignore: cast_nullable_to_non_nullable
              as double?,
      windStrengthInMeterPerSeconds: freezed == windStrengthInMeterPerSeconds
          ? _value.windStrengthInMeterPerSeconds
          : windStrengthInMeterPerSeconds // ignore: cast_nullable_to_non_nullable
              as double?,
      windStrengthInKilometerPerHour: freezed == windStrengthInKilometerPerHour
          ? _value.windStrengthInKilometerPerHour
          : windStrengthInKilometerPerHour // ignore: cast_nullable_to_non_nullable
              as double?,
      windStrengthInMilesPerHour: freezed == windStrengthInMilesPerHour
          ? _value.windStrengthInMilesPerHour
          : windStrengthInMilesPerHour // ignore: cast_nullable_to_non_nullable
              as double?,
      gustStrengthInMeterPerSeconds: freezed == gustStrengthInMeterPerSeconds
          ? _value.gustStrengthInMeterPerSeconds
          : gustStrengthInMeterPerSeconds // ignore: cast_nullable_to_non_nullable
              as double?,
      gustStrengthInKilometerPerHour: freezed == gustStrengthInKilometerPerHour
          ? _value.gustStrengthInKilometerPerHour
          : gustStrengthInKilometerPerHour // ignore: cast_nullable_to_non_nullable
              as double?,
      gustStrengthInMilesPerHour: freezed == gustStrengthInMilesPerHour
          ? _value.gustStrengthInMilesPerHour
          : gustStrengthInMilesPerHour // ignore: cast_nullable_to_non_nullable
              as double?,
      lightInLux: freezed == lightInLux
          ? _value.lightInLux
          : lightInLux // ignore: cast_nullable_to_non_nullable
              as int?,
      uvRadiation: freezed == uvRadiation
          ? _value.uvRadiation
          : uvRadiation // ignore: cast_nullable_to_non_nullable
              as int?,
      rainInMillimeters: freezed == rainInMillimeters
          ? _value.rainInMillimeters
          : rainInMillimeters // ignore: cast_nullable_to_non_nullable
              as double?,
      rainInInches: freezed == rainInInches
          ? _value.rainInInches
          : rainInInches // ignore: cast_nullable_to_non_nullable
              as double?,
      rainRateMillimeterPerHour: freezed == rainRateMillimeterPerHour
          ? _value.rainRateMillimeterPerHour
          : rainRateMillimeterPerHour // ignore: cast_nullable_to_non_nullable
              as double?,
      rainRateInchesPerHour: freezed == rainRateInchesPerHour
          ? _value.rainRateInchesPerHour
          : rainRateInchesPerHour // ignore: cast_nullable_to_non_nullable
              as double?,
      pressureInhPa: freezed == pressureInhPa
          ? _value.pressureInhPa
          : pressureInhPa // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$Rtl433DeviceImplCopyWith<$Res>
    implements $Rtl433DeviceCopyWith<$Res> {
  factory _$$Rtl433DeviceImplCopyWith(
          _$Rtl433DeviceImpl value, $Res Function(_$Rtl433DeviceImpl) then) =
      __$$Rtl433DeviceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') Object id,
      @JsonKey(name: 'time') String time,
      @JsonKey(name: 'model') String model,
      @JsonKey(name: 'mic') String? mic,
      @JsonKey(name: 'channel') String? channel,
      @JsonKey(name: 'subtype') String? subtype,
      @JsonKey(name: 'battery_ok') double? batteryOk,
      @JsonKey(name: 'battery_V') double? batteryVolts,
      @JsonKey(name: 'temperature_C') double? temperatureCelsius,
      @JsonKey(name: 'temperature_F') double? temperatureFahrenheit,
      @JsonKey(name: 'setpoint_C') double? targetTemperatureCelsius,
      @JsonKey(name: 'setpoint_F') double? targetTemperatureFahrenheit,
      @JsonKey(name: 'humidity') double? humidity,
      @JsonKey(name: 'moisture') double? moisture,
      @JsonKey(name: 'wind_dir_deg') double? windAngleInDegrees,
      @JsonKey(name: 'wind_avg_m_s') double? windStrengthInMeterPerSeconds,
      @JsonKey(name: 'wind_avg_km_h') double? windStrengthInKilometerPerHour,
      @JsonKey(name: 'wind_avg_mi_h') double? windStrengthInMilesPerHour,
      @JsonKey(name: 'wind_max_m_s') double? gustStrengthInMeterPerSeconds,
      @JsonKey(name: 'wind_max_km_h') double? gustStrengthInKilometerPerHour,
      @JsonKey(name: 'wind_max_mi_h') double? gustStrengthInMilesPerHour,
      @JsonKey(name: 'light_lux') int? lightInLux,
      @JsonKey(name: 'uv') int? uvRadiation,
      @JsonKey(name: 'rain_mm') double? rainInMillimeters,
      @JsonKey(name: 'rain_in') double? rainInInches,
      @JsonKey(name: 'rain_rate_mm_h') double? rainRateMillimeterPerHour,
      @JsonKey(name: 'rain_rate_in_h') double? rainRateInchesPerHour,
      @JsonKey(name: 'pressure_hPa') double? pressureInhPa});
}

/// @nodoc
class __$$Rtl433DeviceImplCopyWithImpl<$Res>
    extends _$Rtl433DeviceCopyWithImpl<$Res, _$Rtl433DeviceImpl>
    implements _$$Rtl433DeviceImplCopyWith<$Res> {
  __$$Rtl433DeviceImplCopyWithImpl(
      _$Rtl433DeviceImpl _value, $Res Function(_$Rtl433DeviceImpl) _then)
      : super(_value, _then);

  /// Create a copy of Rtl433Device
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? time = null,
    Object? model = null,
    Object? mic = freezed,
    Object? channel = freezed,
    Object? subtype = freezed,
    Object? batteryOk = freezed,
    Object? batteryVolts = freezed,
    Object? temperatureCelsius = freezed,
    Object? temperatureFahrenheit = freezed,
    Object? targetTemperatureCelsius = freezed,
    Object? targetTemperatureFahrenheit = freezed,
    Object? humidity = freezed,
    Object? moisture = freezed,
    Object? windAngleInDegrees = freezed,
    Object? windStrengthInMeterPerSeconds = freezed,
    Object? windStrengthInKilometerPerHour = freezed,
    Object? windStrengthInMilesPerHour = freezed,
    Object? gustStrengthInMeterPerSeconds = freezed,
    Object? gustStrengthInKilometerPerHour = freezed,
    Object? gustStrengthInMilesPerHour = freezed,
    Object? lightInLux = freezed,
    Object? uvRadiation = freezed,
    Object? rainInMillimeters = freezed,
    Object? rainInInches = freezed,
    Object? rainRateMillimeterPerHour = freezed,
    Object? rainRateInchesPerHour = freezed,
    Object? pressureInhPa = freezed,
  }) {
    return _then(_$Rtl433DeviceImpl(
      id: null == id ? _value.id : id,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      mic: freezed == mic
          ? _value.mic
          : mic // ignore: cast_nullable_to_non_nullable
              as String?,
      channel: freezed == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String?,
      subtype: freezed == subtype
          ? _value.subtype
          : subtype // ignore: cast_nullable_to_non_nullable
              as String?,
      batteryOk: freezed == batteryOk
          ? _value.batteryOk
          : batteryOk // ignore: cast_nullable_to_non_nullable
              as double?,
      batteryVolts: freezed == batteryVolts
          ? _value.batteryVolts
          : batteryVolts // ignore: cast_nullable_to_non_nullable
              as double?,
      temperatureCelsius: freezed == temperatureCelsius
          ? _value.temperatureCelsius
          : temperatureCelsius // ignore: cast_nullable_to_non_nullable
              as double?,
      temperatureFahrenheit: freezed == temperatureFahrenheit
          ? _value.temperatureFahrenheit
          : temperatureFahrenheit // ignore: cast_nullable_to_non_nullable
              as double?,
      targetTemperatureCelsius: freezed == targetTemperatureCelsius
          ? _value.targetTemperatureCelsius
          : targetTemperatureCelsius // ignore: cast_nullable_to_non_nullable
              as double?,
      targetTemperatureFahrenheit: freezed == targetTemperatureFahrenheit
          ? _value.targetTemperatureFahrenheit
          : targetTemperatureFahrenheit // ignore: cast_nullable_to_non_nullable
              as double?,
      humidity: freezed == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double?,
      moisture: freezed == moisture
          ? _value.moisture
          : moisture // ignore: cast_nullable_to_non_nullable
              as double?,
      windAngleInDegrees: freezed == windAngleInDegrees
          ? _value.windAngleInDegrees
          : windAngleInDegrees // ignore: cast_nullable_to_non_nullable
              as double?,
      windStrengthInMeterPerSeconds: freezed == windStrengthInMeterPerSeconds
          ? _value.windStrengthInMeterPerSeconds
          : windStrengthInMeterPerSeconds // ignore: cast_nullable_to_non_nullable
              as double?,
      windStrengthInKilometerPerHour: freezed == windStrengthInKilometerPerHour
          ? _value.windStrengthInKilometerPerHour
          : windStrengthInKilometerPerHour // ignore: cast_nullable_to_non_nullable
              as double?,
      windStrengthInMilesPerHour: freezed == windStrengthInMilesPerHour
          ? _value.windStrengthInMilesPerHour
          : windStrengthInMilesPerHour // ignore: cast_nullable_to_non_nullable
              as double?,
      gustStrengthInMeterPerSeconds: freezed == gustStrengthInMeterPerSeconds
          ? _value.gustStrengthInMeterPerSeconds
          : gustStrengthInMeterPerSeconds // ignore: cast_nullable_to_non_nullable
              as double?,
      gustStrengthInKilometerPerHour: freezed == gustStrengthInKilometerPerHour
          ? _value.gustStrengthInKilometerPerHour
          : gustStrengthInKilometerPerHour // ignore: cast_nullable_to_non_nullable
              as double?,
      gustStrengthInMilesPerHour: freezed == gustStrengthInMilesPerHour
          ? _value.gustStrengthInMilesPerHour
          : gustStrengthInMilesPerHour // ignore: cast_nullable_to_non_nullable
              as double?,
      lightInLux: freezed == lightInLux
          ? _value.lightInLux
          : lightInLux // ignore: cast_nullable_to_non_nullable
              as int?,
      uvRadiation: freezed == uvRadiation
          ? _value.uvRadiation
          : uvRadiation // ignore: cast_nullable_to_non_nullable
              as int?,
      rainInMillimeters: freezed == rainInMillimeters
          ? _value.rainInMillimeters
          : rainInMillimeters // ignore: cast_nullable_to_non_nullable
              as double?,
      rainInInches: freezed == rainInInches
          ? _value.rainInInches
          : rainInInches // ignore: cast_nullable_to_non_nullable
              as double?,
      rainRateMillimeterPerHour: freezed == rainRateMillimeterPerHour
          ? _value.rainRateMillimeterPerHour
          : rainRateMillimeterPerHour // ignore: cast_nullable_to_non_nullable
              as double?,
      rainRateInchesPerHour: freezed == rainRateInchesPerHour
          ? _value.rainRateInchesPerHour
          : rainRateInchesPerHour // ignore: cast_nullable_to_non_nullable
              as double?,
      pressureInhPa: freezed == pressureInhPa
          ? _value.pressureInhPa
          : pressureInhPa // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Rtl433DeviceImpl extends _Rtl433Device {
  const _$Rtl433DeviceImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'time') required this.time,
      @JsonKey(name: 'model') required this.model,
      @JsonKey(name: 'mic') this.mic,
      @JsonKey(name: 'channel') this.channel,
      @JsonKey(name: 'subtype') this.subtype,
      @JsonKey(name: 'battery_ok') this.batteryOk,
      @JsonKey(name: 'battery_V') this.batteryVolts,
      @JsonKey(name: 'temperature_C') this.temperatureCelsius,
      @JsonKey(name: 'temperature_F') this.temperatureFahrenheit,
      @JsonKey(name: 'setpoint_C') this.targetTemperatureCelsius,
      @JsonKey(name: 'setpoint_F') this.targetTemperatureFahrenheit,
      @JsonKey(name: 'humidity') this.humidity,
      @JsonKey(name: 'moisture') this.moisture,
      @JsonKey(name: 'wind_dir_deg') this.windAngleInDegrees,
      @JsonKey(name: 'wind_avg_m_s') this.windStrengthInMeterPerSeconds,
      @JsonKey(name: 'wind_avg_km_h') this.windStrengthInKilometerPerHour,
      @JsonKey(name: 'wind_avg_mi_h') this.windStrengthInMilesPerHour,
      @JsonKey(name: 'wind_max_m_s') this.gustStrengthInMeterPerSeconds,
      @JsonKey(name: 'wind_max_km_h') this.gustStrengthInKilometerPerHour,
      @JsonKey(name: 'wind_max_mi_h') this.gustStrengthInMilesPerHour,
      @JsonKey(name: 'light_lux') this.lightInLux,
      @JsonKey(name: 'uv') this.uvRadiation,
      @JsonKey(name: 'rain_mm') this.rainInMillimeters,
      @JsonKey(name: 'rain_in') this.rainInInches,
      @JsonKey(name: 'rain_rate_mm_h') this.rainRateMillimeterPerHour,
      @JsonKey(name: 'rain_rate_in_h') this.rainRateInchesPerHour,
      @JsonKey(name: 'pressure_hPa') this.pressureInhPa})
      : super._();

  factory _$Rtl433DeviceImpl.fromJson(Map<String, dynamic> json) =>
      _$$Rtl433DeviceImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final Object id;
  @override
  @JsonKey(name: 'time')
  final String time;
  @override
  @JsonKey(name: 'model')
  final String model;
  @override
  @JsonKey(name: 'mic')
  final String? mic;
  @override
  @JsonKey(name: 'channel')
  final String? channel;
  @override
  @JsonKey(name: 'subtype')
  final String? subtype;
  @override
  @JsonKey(name: 'battery_ok')
  final double? batteryOk;
  @override
  @JsonKey(name: 'battery_V')
  final double? batteryVolts;
  @override
  @JsonKey(name: 'temperature_C')
  final double? temperatureCelsius;
  @override
  @JsonKey(name: 'temperature_F')
  final double? temperatureFahrenheit;
  @override
  @JsonKey(name: 'setpoint_C')
  final double? targetTemperatureCelsius;
  @override
  @JsonKey(name: 'setpoint_F')
  final double? targetTemperatureFahrenheit;
  @override
  @JsonKey(name: 'humidity')
  final double? humidity;
  @override
  @JsonKey(name: 'moisture')
  final double? moisture;
  @override
  @JsonKey(name: 'wind_dir_deg')
  final double? windAngleInDegrees;
  @override
  @JsonKey(name: 'wind_avg_m_s')
  final double? windStrengthInMeterPerSeconds;
  @override
  @JsonKey(name: 'wind_avg_km_h')
  final double? windStrengthInKilometerPerHour;
  @override
  @JsonKey(name: 'wind_avg_mi_h')
  final double? windStrengthInMilesPerHour;
  @override
  @JsonKey(name: 'wind_max_m_s')
  final double? gustStrengthInMeterPerSeconds;
  @override
  @JsonKey(name: 'wind_max_km_h')
  final double? gustStrengthInKilometerPerHour;
  @override
  @JsonKey(name: 'wind_max_mi_h')
  final double? gustStrengthInMilesPerHour;
  @override
  @JsonKey(name: 'light_lux')
  final int? lightInLux;
  @override
  @JsonKey(name: 'uv')
  final int? uvRadiation;

  /// Rainfall from rain sensor (in mm) since last reset. Reset method is device dependent.
  @override
  @JsonKey(name: 'rain_mm')
  final double? rainInMillimeters;

  /// Rainfall from rain sensor (in inches) since last reset. Reset method is device dependent.
  @override
  @JsonKey(name: 'rain_in')
  final double? rainInInches;

  /// Rainfall rate from rain sensor (in mm) per hour.
  @override
  @JsonKey(name: 'rain_rate_mm_h')
  final double? rainRateMillimeterPerHour;

  /// Rainfall rate from rain sensor (in inches) per hour.
  @override
  @JsonKey(name: 'rain_rate_in_h')
  final double? rainRateInchesPerHour;

  /// Air pressure from barometer or Tire Pressure Monitor in hPa (psi)
  @override
  @JsonKey(name: 'pressure_hPa')
  final double? pressureInhPa;

  @override
  String toString() {
    return 'Rtl433Device(id: $id, time: $time, model: $model, mic: $mic, channel: $channel, subtype: $subtype, batteryOk: $batteryOk, batteryVolts: $batteryVolts, temperatureCelsius: $temperatureCelsius, temperatureFahrenheit: $temperatureFahrenheit, targetTemperatureCelsius: $targetTemperatureCelsius, targetTemperatureFahrenheit: $targetTemperatureFahrenheit, humidity: $humidity, moisture: $moisture, windAngleInDegrees: $windAngleInDegrees, windStrengthInMeterPerSeconds: $windStrengthInMeterPerSeconds, windStrengthInKilometerPerHour: $windStrengthInKilometerPerHour, windStrengthInMilesPerHour: $windStrengthInMilesPerHour, gustStrengthInMeterPerSeconds: $gustStrengthInMeterPerSeconds, gustStrengthInKilometerPerHour: $gustStrengthInKilometerPerHour, gustStrengthInMilesPerHour: $gustStrengthInMilesPerHour, lightInLux: $lightInLux, uvRadiation: $uvRadiation, rainInMillimeters: $rainInMillimeters, rainInInches: $rainInInches, rainRateMillimeterPerHour: $rainRateMillimeterPerHour, rainRateInchesPerHour: $rainRateInchesPerHour, pressureInhPa: $pressureInhPa)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Rtl433DeviceImpl &&
            const DeepCollectionEquality().equals(other.id, id) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.mic, mic) || other.mic == mic) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.subtype, subtype) || other.subtype == subtype) &&
            (identical(other.batteryOk, batteryOk) ||
                other.batteryOk == batteryOk) &&
            (identical(other.batteryVolts, batteryVolts) ||
                other.batteryVolts == batteryVolts) &&
            (identical(other.temperatureCelsius, temperatureCelsius) ||
                other.temperatureCelsius == temperatureCelsius) &&
            (identical(other.temperatureFahrenheit, temperatureFahrenheit) ||
                other.temperatureFahrenheit == temperatureFahrenheit) &&
            (identical(other.targetTemperatureCelsius, targetTemperatureCelsius) ||
                other.targetTemperatureCelsius == targetTemperatureCelsius) &&
            (identical(other.targetTemperatureFahrenheit, targetTemperatureFahrenheit) ||
                other.targetTemperatureFahrenheit ==
                    targetTemperatureFahrenheit) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.moisture, moisture) ||
                other.moisture == moisture) &&
            (identical(other.windAngleInDegrees, windAngleInDegrees) ||
                other.windAngleInDegrees == windAngleInDegrees) &&
            (identical(other.windStrengthInMeterPerSeconds, windStrengthInMeterPerSeconds) ||
                other.windStrengthInMeterPerSeconds ==
                    windStrengthInMeterPerSeconds) &&
            (identical(other.windStrengthInKilometerPerHour, windStrengthInKilometerPerHour) ||
                other.windStrengthInKilometerPerHour ==
                    windStrengthInKilometerPerHour) &&
            (identical(other.windStrengthInMilesPerHour, windStrengthInMilesPerHour) ||
                other.windStrengthInMilesPerHour ==
                    windStrengthInMilesPerHour) &&
            (identical(other.gustStrengthInMeterPerSeconds, gustStrengthInMeterPerSeconds) ||
                other.gustStrengthInMeterPerSeconds ==
                    gustStrengthInMeterPerSeconds) &&
            (identical(other.gustStrengthInKilometerPerHour, gustStrengthInKilometerPerHour) ||
                other.gustStrengthInKilometerPerHour ==
                    gustStrengthInKilometerPerHour) &&
            (identical(other.gustStrengthInMilesPerHour, gustStrengthInMilesPerHour) ||
                other.gustStrengthInMilesPerHour ==
                    gustStrengthInMilesPerHour) &&
            (identical(other.lightInLux, lightInLux) ||
                other.lightInLux == lightInLux) &&
            (identical(other.uvRadiation, uvRadiation) ||
                other.uvRadiation == uvRadiation) &&
            (identical(other.rainInMillimeters, rainInMillimeters) ||
                other.rainInMillimeters == rainInMillimeters) &&
            (identical(other.rainInInches, rainInInches) ||
                other.rainInInches == rainInInches) &&
            (identical(other.rainRateMillimeterPerHour, rainRateMillimeterPerHour) || other.rainRateMillimeterPerHour == rainRateMillimeterPerHour) &&
            (identical(other.rainRateInchesPerHour, rainRateInchesPerHour) || other.rainRateInchesPerHour == rainRateInchesPerHour) &&
            (identical(other.pressureInhPa, pressureInhPa) || other.pressureInhPa == pressureInhPa));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(id),
        time,
        model,
        mic,
        channel,
        subtype,
        batteryOk,
        batteryVolts,
        temperatureCelsius,
        temperatureFahrenheit,
        targetTemperatureCelsius,
        targetTemperatureFahrenheit,
        humidity,
        moisture,
        windAngleInDegrees,
        windStrengthInMeterPerSeconds,
        windStrengthInKilometerPerHour,
        windStrengthInMilesPerHour,
        gustStrengthInMeterPerSeconds,
        gustStrengthInKilometerPerHour,
        gustStrengthInMilesPerHour,
        lightInLux,
        uvRadiation,
        rainInMillimeters,
        rainInInches,
        rainRateMillimeterPerHour,
        rainRateInchesPerHour,
        pressureInhPa
      ]);

  /// Create a copy of Rtl433Device
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$Rtl433DeviceImplCopyWith<_$Rtl433DeviceImpl> get copyWith =>
      __$$Rtl433DeviceImplCopyWithImpl<_$Rtl433DeviceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$Rtl433DeviceImplToJson(
      this,
    );
  }
}

abstract class _Rtl433Device extends Rtl433Device {
  const factory _Rtl433Device(
      {@JsonKey(name: 'id') required final Object id,
      @JsonKey(name: 'time') required final String time,
      @JsonKey(name: 'model') required final String model,
      @JsonKey(name: 'mic') final String? mic,
      @JsonKey(name: 'channel') final String? channel,
      @JsonKey(name: 'subtype') final String? subtype,
      @JsonKey(name: 'battery_ok') final double? batteryOk,
      @JsonKey(name: 'battery_V') final double? batteryVolts,
      @JsonKey(name: 'temperature_C') final double? temperatureCelsius,
      @JsonKey(name: 'temperature_F') final double? temperatureFahrenheit,
      @JsonKey(name: 'setpoint_C') final double? targetTemperatureCelsius,
      @JsonKey(name: 'setpoint_F') final double? targetTemperatureFahrenheit,
      @JsonKey(name: 'humidity') final double? humidity,
      @JsonKey(name: 'moisture') final double? moisture,
      @JsonKey(name: 'wind_dir_deg') final double? windAngleInDegrees,
      @JsonKey(name: 'wind_avg_m_s')
      final double? windStrengthInMeterPerSeconds,
      @JsonKey(name: 'wind_avg_km_h')
      final double? windStrengthInKilometerPerHour,
      @JsonKey(name: 'wind_avg_mi_h') final double? windStrengthInMilesPerHour,
      @JsonKey(name: 'wind_max_m_s')
      final double? gustStrengthInMeterPerSeconds,
      @JsonKey(name: 'wind_max_km_h')
      final double? gustStrengthInKilometerPerHour,
      @JsonKey(name: 'wind_max_mi_h') final double? gustStrengthInMilesPerHour,
      @JsonKey(name: 'light_lux') final int? lightInLux,
      @JsonKey(name: 'uv') final int? uvRadiation,
      @JsonKey(name: 'rain_mm') final double? rainInMillimeters,
      @JsonKey(name: 'rain_in') final double? rainInInches,
      @JsonKey(name: 'rain_rate_mm_h') final double? rainRateMillimeterPerHour,
      @JsonKey(name: 'rain_rate_in_h') final double? rainRateInchesPerHour,
      @JsonKey(name: 'pressure_hPa')
      final double? pressureInhPa}) = _$Rtl433DeviceImpl;
  const _Rtl433Device._() : super._();

  factory _Rtl433Device.fromJson(Map<String, dynamic> json) =
      _$Rtl433DeviceImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  Object get id;
  @override
  @JsonKey(name: 'time')
  String get time;
  @override
  @JsonKey(name: 'model')
  String get model;
  @override
  @JsonKey(name: 'mic')
  String? get mic;
  @override
  @JsonKey(name: 'channel')
  String? get channel;
  @override
  @JsonKey(name: 'subtype')
  String? get subtype;
  @override
  @JsonKey(name: 'battery_ok')
  double? get batteryOk;
  @override
  @JsonKey(name: 'battery_V')
  double? get batteryVolts;
  @override
  @JsonKey(name: 'temperature_C')
  double? get temperatureCelsius;
  @override
  @JsonKey(name: 'temperature_F')
  double? get temperatureFahrenheit;
  @override
  @JsonKey(name: 'setpoint_C')
  double? get targetTemperatureCelsius;
  @override
  @JsonKey(name: 'setpoint_F')
  double? get targetTemperatureFahrenheit;
  @override
  @JsonKey(name: 'humidity')
  double? get humidity;
  @override
  @JsonKey(name: 'moisture')
  double? get moisture;
  @override
  @JsonKey(name: 'wind_dir_deg')
  double? get windAngleInDegrees;
  @override
  @JsonKey(name: 'wind_avg_m_s')
  double? get windStrengthInMeterPerSeconds;
  @override
  @JsonKey(name: 'wind_avg_km_h')
  double? get windStrengthInKilometerPerHour;
  @override
  @JsonKey(name: 'wind_avg_mi_h')
  double? get windStrengthInMilesPerHour;
  @override
  @JsonKey(name: 'wind_max_m_s')
  double? get gustStrengthInMeterPerSeconds;
  @override
  @JsonKey(name: 'wind_max_km_h')
  double? get gustStrengthInKilometerPerHour;
  @override
  @JsonKey(name: 'wind_max_mi_h')
  double? get gustStrengthInMilesPerHour;
  @override
  @JsonKey(name: 'light_lux')
  int? get lightInLux;
  @override
  @JsonKey(name: 'uv')
  int? get uvRadiation;

  /// Rainfall from rain sensor (in mm) since last reset. Reset method is device dependent.
  @override
  @JsonKey(name: 'rain_mm')
  double? get rainInMillimeters;

  /// Rainfall from rain sensor (in inches) since last reset. Reset method is device dependent.
  @override
  @JsonKey(name: 'rain_in')
  double? get rainInInches;

  /// Rainfall rate from rain sensor (in mm) per hour.
  @override
  @JsonKey(name: 'rain_rate_mm_h')
  double? get rainRateMillimeterPerHour;

  /// Rainfall rate from rain sensor (in inches) per hour.
  @override
  @JsonKey(name: 'rain_rate_in_h')
  double? get rainRateInchesPerHour;

  /// Air pressure from barometer or Tire Pressure Monitor in hPa (psi)
  @override
  @JsonKey(name: 'pressure_hPa')
  double? get pressureInhPa;

  /// Create a copy of Rtl433Device
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$Rtl433DeviceImplCopyWith<_$Rtl433DeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
