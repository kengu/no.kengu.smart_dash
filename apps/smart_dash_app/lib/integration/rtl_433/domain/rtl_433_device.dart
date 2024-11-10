import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dash_app/feature/device/domain/device.dart';
import 'package:smart_dash_app/feature/device/domain/device_definition.dart';
import 'package:smart_dash_app/integration/rtl_433/rtl_433.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

part 'rtl_433_device.freezed.dart';
part 'rtl_433_device.g.dart';

/// Supported Rtl433 Device types
enum Rtl433DeviceType {
  /// Any supported Rtl433 Device type
  any(''),

  sensor('Sensor'),

  weatherStation('Weather Station'),

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

  static Rtl433DeviceType fromNativeType(String name) =>
      switch (name.toLowerCase()) {
        'cotech-367959' => Rtl433DeviceType.weatherStation,
        'fineoffset-telldusproove' => Rtl433DeviceType.weatherStation,
        _ => Rtl433DeviceType.unknown
      };

  static Rtl433DeviceType fromDeviceType(DeviceType type) => switch (type) {
        DeviceType.any => Rtl433DeviceType.any,
        DeviceType.sensor => Rtl433DeviceType.sensor,
        DeviceType.weatherNow => Rtl433DeviceType.weatherStation,
        _ => Rtl433DeviceType.unknown
      };

  DeviceType toDeviceType() => switch (this) {
        Rtl433DeviceType.any => DeviceType.any,
        Rtl433DeviceType.sensor => DeviceType.sensor,
        Rtl433DeviceType.weatherStation => DeviceType.weatherNow,
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
    @JsonKey(name: 'light_lux') int? lightInLux,
    @JsonKey(name: 'uv') int? uvRadiation,

    /// Rainfall from rain sensor (in mm) since last reset. Reset method is device dependent.
    @JsonKey(name: 'rain_mm') double? rainInMillimeters,

    /// Rainfall from rain sensor (in inches) since last reset. Reset method is device dependent.
    @JsonKey(name: 'rain_in') double? rainInInches,

    /// Rainfall rate from rain sensor (in mm) per hour.
    @JsonKey(name: 'rain_rate_mm_h') double? rainRateMillimeterPerHour,

    /// Rainfall rate from rain sensor (in inches) per hour.
    @JsonKey(name: 'rain_rate_in_h') double? rainRateInchesPerHour,

    /// Air pressure from barometer or Tire Pressure Monitor in hPa (psi)
    @JsonKey(name: 'pressure_hPa') double? pressureInhPa,
  }) = _Rtl433Device;

  bool get hasHumidity => humidity != null;

  bool get hasLuminance {
    if (lightInLux != null) {
      switch (model.toLowerCase()) {
        case 'cotech-367959':
          // versions without light and uv sensors reports value 251
          return uvRadiation! < 251;
        default:
          return true;
      }
    }
    return false;
  }

  bool get hasUltraviolet {
    if (uvRadiation != null) {
      switch (model.toLowerCase()) {
        case 'cotech-367959':
          // versions without light sensors reports value 251
          return uvRadiation! < 251;
        default:
          return true;
      }
    }
    return false;
  }

  bool get hasWindAngle => windAngleInDegrees != null;

  bool get hasRainTotal => rainInMillimeters != null || rainInInches != null;

  bool get hasRainRate =>
      rainRateMillimeterPerHour != null || rainRateInchesPerHour != null;

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

  /// Get [temperature] in unit [ValueUnit.temperature]
  double? get temperature =>
      temperatureCelsius ??
      (temperatureFahrenheit == null
          ? null
          : (5 / 9 * (temperatureFahrenheit! - 32.0)));

  /// Get [targetTemperature] in unit [ValueUnit.temperature]
  double? get targetTemperature =>
      targetTemperatureCelsius ??
      (targetTemperatureFahrenheit == null
          ? null
          : (5 / 9 * (targetTemperatureFahrenheit! - 32.0)));

  /// Get [rainRate] in unit [ValueUnit.rainRate]
  double? get rainRate =>
      rainRateMillimeterPerHour ??
      (rainRateInchesPerHour == null ? null : rainRateInchesPerHour! * 25.4);

  /// Get [rainTotal] in unit [ValueUnit.rainTotal]
  double? get rainTotal =>
      rainInMillimeters ?? (rainInInches == null ? null : rainInInches! * 25.4);

  /// Get [windStrength] in unit [ValueUnit.windSpeed]
  double? get windStrength =>
      windStrengthInMeterPerSeconds ??
      (windStrengthInKilometerPerHour == null
          ? (windStrengthInMilesPerHour == null
              ? null
              : windStrengthInMilesPerHour! * 0.44704)
          : windStrengthInKilometerPerHour! * 5 / 18);

  /// Get [gustStrength] in unit [ValueUnit.gustSpeed]
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

  String get deviceId => '$model-$id'.toLowerCase();

  Identity toIdentity() => Identity(
        deviceId: deviceId,
        serviceKey: Rtl433.key,
      );

  List<Capability> get capabilities => [
        if (hasHumidity) Capability.humidity,
        if (hasRainRate) Capability.rainRate,
        if (hasRainTotal) Capability.rainTotal,
        if (hasWindAngle) Capability.windAngle,
        if (hasLuminance) Capability.luminance,
        if (hasUltraviolet) Capability.ultraviolet,
        if (hasWindStrength) Capability.windSpeed,
        if (hasGustStrength) Capability.gustSpeed,
        if (hasUltraviolet) Capability.ultraviolet,
        if (hasTemperature) Capability.temperature,
//          if (hasTargetTemperature) DeviceCapability.targetTemperature,
      ];

  factory Rtl433Device.fromJson(Map<String, Object?> json) =>
      _$Rtl433DeviceFromJson(json);

  @override
  Device toDevice() => Device(
        data: toJson(),
        name: model,
        id: deviceId,
        service: Rtl433.key,
        capabilities: capabilities,
        humidity: humidity,
        rainRate: rainRate,
        rainTotal: rainTotal,
        luminance: hasLuminance ? lightInLux : null,
        ultraviolet: hasUltraviolet ? uvRadiation : null,
        temperature: temperature,
        lastUpdated: lastUpdated,
        windSpeed: windStrength,
        gustSpeed: gustStrength,
        windAngle: windAngleInDegrees,
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
