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
  double? get windDirectionDegrees => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_avg_m_s')
  double? get windAverageMeterPerSeconds => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_avg_km_h')
  double? get indAverageKilometerPerHour => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_avg_mi_h')
  double? get indAverageMilesPerHour => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_max_m_s')
  double? get windMaxMeterPerSeconds => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_max_km_h')
  double? get windMaxKilometerPerHour => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_max_mi_h')
  double? get windMaxMilesPerHour => throw _privateConstructorUsedError;
  @JsonKey(name: 'rain_mm')
  double? get rainInMillimeters => throw _privateConstructorUsedError;
  @JsonKey(name: 'rain_in')
  double? get rainInInches => throw _privateConstructorUsedError;
  @JsonKey(name: 'rain_rate_mm_h')
  double? get rainRateMillimeterPerHour => throw _privateConstructorUsedError;
  @JsonKey(name: 'rain_rate_in_h')
  double? get rainRateInchesPerHour => throw _privateConstructorUsedError;
  @JsonKey(name: 'pressure_hPa')
  double? get pressureInhPa => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      @JsonKey(name: 'wind_dir_deg') double? windDirectionDegrees,
      @JsonKey(name: 'wind_avg_m_s') double? windAverageMeterPerSeconds,
      @JsonKey(name: 'wind_avg_km_h') double? indAverageKilometerPerHour,
      @JsonKey(name: 'wind_avg_mi_h') double? indAverageMilesPerHour,
      @JsonKey(name: 'wind_max_m_s') double? windMaxMeterPerSeconds,
      @JsonKey(name: 'wind_max_km_h') double? windMaxKilometerPerHour,
      @JsonKey(name: 'wind_max_mi_h') double? windMaxMilesPerHour,
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
    Object? windDirectionDegrees = freezed,
    Object? windAverageMeterPerSeconds = freezed,
    Object? indAverageKilometerPerHour = freezed,
    Object? indAverageMilesPerHour = freezed,
    Object? windMaxMeterPerSeconds = freezed,
    Object? windMaxKilometerPerHour = freezed,
    Object? windMaxMilesPerHour = freezed,
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
      windDirectionDegrees: freezed == windDirectionDegrees
          ? _value.windDirectionDegrees
          : windDirectionDegrees // ignore: cast_nullable_to_non_nullable
              as double?,
      windAverageMeterPerSeconds: freezed == windAverageMeterPerSeconds
          ? _value.windAverageMeterPerSeconds
          : windAverageMeterPerSeconds // ignore: cast_nullable_to_non_nullable
              as double?,
      indAverageKilometerPerHour: freezed == indAverageKilometerPerHour
          ? _value.indAverageKilometerPerHour
          : indAverageKilometerPerHour // ignore: cast_nullable_to_non_nullable
              as double?,
      indAverageMilesPerHour: freezed == indAverageMilesPerHour
          ? _value.indAverageMilesPerHour
          : indAverageMilesPerHour // ignore: cast_nullable_to_non_nullable
              as double?,
      windMaxMeterPerSeconds: freezed == windMaxMeterPerSeconds
          ? _value.windMaxMeterPerSeconds
          : windMaxMeterPerSeconds // ignore: cast_nullable_to_non_nullable
              as double?,
      windMaxKilometerPerHour: freezed == windMaxKilometerPerHour
          ? _value.windMaxKilometerPerHour
          : windMaxKilometerPerHour // ignore: cast_nullable_to_non_nullable
              as double?,
      windMaxMilesPerHour: freezed == windMaxMilesPerHour
          ? _value.windMaxMilesPerHour
          : windMaxMilesPerHour // ignore: cast_nullable_to_non_nullable
              as double?,
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
      @JsonKey(name: 'wind_dir_deg') double? windDirectionDegrees,
      @JsonKey(name: 'wind_avg_m_s') double? windAverageMeterPerSeconds,
      @JsonKey(name: 'wind_avg_km_h') double? indAverageKilometerPerHour,
      @JsonKey(name: 'wind_avg_mi_h') double? indAverageMilesPerHour,
      @JsonKey(name: 'wind_max_m_s') double? windMaxMeterPerSeconds,
      @JsonKey(name: 'wind_max_km_h') double? windMaxKilometerPerHour,
      @JsonKey(name: 'wind_max_mi_h') double? windMaxMilesPerHour,
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
    Object? windDirectionDegrees = freezed,
    Object? windAverageMeterPerSeconds = freezed,
    Object? indAverageKilometerPerHour = freezed,
    Object? indAverageMilesPerHour = freezed,
    Object? windMaxMeterPerSeconds = freezed,
    Object? windMaxKilometerPerHour = freezed,
    Object? windMaxMilesPerHour = freezed,
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
      windDirectionDegrees: freezed == windDirectionDegrees
          ? _value.windDirectionDegrees
          : windDirectionDegrees // ignore: cast_nullable_to_non_nullable
              as double?,
      windAverageMeterPerSeconds: freezed == windAverageMeterPerSeconds
          ? _value.windAverageMeterPerSeconds
          : windAverageMeterPerSeconds // ignore: cast_nullable_to_non_nullable
              as double?,
      indAverageKilometerPerHour: freezed == indAverageKilometerPerHour
          ? _value.indAverageKilometerPerHour
          : indAverageKilometerPerHour // ignore: cast_nullable_to_non_nullable
              as double?,
      indAverageMilesPerHour: freezed == indAverageMilesPerHour
          ? _value.indAverageMilesPerHour
          : indAverageMilesPerHour // ignore: cast_nullable_to_non_nullable
              as double?,
      windMaxMeterPerSeconds: freezed == windMaxMeterPerSeconds
          ? _value.windMaxMeterPerSeconds
          : windMaxMeterPerSeconds // ignore: cast_nullable_to_non_nullable
              as double?,
      windMaxKilometerPerHour: freezed == windMaxKilometerPerHour
          ? _value.windMaxKilometerPerHour
          : windMaxKilometerPerHour // ignore: cast_nullable_to_non_nullable
              as double?,
      windMaxMilesPerHour: freezed == windMaxMilesPerHour
          ? _value.windMaxMilesPerHour
          : windMaxMilesPerHour // ignore: cast_nullable_to_non_nullable
              as double?,
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
      @JsonKey(name: 'wind_dir_deg') this.windDirectionDegrees,
      @JsonKey(name: 'wind_avg_m_s') this.windAverageMeterPerSeconds,
      @JsonKey(name: 'wind_avg_km_h') this.indAverageKilometerPerHour,
      @JsonKey(name: 'wind_avg_mi_h') this.indAverageMilesPerHour,
      @JsonKey(name: 'wind_max_m_s') this.windMaxMeterPerSeconds,
      @JsonKey(name: 'wind_max_km_h') this.windMaxKilometerPerHour,
      @JsonKey(name: 'wind_max_mi_h') this.windMaxMilesPerHour,
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
  final double? windDirectionDegrees;
  @override
  @JsonKey(name: 'wind_avg_m_s')
  final double? windAverageMeterPerSeconds;
  @override
  @JsonKey(name: 'wind_avg_km_h')
  final double? indAverageKilometerPerHour;
  @override
  @JsonKey(name: 'wind_avg_mi_h')
  final double? indAverageMilesPerHour;
  @override
  @JsonKey(name: 'wind_max_m_s')
  final double? windMaxMeterPerSeconds;
  @override
  @JsonKey(name: 'wind_max_km_h')
  final double? windMaxKilometerPerHour;
  @override
  @JsonKey(name: 'wind_max_mi_h')
  final double? windMaxMilesPerHour;
  @override
  @JsonKey(name: 'rain_mm')
  final double? rainInMillimeters;
  @override
  @JsonKey(name: 'rain_in')
  final double? rainInInches;
  @override
  @JsonKey(name: 'rain_rate_mm_h')
  final double? rainRateMillimeterPerHour;
  @override
  @JsonKey(name: 'rain_rate_in_h')
  final double? rainRateInchesPerHour;
  @override
  @JsonKey(name: 'pressure_hPa')
  final double? pressureInhPa;

  @override
  String toString() {
    return 'Rtl433Device(id: $id, time: $time, model: $model, mic: $mic, channel: $channel, subtype: $subtype, batteryOk: $batteryOk, batteryVolts: $batteryVolts, temperatureCelsius: $temperatureCelsius, temperatureFahrenheit: $temperatureFahrenheit, targetTemperatureCelsius: $targetTemperatureCelsius, targetTemperatureFahrenheit: $targetTemperatureFahrenheit, humidity: $humidity, moisture: $moisture, windDirectionDegrees: $windDirectionDegrees, windAverageMeterPerSeconds: $windAverageMeterPerSeconds, indAverageKilometerPerHour: $indAverageKilometerPerHour, indAverageMilesPerHour: $indAverageMilesPerHour, windMaxMeterPerSeconds: $windMaxMeterPerSeconds, windMaxKilometerPerHour: $windMaxKilometerPerHour, windMaxMilesPerHour: $windMaxMilesPerHour, rainInMillimeters: $rainInMillimeters, rainInInches: $rainInInches, rainRateMillimeterPerHour: $rainRateMillimeterPerHour, rainRateInchesPerHour: $rainRateInchesPerHour, pressureInhPa: $pressureInhPa)';
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
            (identical(other.targetTemperatureFahrenheit,
                    targetTemperatureFahrenheit) ||
                other.targetTemperatureFahrenheit ==
                    targetTemperatureFahrenheit) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.moisture, moisture) ||
                other.moisture == moisture) &&
            (identical(other.windDirectionDegrees, windDirectionDegrees) ||
                other.windDirectionDegrees == windDirectionDegrees) &&
            (identical(other.windAverageMeterPerSeconds, windAverageMeterPerSeconds) ||
                other.windAverageMeterPerSeconds ==
                    windAverageMeterPerSeconds) &&
            (identical(other.indAverageKilometerPerHour, indAverageKilometerPerHour) ||
                other.indAverageKilometerPerHour ==
                    indAverageKilometerPerHour) &&
            (identical(other.indAverageMilesPerHour, indAverageMilesPerHour) ||
                other.indAverageMilesPerHour == indAverageMilesPerHour) &&
            (identical(other.windMaxMeterPerSeconds, windMaxMeterPerSeconds) ||
                other.windMaxMeterPerSeconds == windMaxMeterPerSeconds) &&
            (identical(other.windMaxKilometerPerHour, windMaxKilometerPerHour) ||
                other.windMaxKilometerPerHour == windMaxKilometerPerHour) &&
            (identical(other.windMaxMilesPerHour, windMaxMilesPerHour) ||
                other.windMaxMilesPerHour == windMaxMilesPerHour) &&
            (identical(other.rainInMillimeters, rainInMillimeters) ||
                other.rainInMillimeters == rainInMillimeters) &&
            (identical(other.rainInInches, rainInInches) ||
                other.rainInInches == rainInInches) &&
            (identical(other.rainRateMillimeterPerHour, rainRateMillimeterPerHour) ||
                other.rainRateMillimeterPerHour == rainRateMillimeterPerHour) &&
            (identical(other.rainRateInchesPerHour, rainRateInchesPerHour) ||
                other.rainRateInchesPerHour == rainRateInchesPerHour) &&
            (identical(other.pressureInhPa, pressureInhPa) ||
                other.pressureInhPa == pressureInhPa));
  }

  @JsonKey(ignore: true)
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
        windDirectionDegrees,
        windAverageMeterPerSeconds,
        indAverageKilometerPerHour,
        indAverageMilesPerHour,
        windMaxMeterPerSeconds,
        windMaxKilometerPerHour,
        windMaxMilesPerHour,
        rainInMillimeters,
        rainInInches,
        rainRateMillimeterPerHour,
        rainRateInchesPerHour,
        pressureInhPa
      ]);

  @JsonKey(ignore: true)
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
      @JsonKey(name: 'wind_dir_deg') final double? windDirectionDegrees,
      @JsonKey(name: 'wind_avg_m_s') final double? windAverageMeterPerSeconds,
      @JsonKey(name: 'wind_avg_km_h') final double? indAverageKilometerPerHour,
      @JsonKey(name: 'wind_avg_mi_h') final double? indAverageMilesPerHour,
      @JsonKey(name: 'wind_max_m_s') final double? windMaxMeterPerSeconds,
      @JsonKey(name: 'wind_max_km_h') final double? windMaxKilometerPerHour,
      @JsonKey(name: 'wind_max_mi_h') final double? windMaxMilesPerHour,
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
  double? get windDirectionDegrees;
  @override
  @JsonKey(name: 'wind_avg_m_s')
  double? get windAverageMeterPerSeconds;
  @override
  @JsonKey(name: 'wind_avg_km_h')
  double? get indAverageKilometerPerHour;
  @override
  @JsonKey(name: 'wind_avg_mi_h')
  double? get indAverageMilesPerHour;
  @override
  @JsonKey(name: 'wind_max_m_s')
  double? get windMaxMeterPerSeconds;
  @override
  @JsonKey(name: 'wind_max_km_h')
  double? get windMaxKilometerPerHour;
  @override
  @JsonKey(name: 'wind_max_mi_h')
  double? get windMaxMilesPerHour;
  @override
  @JsonKey(name: 'rain_mm')
  double? get rainInMillimeters;
  @override
  @JsonKey(name: 'rain_in')
  double? get rainInInches;
  @override
  @JsonKey(name: 'rain_rate_mm_h')
  double? get rainRateMillimeterPerHour;
  @override
  @JsonKey(name: 'rain_rate_in_h')
  double? get rainRateInchesPerHour;
  @override
  @JsonKey(name: 'pressure_hPa')
  double? get pressureInhPa;
  @override
  @JsonKey(ignore: true)
  _$$Rtl433DeviceImplCopyWith<_$Rtl433DeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
