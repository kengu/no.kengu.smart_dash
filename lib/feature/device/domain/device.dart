import 'package:freezed_annotation/freezed_annotation.dart';
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

  /// Detector (on/off)
  detector,

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
    double? temperature,

    /// Get the device's electric state information (default null)
    ElectricState? electric,

    /// Get the device's switch state information (default null)
    SwitchState? onOff,

    /// Get the device's thermostat information (default null)
    Thermostat? thermostat,
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
    'This implies that the device has power measurement capability',
    TokenType.int,
  ),

  power(
    'measure_power',
    'This implies that the device has power measurement capability',
    TokenType.int,
  ),

  voltage(
    'measure_voltage',
    'This implies that the device has voltage measurement capability',
    TokenType.int,
  ),

  onOff(
    'switch_mode',
    'This implies that the device has on/off switch capability',
    TokenType.bool,
  ),

  temperature(
    'measure_temperature',
    'This implies that the device has temperature measurement capability',
    TokenType.double,
  ),

  targetTemperature(
    'target_temperature',
    'This implies that the device has the ability to regulate temperature',
    TokenType.double,
  );

  bool get hasOnOff => this == onOff;
  bool get hasPower => this == power;
  bool get hasEnergy => this == energy;
  bool get hasVoltage => this == voltage;
  bool get hasTemperature => this == temperature;
  bool get hasTargetTemperature => this == DeviceCapability.targetTemperature;

  const DeviceCapability(this.variable, this.description, this.type);
  final TokenType type;
  final String variable;
  final String description;
}

extension DeviceCapabilityX on List<DeviceCapability> {
  bool get hasOnOff => any((c) => c.hasOnOff);
  bool get hasPower => any((c) => c.hasPower);
  bool get hasEnergy => any((c) => c.hasEnergy);
  bool get hasVoltage => any((c) => c.hasVoltage);
  bool get hasTemperature => any((c) => c.hasTemperature);
  bool get hasTargetTemperature => any((c) => c.hasTargetTemperature);
}

extension DeviceX on Device {
  bool get hasOnOff => capabilities.hasOnOff;
  bool get hasPower => capabilities.hasPower;
  bool get hasEnergy => capabilities.hasEnergy;
  bool get hasVoltage => capabilities.hasVoltage;
  bool get hasTemperature => capabilities.hasTemperature;
  bool get hasTargetTemperature => capabilities.hasTargetTemperature;

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
            DeviceCapability.temperature => Token(
                tag: e.name,
                label: name,
                unit: TokenUnit.temperature,
                type: DeviceCapability.temperature.type,
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
