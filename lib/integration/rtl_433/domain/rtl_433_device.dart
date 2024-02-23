import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/feature/device/domain/device_definition.dart';
import 'package:smart_dash/integration/rtl_433/rtl_433.dart';

part 'rtl_433_device.freezed.dart';
part 'rtl_433_device.g.dart';

/// Supported Rtl433 Device types
enum Rtl433DeviceType {
  /// Any supported Rtl433 Device type
  any(''),

  sensor('Sensor'),

  /// Device unknown to SmartDash
  unknown('');

  const Rtl433DeviceType(this.name);

  final String name;

  bool get isAny => this == any;

  DeviceDefinition toDefinition() {
    final type = toDeviceType();
    return DeviceDefinition(
      type: toDeviceType(),
      name: Rtl433.readableModelName[this] ?? type.name,
    );
  }

  static Rtl433DeviceType fromNativeType(String name) => switch (name) {
        'Cotech-367959' => Rtl433DeviceType.sensor,
        _ => Rtl433DeviceType.unknown
      };

  static Rtl433DeviceType fromDeviceType(DeviceType type) => switch (type) {
        DeviceType.any => Rtl433DeviceType.any,
        DeviceType.sensor => Rtl433DeviceType.sensor,
        _ => Rtl433DeviceType.unknown
      };

  DeviceType toDeviceType() => switch (this) {
        Rtl433DeviceType.any => DeviceType.any,
        Rtl433DeviceType.sensor => DeviceType.sensor,
        _ => DeviceType.unknown,
      };
}

/// See https://triq.org/rtl_433/DATA_FORMAT.html
@freezed
class Rtl433Device with _$Rtl433Device, DeviceMapper {
  const Rtl433Device._();
  const factory Rtl433Device({
    @JsonKey(name: 'id') required Object id,
    @JsonKey(name: 'time') required String time,
    @JsonKey(name: 'model') required String model,
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
    @JsonKey(name: 'rain_mm') double? rainInMillimeters,
    @JsonKey(name: 'rain_in') double? rainInInches,
    @JsonKey(name: 'rain_rate_mm_h') double? rainRateMillimeterPerHour,
    @JsonKey(name: 'rain_rate_in_h') double? rainRateInchesPerHour,
    @JsonKey(name: 'pressure_hPa') double? pressureInhPa,
  }) = _Rtl433Device;

  bool get hasHumidity => humidity != null;

  bool get hasWindAngle => windAngleInDegrees != null;

  bool get hasRain => rainInMillimeters != null || rainInInches != null;

  bool get hasTemperature =>
      temperatureCelsius != null || temperatureFahrenheit != null;

  bool get hasTargetTemperature =>
      targetTemperatureCelsius != null || targetTemperatureFahrenheit != null;

  bool get hasWindStrength =>
      windStrengthInMeterPerSeconds != null ||
      windStrengthInKilometerPerHour != null ||
      windStrengthInMilesPerHour != null;

  bool get hasGustStrength =>
      gustStrengthInMeterPerSeconds != null ||
      gustStrengthInKilometerPerHour != null ||
      gustStrengthInMilesPerHour != null;

  /// Get [temperature] in unit [TokenUnit.temperature]
  double? get temperature =>
      temperatureCelsius ??
      (temperatureFahrenheit == null
          ? null
          : (5 / 9 * (temperatureFahrenheit! - 32.0)));

  /// Get [targetTemperature] in unit [TokenUnit.temperature]
  double? get targetTemperature =>
      targetTemperatureCelsius ??
      (targetTemperatureFahrenheit == null
          ? null
          : (5 / 9 * (targetTemperatureFahrenheit! - 32.0)));

  /// Get [rain] in unit [TokenUnit.rain]
  double? get rain =>
      rainInMillimeters ?? (rainInInches == null ? null : rainInInches! * 25.4);

  /// Get [windStrength] in unit [TokenUnit.windStrength]
  double? get windStrength =>
      windStrengthInMeterPerSeconds ??
      (windStrengthInKilometerPerHour == null
          ? (windStrengthInMilesPerHour == null
              ? null
              : windStrengthInMilesPerHour! * 0.44704)
          : windStrengthInKilometerPerHour! * 5 / 18);

  /// Get [gustStrength] in unit [TokenUnit.gustStrength]
  double? get gustStrength =>
      gustStrengthInMeterPerSeconds ??
      (gustStrengthInKilometerPerHour == null
          ? (gustStrengthInMilesPerHour == null
              ? null
              : gustStrengthInMilesPerHour! * 0.44704)
          : gustStrengthInKilometerPerHour! * 5 / 18);

  /// Get [time] as [DateTime]
  DateTime get lastUpdated {
    List<String> parts = time.split('.');
    int seconds = int.parse(parts[0]);
    int microseconds = int.parse(parts[1]);
    int totalMicroseconds = seconds * 1000000 + microseconds;

    DateTime dateTime =
        DateTime.fromMicrosecondsSinceEpoch(totalMicroseconds, isUtc: true);

    return dateTime;
  }

  factory Rtl433Device.fromJson(Map<String, Object?> json) =>
      _$Rtl433DeviceFromJson(json);

  @override
  Device toDevice() => Device(
        data: toJson(),
        name: model,
        id: '$model-$id',
        service: Rtl433.key,
        capabilities: [
          if (hasRain) DeviceCapability.rain,
          if (hasHumidity) DeviceCapability.humidity,
          if (hasWindAngle) DeviceCapability.windAngle,
          if (hasTemperature) DeviceCapability.temperature,
          if (hasWindStrength) DeviceCapability.windStrength,
          if (hasGustStrength) DeviceCapability.gustStrength,
//          if (hasTargetTemperature) DeviceCapability.targetTemperature,
        ],
        rain: rain,
        humidity: humidity,
        windAngle: windAngleInDegrees,
        windStrength: windStrength,
        gustStrength: gustStrength,
        temperature: temperature,
        lastUpdated: lastUpdated,
        type: Rtl433DeviceType.fromNativeType(model).toDeviceType(),
      );

  DeviceDefinition toDeviceDefinition() {
    final type = Rtl433DeviceType.fromNativeType(model);
    return DeviceDefinition(
      type: type.toDeviceType(),
      name: Rtl433.readableModelName[type] ?? model,
    );
  }
}
