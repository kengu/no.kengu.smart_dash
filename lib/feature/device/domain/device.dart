import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dash/feature/device/domain/energy_summary.dart';
import 'package:smart_dash/feature/flow/domain/token.dart';

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

    /// Get device's measured voltage (default null)
    int? voltage,

    /// Get device's measured temperature (default null)
    int? temperature,

    /// Get the device's energy consumption (default null)
    EnergySummary? energy,
  }) = _Device;

  bool get hasPower => capabilities.hasPower;
  bool get hasEnergy => capabilities.hasEnergy;
  bool get hasVoltage => capabilities.hasVoltage;
  bool get hasTemperature => capabilities.hasTemperature;

  List<Token> toTokens() => capabilities
      .map((e) => switch (e) {
            DeviceCapability.power => Token(
                tag: e.name,
                label: name,
                type: TokenType.int,
                name: _toTokenName(e),
                unit: TokenUnit.power,
              ),
            DeviceCapability.energy => Token(
                tag: e.name,
                label: name,
                type: TokenType.int,
                name: _toTokenName(e),
                unit: TokenUnit.energy,
              ),
            DeviceCapability.voltage => Token(
                tag: e.name,
                label: name,
                type: TokenType.int,
                name: _toTokenName(e),
                unit: TokenUnit.voltage,
              ),
            DeviceCapability.temperature => Token(
                tag: e.name,
                label: name,
                type: TokenType.int,
                name: _toTokenName(e),
                unit: TokenUnit.temperature,
              ),
          })
      .toList();

  String _toTokenName(DeviceCapability e) =>
      [e.variable, service, 'Device', id].join(':');

  factory Device.fromJson(Map<String, Object?> json) => _$DeviceFromJson(json);
}

mixin DeviceMapper {
  Device toDevice();
  Map<String, Object?> toJson();
}

extension DeviceCapabilityX on List<DeviceCapability> {
  bool get hasPower => any((c) => c.hasPower);
  bool get hasEnergy => any((c) => c.hasEnergy);
  bool get hasVoltage => any((c) => c.hasVoltage);
  bool get hasTemperature => any((c) => c.hasTemperature);
}

/// Copied from https://apps-sdk-v3.developer.homey.app/tutorial-device-capabilities.html
/// TODO: Make my own capability definitions
enum DeviceCapability {
  energy(
    'meter_energy',
    'This flag implies that the device has power measurement capability',
  ),
  power(
    'measure_power',
    'This flag implies that the device has power measurement capability',
  ),

  voltage(
    'measure_voltage',
    'This flag implies that the device has voltage measurement capability',
  ),

  temperature(
    'measure_temperature',
    'This flag implies that the device has temperature measurement capability',
  );

  bool get hasPower => this == power;
  bool get hasEnergy => this == energy;
  bool get hasVoltage => this == voltage;
  bool get hasTemperature => this == temperature;

  const DeviceCapability(this.variable, this.description);
  final String variable;
  final String description;
}
