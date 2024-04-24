import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/feature/device/domain/device_definition.dart';
import 'package:smart_dash/feature/device/domain/thermostat.dart';
import 'package:smart_dash/feature/flow/domain/token.dart';

import 'electric_state.dart';
import 'switch_state.dart';

export 'package:smart_dash/feature/device/domain/electric_state.dart';
export 'package:smart_dash/feature/device/domain/thermostat.dart';
export 'package:smart_dash/feature/flow/domain/token.dart';

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
    required List<DeviceCapability> capabilities,

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

  static String toTokenName(Device device, DeviceCapability e) {
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

/// Copied from https://apps-sdk-v3.developer.homey.app/tutorial-device-capabilities.html
/// TODO: Make my own capability definitions
enum DeviceCapability {
  value(
    'value',
    'This implies that the device has value capability',
    TokenUnit.value,
    TokenType.int,
  ),

  energy(
    'meter_energy',
    'This implies that the device has '
        'energy measurement capability',
    TokenUnit.energy,
    TokenType.int,
  ),

  power(
    'measure_power',
    'This implies that the device has '
        'power measurement capability',
    TokenUnit.power,
    TokenType.int,
  ),

  voltage(
    'measure_voltage',
    'This implies that the device has '
        'voltage measurement capability',
    TokenUnit.voltage,
    TokenType.int,
  ),

  onOff(
    'switch_mode',
    'This implies that the device has on/off switch capability',
    TokenUnit.onOff,
    TokenType.bool,
  ),

  targetTemperature(
    'target_temperature',
    'This implies that the device has the ability to regulate temperature',
    TokenUnit.temperature,
    TokenType.double,
  ),

  temperature(
    'measure_temperature',
    'This implies that the device has '
        'temperature measurement (in celsius degrees, C°) capability',
    TokenUnit.temperature,
    TokenType.double,
  ),

  humidity(
    'measure_humidity',
    'This implies that the device has '
        'humidity measurement (in percent, %) capability',
    TokenUnit.humidity,
    TokenType.double,
  ),

  rain(
    'measure_rain',
    'This implies that the device has '
        'rain measurement (in millimeter) capability',
    TokenUnit.rain,
    TokenType.double,
  ),

  rainRate(
    'measure_rain_rate',
    'This implies that the device has '
        'rain rate measurement (in millimeter per hour) capability',
    TokenUnit.rainRate,
    TokenType.double,
  ),

  rainTotal(
    'measure_rain_total',
    'This implies that the device has '
        'rain total measurement (in millimeter) capability',
    TokenUnit.rainTotal,
    TokenType.double,
  ),

  windAngle(
    'measure_wind_angle',
    'This implies that the device has '
        'wind angle measurement (in degrees, °) capability',
    TokenUnit.windAngle,
    TokenType.double,
  ),

  windSpeed(
    'measure_wind_speed',
    'This implies that the device has '
        'wind strength measurement (in meters per seconds) capability',
    TokenUnit.windSpeed,
    TokenType.double,
  ),

  gustSpeed(
    'measure_gust_speed',
    'This implies that the device has '
        'wind gust measurement (in meters per seconds) capability',
    TokenUnit.gustSpeed,
    TokenType.double,
  ),

  ultraviolet(
    'measure_ultraviolet',
    'This implies that the device has '
        'ultraviolet measurement (in UV index, UVI) capability',
    TokenUnit.ultraviolet,
    TokenType.int,
  ),

  luminance(
    'measure_luminance',
    'This implies that the device has '
        'luminance measurement (in lux) capability',
    TokenUnit.luminance,
    TokenType.int,
  ),

  snowDepth(
    'measure_snow_depth',
    'This implies that the device has '
        'snow depth measurement (in cm) capability',
    TokenUnit.snowDepth,
    TokenType.int,
  ),

  snowWeight(
    'measure_snow_weight',
    'This implies that the device has '
        'snow weight measurement (in kg) capability',
    TokenUnit.snowWeight,
    TokenType.int,
  ),

  // =====================
  // Forecast capabilities
  // =====================

  temperature1h(
    'measure_temperature',
    'This implies that the device has temperature '
        'forecast (in celsius degrees, C°) next 1h capability',
    TokenUnit.temperature,
    TokenType.double,
  ),

  temperature3h(
    'measure_temperature',
    'This implies that the device has temperature '
        'forecast (in celsius degrees, C°) in 3h capability',
    TokenUnit.temperature,
    TokenType.double,
  ),

  temperature6h(
    'measure_temperature',
    'This implies that the device has temperature '
        'forecast (in celsius degrees, C°) in 6h capability',
    TokenUnit.temperature,
    TokenType.double,
  ),

  temperature12h(
    'measure_temperature',
    'This implies that the device has temperature '
        'forecast (in celsius degrees, C°) in 12h capability',
    TokenUnit.temperature,
    TokenType.double,
  ),

  temperature1d(
    'measure_temperature',
    'This implies that the device has temperature '
        'forecast (in celsius degrees, C°) in 1d capability',
    TokenUnit.temperature,
    TokenType.double,
  ),

  rain1h(
    'forecast_rain_1h',
    'This implies that the device has precipitation as '
        'rain forecast (in millimeter) next 1h capability',
    TokenUnit.rain,
    TokenType.double,
  ),

  rain3h(
    'forecast_rain_3h',
    'This implies that the device has precipitation as '
        'rain forecast (in millimeter) next 3h capability',
    TokenUnit.rain,
    TokenType.double,
  ),

  rain6h(
    'forecast_rain_6h',
    'This implies that the device has precipitation as '
        'rain forecast (in millimeter) next 6h capability',
    TokenUnit.rain,
    TokenType.double,
  ),

  rain12h(
    'forecast_rain_12h',
    'This implies that the device has precipitation as '
        'rain forecast (in millimeter) next 12h capability',
    TokenUnit.rain,
    TokenType.double,
  ),

  rain1d(
    'forecast_rain_1d',
    'This implies that the device has precipitation as '
        'rain forecast (in millimeter) next 1d capability',
    TokenUnit.rain,
    TokenType.double,
  ),

  snow1h(
    'forecast_snow_1h',
    'This implies that the device has precipitation as '
        'snow forecast (in cm) next 1h capability',
    TokenUnit.snow,
    TokenType.double,
  ),

  snow3h(
    'forecast_snow_3h',
    'This implies that the device has precipitation as '
        'snow forecast (in cm) next 3h capability',
    TokenUnit.snow,
    TokenType.double,
  ),

  snow6h(
    'forecast_snow_6h',
    'This implies that the device has precipitation as '
        'snow forecast (in cm) next 6h capability',
    TokenUnit.snow,
    TokenType.double,
  ),

  snow12h(
    'forecast_snow_12h',
    'This implies that the device has precipitation as '
        'snow forecast (in cm) next 12h capability',
    TokenUnit.snow,
    TokenType.double,
  ),

  snow1d(
    'forecast_snow_1d',
    'This implies that the device has precipitation as '
        'snow forecast (in cm) next 1d capability',
    TokenUnit.snow,
    TokenType.double,
  );

  // Measure capabilities
  bool get hasRain => this == rain;
  bool get hasRainRate => this == rainRate;
  bool get hasRainTotal => this == rainTotal;
  bool get hasOnOff => this == onOff;
  bool get hasPower => this == power;
  bool get hasEnergy => this == energy;
  bool get hasVoltage => this == voltage;
  bool get hasHumidity => this == humidity;
  bool get hasLuminance => this == luminance;
  bool get hasWindAngle => this == windAngle;
  bool get hasWindStrength => this == windSpeed;
  bool get hasGustStrength => this == gustSpeed;
  bool get hasUltraviolet => this == ultraviolet;
  bool get hasTemperature => this == temperature;
  bool get hasTargetTemperature => this == targetTemperature;
  bool get hasSnowDepth => this == snowDepth;
  bool get hasSnowWeight => this == snowWeight;

  // Forecast capabilities
  bool get hasRain1h => this == rain1h;
  bool get hasRain3h => this == rain3h;
  bool get hasRain6h => this == rain6h;
  bool get hasRain12h => this == rain12h;
  bool get hasRain1d => this == rain1d;
  bool get hasSnow1h => this == snow1h;
  bool get hasSnow3h => this == snow3h;
  bool get hasSnow6h => this == snow6h;
  bool get hasSnow12h => this == snow12h;
  bool get hasSnow1d => this == snow1d;
  bool get hasTemperature1h => this == temperature1h;
  bool get hasTemperature3h => this == temperature3h;
  bool get hasTemperature6h => this == temperature6h;
  bool get hasTemperature12h => this == temperature12h;
  bool get hasTemperature1d => this == temperature1d;

  Token toToken(Device device) {
    return Token(
      tag: name,
      capability: this,
      label: device.name,
      name: Device.toTokenName(device, this),
    );
  }

  const DeviceCapability(this.variable, this.description, this.unit, this.type);

  final TokenType type;
  final TokenUnit unit;
  final String variable;
  final String description;

  static Optional<DeviceCapability> of(String name) =>
      values.firstWhereOptional((e) => e.name == name);
}

extension DeviceCapabilityX on List<DeviceCapability> {
  bool get hasOnOff => any((c) => c.hasOnOff);
  bool get hasPower => any((c) => c.hasPower);
  bool get hasEnergy => any((c) => c.hasEnergy);
  bool get hasVoltage => any((c) => c.hasVoltage);
  bool get hasRain => any((c) => c.hasRain);
  bool get hasRainRate => any((c) => c.hasRainRate);
  bool get hasRainTotal => any((c) => c.hasRainTotal);
  bool get hasHumidity => any((c) => c.hasHumidity);
  bool get hasWindAngle => any((c) => c.hasWindAngle);
  bool get hasLuminance => any((c) => c.hasLuminance);
  bool get hasUltraviolet => any((c) => c.hasUltraviolet);
  bool get hasTemperature => any((c) => c.hasTemperature);
  bool get hasWindStrength => any((c) => c.hasWindStrength);
  bool get hasGustStrength => any((c) => c.hasGustStrength);
  bool get hasTargetTemperature => any((c) => c.hasTargetTemperature);
  bool get hasSnowDepth => any((c) => c.hasSnowDepth);
  bool get hasSnowWeight => any((c) => c.hasSnowWeight);

  // Forecasts
  bool get hasRain1h => any((c) => c.hasRain1h);
  bool get hasRain3h => any((c) => c.hasRain3h);
  bool get hasRain6h => any((c) => c.hasRain6h);
  bool get hasRain12h => any((c) => c.hasRain12h);
  bool get hasRain1d => any((c) => c.hasRain1d);
  bool get hasSnow1h => any((c) => c.hasSnow1h);
  bool get hasSnow3h => any((c) => c.hasSnow3h);
  bool get hasSnow6h => any((c) => c.hasSnow6h);
  bool get hasSnow12h => any((c) => c.hasSnow12h);
  bool get hasSnow1d => any((c) => c.hasSnow1d);
  bool get hasTemperature1h => any((c) => c.hasTemperature1d);
  bool get hasTemperature3h => any((c) => c.hasTemperature1d);
  bool get hasTemperature6h => any((c) => c.hasTemperature1d);
  bool get hasTemperature12h => any((c) => c.hasTemperature1d);
  bool get hasTemperature1d => any((c) => c.hasTemperature1d);

  bool get isWeatherNow => any(
        (c) => const [
          DeviceCapability.rain,
          DeviceCapability.temperature,
          DeviceCapability.windSpeed,
          DeviceCapability.windAngle,
          DeviceCapability.gustSpeed,
          DeviceCapability.humidity,
          DeviceCapability.luminance,
          DeviceCapability.ultraviolet,
        ].contains(c),
      );

  bool get isWeatherForecast =>
      isRainForecast || isSnowForecast || isTemperatureForecast;

  bool get isRainForecast => any(
        (c) => const [
          DeviceCapability.rain1h,
          DeviceCapability.rain3h,
          DeviceCapability.rain6h,
          DeviceCapability.rain12h,
          DeviceCapability.rain1d,
        ].contains(c),
      );

  bool get isSnowForecast => any(
        (c) => const [
          DeviceCapability.snow1h,
          DeviceCapability.snow3h,
          DeviceCapability.snow6h,
          DeviceCapability.snow12h,
          DeviceCapability.snow1d,
        ].contains(c),
      );

  bool get isTemperatureForecast => any(
        (c) => const [
          DeviceCapability.temperature1h,
          DeviceCapability.temperature3h,
          DeviceCapability.temperature6h,
          DeviceCapability.temperature12h,
          DeviceCapability.temperature1d,
        ].contains(c),
      );
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
