import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dash/feature/device/domain/device_definition.dart';
import 'package:smart_dash/feature/device/domain/thermostat.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

import 'electric_state.dart';
import 'switch_state.dart';

export 'package:smart_dash/feature/device/domain/electric_state.dart';
export 'package:smart_dash/feature/device/domain/thermostat.dart';

part 'device.freezed.dart';
part 'device.g.dart';

enum DeviceType {
  /// Any supported device type
  any,

  /// Device controller (gateway)
  controller,

  /// Astro (tri-)state switch (off/on/auto)
  astroSwitch,

  /// Thermostat
  thermostat,

  /// Sensor
  sensor,

  /// Energy controller
  energyController,

  /// On / Off relay
  onOffRelay,

  /// Device group
  group,

  /// Program
  program,

  /// Weather measurements
  weatherNow,

  /// Weather forecasts
  weatherForecast,

  /// Device unknown to SmartDash
  unknown;

  bool get isAny => this == any;

  static DeviceType from(String? name) {
    return values.firstWhere((e) => e.name == name,
        orElse: () => DeviceType.any);
  }

  DeviceDefinition toDefinition([String? name]) {
    return DeviceDefinition(
      type: this,
      name: name ?? this.name,
    );
  }
}

/// The [Device] class is a representation of a
/// device paired with SmartDash
@freezed
class Device with _$Device {
  const Device._();

  const factory Device({
    /// Get the device's id
    required String id,

    /// Get the device's name
    required String name,

    /// Get the device's service
    required String service,

    /// Get the device's type
    required DeviceType type,

    /// Get the device's data object (is unmodifiable)
    required Map<String, Object?> data,

    /// The device's capabilities array
    required List<Capability> capabilities,

    /// Get the timestamp for when device's was last updated
    required DateTime lastUpdated,

    /// Get device's measured rain since last measurement (default null)
    double? rain,

    /// Get device's measured rain rate. (default null)
    double? rainRate,

    /// Get device's measured rain since last reset. Reset method is device dependent. (default null)
    double? rainTotal,

    /// Get device's measured ultraviolet radiation (default null)
    int? ultraviolet,

    /// Get device's measured luminance (default null)
    int? luminance,

    /// Get device's measured temperature (default null)
    double? humidity,

    /// Get device's measured temperature (default null)
    double? windAngle,

    /// Get device's measured temperature (default null)
    double? temperature,

    /// Get device's measured wind speed (default null)
    double? windSpeed,

    /// Get device's measured gust speed (default null)
    double? gustSpeed,

    /// Get the device's electric state information (default null)
    ElectricState? electric,

    /// Get the device's switch state information (default null)
    SwitchState? onOff,

    /// Get the device's thermostat information (default null)
    Thermostat? thermostat,

    /// Get device's measured snow depth (default null)
    int? snowDepth,

    /// Get device's measured snow depth (default null)
    int? snowWeight,

    /// Get device's rain forecast (in mm) next 24h (default null)
    double? rain1h,

    /// Get device's rain forecast (in mm) next 3h (default null)
    double? rain3h,

    /// Get device's rain forecast (in mm) next 6h (default null)
    double? rain6h,

    /// Get device's rain forecast (in mm) next 12h (default null)
    double? rain12h,

    /// Get device's rain forecast (in mm) next 24h (default null)
    double? rain1d,

    /// Get device's snow forecast (in cm) next 24h (default null)
    double? snow1h,

    /// Get device's snow forecast (in cm) next 3h (default null)
    double? snow3h,

    /// Get device's snow forecast (in cm) next 6h (default null)
    double? snow6h,

    /// Get device's snow forecast (in cm) next 12h (default null)
    double? snow12h,

    /// Get device's snow forecast (in cm) next 24h (default null)
    double? snow1d,

    /// Get device's temperature forecast (in mm) next 24h (default null)
    double? temperature1h,

    /// Get device's temperature forecast (in mm) next 3h (default null)
    double? temperature3h,

    /// Get device's temperature forecast (in mm) next 6h (default null)
    double? temperature6h,

    /// Get device's temperature forecast (in mm) next 12h (default null)
    double? temperature12h,

    /// Get device's temperature forecast (in mm) next 24h (default null)
    double? temperature1d,
  }) = _Device;

  static String toTokenName(Device device, Capability e) {
    return Token.toName(
      e.variable,
      device.service,
      'device',
      device.id,
    );
  }

  factory Device.fromJson(Map<String, Object?> json) => _$DeviceFromJson(json);
}

@freezed
class Identity with _$Identity {
  const Identity._();

  const factory Identity({
    required String deviceId,
    required String serviceKey,
  }) = _Identity;

  String get id => [serviceKey, deviceId].join(':');

  factory Identity.fromJson(Map<String, Object?> json) =>
      _$IdentityFromJson(json);

  factory Identity.of(Device device) => Identity(
        deviceId: device.id,
        serviceKey: device.service,
      );

  factory Identity.fromToken(Token token) {
    return Identity.fromId(token.name);
  }

  factory Identity.fromId(String id) {
    final parts = id.split(':');
    assert(parts.length == 4, '$id is not a device id');
    return Identity(
      deviceId: parts[3],
      serviceKey: parts[1],
    );
  }
}

mixin DeviceMapper {
  Device toDevice();
  Map<String, Object?> toJson();
}

extension CapabilityX on Capability {
  Token toToken(Device device) {
    return Token(
      tag: name,
      capability: this,
      label: device.name,
      name: Device.toTokenName(device, this),
    );
  }
}

extension DeviceX on Device {
  bool get hasRain => capabilities.hasRain;
  bool get hasRainRate => capabilities.hasRainRate;
  bool get hasRainTotal => capabilities.hasRainTotal;
  bool get hasOnOff => capabilities.hasOnOff;
  bool get hasPower => capabilities.hasPower;
  bool get hasEnergy => capabilities.hasEnergy;
  bool get hasVoltage => capabilities.hasVoltage;
  bool get hasHumidity => capabilities.hasHumidity;
  bool get hasWindAngle => capabilities.hasWindAngle;
  bool get hasLuminance => capabilities.hasLuminance;
  bool get hasUltraviolet => capabilities.hasUltraviolet;
  bool get hasTemperature => capabilities.hasTemperature;
  bool get hasWindStrength => capabilities.hasWindStrength;
  bool get hasGustStrength => capabilities.hasGustStrength;
  bool get hasTargetTemperature => capabilities.hasTargetTemperature;
  bool get hasSnowDepth => capabilities.hasSnowDepth;
  bool get hasSnowWeight => capabilities.hasSnowWeight;
  bool get isWeatherNow => capabilities.isWeatherNow;

  bool get hasRain1h => capabilities.hasRain1d;
  bool get hasRain3h => capabilities.hasRain1d;
  bool get hasRain6h => capabilities.hasRain1d;
  bool get hasRain12h => capabilities.hasRain1d;
  bool get hasRain1d => capabilities.hasRain1d;
  bool get hasSnow1h => capabilities.hasRain1d;
  bool get hasSnow3h => capabilities.hasRain1d;
  bool get hasSnow6h => capabilities.hasRain1d;
  bool get hasSnow12h => capabilities.hasRain1d;
  bool get hasSnow1d => capabilities.hasRain1d;
  bool get isRainForecast => capabilities.isRainForecast;
  bool get isSnowForecast => capabilities.isSnowForecast;
  bool get isWeatherForecast => capabilities.isWeatherForecast;
  bool get isTemperatureForecast => capabilities.isTemperatureForecast;

  List<Token> toTokens() => capabilities.map((e) => e.toToken(this)).toList();
}
