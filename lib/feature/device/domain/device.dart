import 'package:freezed_annotation/freezed_annotation.dart';
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

    /// Get device's measured temperature (default null)
    double? rain,

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
  }) = _Device;

  static String toTokenName(Device device, DeviceCapability e) {
    return [e.variable, device.service, 'device', device.id].join(':');
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

  static Identity fromToken(Token token) {
    final parts = token.name.split(':');
    assert(parts.length == 4, 'Token name ${token.name} is not a device');
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
  energy(
    'meter_energy',
    'This implies that the device has '
        'energy measurement capability',
    TokenType.int,
  ),

  power(
    'measure_power',
    'This implies that the device has '
        'power measurement capability',
    TokenType.int,
  ),

  voltage(
    'measure_voltage',
    'This implies that the device has '
        'voltage measurement capability',
    TokenType.int,
  ),

  onOff(
    'switch_mode',
    'This implies that the device has on/off switch capability',
    TokenType.bool,
  ),

  temperature(
    'measure_temperature',
    'This implies that the device has '
        'temperature measurement (in celsius degrees, C°) capability',
    TokenType.double,
  ),

  humidity(
    'measure_humidity',
    'This implies that the device has '
        'humidity measurement (in percent, %) capability',
    TokenType.double,
  ),

  rain(
    'measure_rain',
    'This implies that the device has '
        'rain measurement (in millimeter) capability',
    TokenType.double,
  ),

  windAngle(
    'measure_wind_angle',
    'This implies that the device has '
        'wind angle measurement (in degrees, °) capability',
    TokenType.double,
  ),

  windSpeed(
    'measure_wind_speed',
    'This implies that the device has '
        'wind strength measurement (in meters per seconds) capability',
    TokenType.double,
  ),

  gustSpeed(
    'measure_gust_speed',
    'This implies that the device has '
        'wind gust measurement (in meters per seconds) capability',
    TokenType.double,
  ),

  ultraviolet(
    'measure_ultraviolet',
    'This implies that the device has '
        'ultraviolet measurement (in UV index, UVI) capability',
    TokenType.int,
  ),

  luminance(
    'measure_luminance',
    'This implies that the device has '
        'luminance measurement (in lux) capability',
    TokenType.int,
  ),

  targetTemperature(
    'target_temperature',
    'This implies that the device has the ability to regulate temperature',
    TokenType.double,
  ),

  snowDepth(
    'measure_snow_depth',
    'This implies that the device has '
        'snow depth measurement (in cm) capability',
    TokenType.int,
  ),

  snowWeight(
    'measure_snow_weight',
    'This implies that the device has '
        'snow weight measurement (in kg) capability',
    TokenType.int,
  );

  bool get hasRain => this == rain;
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

  const DeviceCapability(this.variable, this.description, this.type);
  final TokenType type;
  final String variable;
  final String description;
}

extension DeviceCapabilityX on List<DeviceCapability> {
  bool get hasRain => any((c) => c.hasRain);
  bool get hasOnOff => any((c) => c.hasOnOff);
  bool get hasPower => any((c) => c.hasPower);
  bool get hasEnergy => any((c) => c.hasEnergy);
  bool get hasVoltage => any((c) => c.hasVoltage);
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
}

extension DeviceX on Device {
  bool get hasOnOff => capabilities.hasOnOff;
  bool get hasPower => capabilities.hasPower;
  bool get hasEnergy => capabilities.hasEnergy;
  bool get hasVoltage => capabilities.hasVoltage;
  bool get hasRain => capabilities.hasRain;
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

  List<Token> toTokens() => capabilities
      .map((e) => switch (e) {
            DeviceCapability.power => Token(
                tag: e.name,
                label: name,
                unit: TokenUnit.power,
                type: DeviceCapability.power.type,
                name: Device.toTokenName(this, e),
              ),
            DeviceCapability.energy => Token(
                tag: e.name,
                label: name,
                unit: TokenUnit.energy,
                type: DeviceCapability.energy.type,
                name: Device.toTokenName(this, e),
              ),
            DeviceCapability.voltage => Token(
                tag: e.name,
                label: name,
                unit: TokenUnit.voltage,
                type: DeviceCapability.voltage.type,
                name: Device.toTokenName(this, e),
              ),
            DeviceCapability.onOff => Token(
                tag: e.name,
                label: name,
                unit: TokenUnit.onOff,
                type: DeviceCapability.onOff.type,
                name: Device.toTokenName(this, e),
              ),
            DeviceCapability.rain => Token(
                tag: e.name,
                label: name,
                unit: TokenUnit.rain,
                type: DeviceCapability.rain.type,
                name: Device.toTokenName(this, e),
              ),
            DeviceCapability.humidity => Token(
                tag: e.name,
                label: name,
                unit: TokenUnit.humidity,
                type: DeviceCapability.humidity.type,
                name: Device.toTokenName(this, e),
              ),
            DeviceCapability.windAngle => Token(
                tag: e.name,
                label: name,
                unit: TokenUnit.windAngle,
                type: DeviceCapability.windAngle.type,
                name: Device.toTokenName(this, e),
              ),
            DeviceCapability.windSpeed => Token(
                tag: e.name,
                label: name,
                unit: TokenUnit.windSpeed,
                type: DeviceCapability.windSpeed.type,
                name: Device.toTokenName(this, e),
              ),
            DeviceCapability.gustSpeed => Token(
                tag: e.name,
                label: name,
                unit: TokenUnit.gustSpeed,
                type: DeviceCapability.gustSpeed.type,
                name: Device.toTokenName(this, e),
              ),
            DeviceCapability.luminance => Token(
                tag: e.name,
                label: name,
                unit: TokenUnit.luminance,
                type: DeviceCapability.luminance.type,
                name: Device.toTokenName(this, e),
              ),
            DeviceCapability.ultraviolet => Token(
                tag: e.name,
                label: name,
                unit: TokenUnit.ultraviolet,
                type: DeviceCapability.ultraviolet.type,
                name: Device.toTokenName(this, e),
              ),
            DeviceCapability.temperature => Token(
                tag: e.name,
                label: name,
                unit: TokenUnit.temperature,
                type: DeviceCapability.temperature.type,
                name: Device.toTokenName(this, e),
              ),
            DeviceCapability.snowDepth => Token(
                tag: e.name,
                label: name,
                unit: TokenUnit.snowDepth,
                type: DeviceCapability.snowDepth.type,
                name: Device.toTokenName(this, e),
              ),
            DeviceCapability.snowWeight => Token(
                tag: e.name,
                label: name,
                unit: TokenUnit.snowWeight,
                type: DeviceCapability.snowDepth.type,
                name: Device.toTokenName(this, e),
              ),
            DeviceCapability.targetTemperature => Token(
                tag: e.name,
                label: name,
                unit: TokenUnit.temperature,
                type: DeviceCapability.targetTemperature.type,
                name: Device.toTokenName(this, e),
              ),
          })
      .toList();
}
