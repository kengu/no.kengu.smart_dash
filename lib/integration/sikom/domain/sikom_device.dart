import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/feature/device/domain/device_definition.dart';
import 'package:smart_dash/feature/device/domain/energy_summary.dart';
import 'package:smart_dash/integration/sikom/domain/sikom_property.dart';
import 'package:smart_dash/integration/sikom/sikom.dart';

part 'sikom_device.freezed.dart';
part 'sikom_device.g.dart';

/// Supported Sikom Device types
enum SikomDeviceType {
  /// Any supported sikom device type
  any(''),

  /// Sikom controller (gateway)
  controller('Controller'),

  /// Sikom astro tri-state switch (off/on/auto)
  astroSwitch('AstroSwitch'),

  /// Sikom wireless thermostat
  thermostat('Thermostat'),

  /// Sikom wireless smoke detector (on/off)
  detector('Detector'),

  /// Sikom energy controller
  ecoEnergyController('ECOAMS'),

  /// Sikom power relay
  onOffRelay('OnOffRelay'),

  /// Sikom device group (max eight devices)
  group('Group'),

  /// Sikom program (week schedule for device/group)
  program('Program'),

  /// Device unknown to SmartDash
  unknown('');

  const SikomDeviceType(this.name);

  final String name;

  bool get isAny => this == any;

  /// Get [SikomDeviceType] from [SikomDeviceProperties.deviceType] OR [SikomDeviceProperties.vendorType]
  static fromNativeType(String name) => switch (name) {
        'Controller' => SikomDeviceType.controller,
        'AstroSwitch' => SikomDeviceType.astroSwitch,
        'Thermostat' => SikomDeviceType.thermostat,
        'Detector' => SikomDeviceType.detector,
        'ECOAMS' => SikomDeviceType.ecoEnergyController,
        'OnOffRelay' => SikomDeviceType.onOffRelay,
        'Group' => SikomDeviceType.group,
        'Program' => SikomDeviceType.program,
        _ => SikomDeviceType.unknown
      };

  static SikomDeviceType fromDeviceType(DeviceType type) => switch (type) {
        DeviceType.any => SikomDeviceType.any,
        DeviceType.controller => SikomDeviceType.controller,
        DeviceType.astroSwitch => SikomDeviceType.astroSwitch,
        DeviceType.thermostat => SikomDeviceType.thermostat,
        DeviceType.detector => SikomDeviceType.detector,
        DeviceType.energyController => SikomDeviceType.ecoEnergyController,
        DeviceType.onOffRelay => SikomDeviceType.onOffRelay,
        DeviceType.group => SikomDeviceType.group,
        DeviceType.program => SikomDeviceType.program,
        _ => SikomDeviceType.unknown
      };

  DeviceType toDeviceType() => switch (this) {
        SikomDeviceType.any => DeviceType.any,
        SikomDeviceType.controller => DeviceType.controller,
        SikomDeviceType.astroSwitch => DeviceType.astroSwitch,
        SikomDeviceType.thermostat => DeviceType.thermostat,
        SikomDeviceType.detector => DeviceType.detector,
        SikomDeviceType.ecoEnergyController => DeviceType.energyController,
        SikomDeviceType.onOffRelay => DeviceType.onOffRelay,
        SikomDeviceType.group => DeviceType.group,
        SikomDeviceType.program => DeviceType.program,
        _ => DeviceType.unknown,
      };
}

/// The [SikomDevice] class is a representation of
/// a gateway between a group of Sikom devices and
/// Sikom API.
@freezed
class SikomDevice with _$SikomDevice, DeviceMapper {
  const SikomDevice._();
  const factory SikomDevice({
    @JsonKey(name: 'Properties') required SikomDeviceProperties properties,
  }) = _SikomDevice;

  /// Get device's  id
  String get id => properties.id;

  /// Get device's readable name
  String get name => properties.name;

  /// Get device's type
  SikomDeviceType get type => properties.type;

  /// Get device's model name
  String get model => properties.model;

  /// Check if device is real
  bool get isReal => properties.dummy == null;

  /// Get voltage (-1 if not found)
  int get voltage => toInt(properties.powerVoltage, -1);

  @override
  Device toDevice() => Device(
        data: toJson(),
        id: properties.id,
        service: Sikom.key,
        name: properties.name,
        type: properties.type.toDeviceType(),
        voltage: voltage,
        energy: toEnergy(),
        temperature: properties.temperature?.toInt(),
        lastUpdated: properties.lastUpdated.isPresent
            ? properties.lastUpdated.value
            : DateTime.now(),
        capabilities: [
          if (properties.hasPower) DeviceCapabilities.power,
          if (properties.hasEnergy) DeviceCapabilities.energy,
          if (properties.hasVoltage) DeviceCapabilities.voltage,
          if (properties.hasTemperature) DeviceCapabilities.temperature,
        ],
      );

  DeviceDefinition toDeviceDefinition() => DeviceDefinition(
        type: type.toDeviceType(),
        name: Sikom.readableModelName[type] ?? model,
      );

  EnergySummary? toEnergy() => hasEnergy
      ? EnergySummary(
          cumulative: toInt(properties.cumulativeEnergy, -1),
          currentPower: toInt(properties.currentPowerUsage, -1),
          cumulativeToday: toInt(properties.cumulativeEnergyToday, -1),
          lastUpdated: properties.lastUpdated.isPresent
              ? properties.lastUpdated.value
              : DateTime.now(),
        )
      : null;

  /// Check if device reports current power usage
  bool get hasPower => properties.hasPower;

  /// Check if device reports cumulative energy usage
  bool get hasEnergy => properties.hasEnergy;

  /// Check if device reports power voltage
  bool get hasVoltage => properties.hasVoltage;

  /// Check if device reports temperature
  bool get hasTemperature => properties.hasTemperature;

  static int toInt(SikomProperty? property, [int undefined = 0]) =>
      property == null ? undefined : int.tryParse(property.value) ?? undefined;

  static double toDouble(SikomProperty? property, [double undefined = 0]) =>
      property == null
          ? undefined
          : double.tryParse(property.value) ?? undefined;

  factory SikomDevice.fromJson(Map<String, Object?> json) =>
      _$SikomDeviceFromJson(json);
}

/// The [SikomDeviceProperties] class is a
/// representation of a Sikom gateway controller properties.
@freezed
class SikomDeviceProperties with _$SikomDeviceProperties {
  const SikomDeviceProperties._();
  const factory SikomDeviceProperties({
    @JsonKey(name: 'vendor_type') required SikomProperty vendorType,
    @JsonKey(name: 'best_effort_name') required SikomProperty bestEffortName,
    @JsonKey(name: 'latest_update_from_device')
    SikomProperty? latestUpdateFromDevice,
    @JsonKey(name: 'push_update_interval_minutes')
    SikomProperty? pushUpdateIntervalMinutes,
    @JsonKey(name: 'dummy') SikomProperty? dummy,
    @JsonKey(name: 'connection') SikomProperty? connection,
    @JsonKey(name: 'gprsNetname') SikomProperty? gprsNetname,
    @JsonKey(name: 'product_code') SikomProperty? productCode,
    @JsonKey(name: 'model_name') SikomProperty? modelName,
    @JsonKey(name: 'device_type') SikomProperty? deviceType,
    @JsonKey(name: 'device_model') SikomProperty? deviceModel,
    @JsonKey(name: 'user_defined_name') SikomProperty? userDefinedName,
    @JsonKey(name: 'device_model_readable') SikomProperty? deviceModelReadable,
    @JsonKey(name: 'vendor_and_device_model_readable')
    SikomProperty? vendorAndDeviceModelReadable,
    // DO NOT USE 'ams_current_power_usage', it is quite "random"
    // since only given each minute according to Sikom. Use 'ams_iap_slp_avg'
    // (Average Imported Active Power since last push) instead.
    @JsonKey(name: 'ams_iap_slp_avg') SikomProperty? currentPowerUsage,
    // This is the most frequently updated total meter reading in [Wh]
    // consisting of the "official" value 'ams_cumulative_imported_energy'
    // (active energy) from the meter itself (updated every hour)"
    @JsonKey(name: 'ams_cumulative_plus_calculated_energy')
    SikomProperty? cumulativeEnergy,
    @JsonKey(name: 'ams_cumulative_plus_calculated_energy_today')
    SikomProperty? cumulativeEnergyToday,
    @JsonKey(name: 'ams_power_voltage') SikomProperty? powerVoltage,
    // Commanded mode of a switch. May differ from switch_state (actual relay-state) for instance
    // when under thermostat control. Now how (for thermostats) a value of 0 does not have a single meaning
    // (it may mean either "eco", "anti_freeze" and "off"). A value of 1 on the other hand is usually precise
    // (Meaning "on" if dumb switch and "comfort" if thermostat). Note that for products like
    // "ProductCode.CTMmTouchOne" this value should be ignored (considered irrelevant) when
    // "DeviceProperty.switch_thermostat_active" is 0. Same issues with "ProductCode.CTMmTouchDim"
    // and percent level == 99. See also "DeviceProperty.switch_reduction_mode" which explains (in plain text)
    // what is the precise meaning of 0 and 1.
    @JsonKey(name: 'switch_mode') SikomProperty? switchMode,
    // Human-readable text explaining current "DeviceProperty.switch_mode" (off, eco, comfort, etc.)
    @JsonKey(name: 'switch_readable_mode') SikomProperty? switchReadableMode,
    // The actual relay state of the switch (on / off)
    @JsonKey(name: 'switch_state') SikomProperty? switchState,
    // The precise meaning of values 0 and 1 in "DeviceProperty.switch_mode".
    @JsonKey(name: 'switch_reduction_mode') SikomProperty? switchReductionMode,
    // Eco / comfort active or not. If 0 then switch_mode 0 will usually mean "off" or "anti_freeze"
    // and 1 will not have any meaning. If 1 then switch_mode 0 will mean "eco" and 1 will mean "comfort".
    // Not relevant to set for some kind of thermostats (for instance SI-3, SI-4 or CTM mTouch One).
    // Not desired to set for other thermostats (because of danger of freezing water for instance).
    @JsonKey(name: 'switch_thermostat_active')
    SikomProperty? switchThermostatActive,
    // Air temperature (inside). Note that will always be the most important temperature (the one used for controlling)
    // while "DeviceProperty.temperature_2" will be the secondary temperature. This is (pr Feb 2019) only relevant for
    // "ProductCode.CTMmTouchOne" which can control based on either air or floor-temperature.
    @JsonKey(name: 'temperature') SikomProperty? temperature,
    // Maximum allowed temperature (at or above this value will result in temperature_notification_triggered).
    @JsonKey(name: 'temperature_min') SikomProperty? temperatureMin,
    // Minimum allowed temperature (at or below this value will result in temperature_notification_triggered).
    @JsonKey(name: 'temperature_max') SikomProperty? temperatureMax,
    // Thermostat temperature in switch_mode 'eco'
    @JsonKey(name: 'temperature_eco') SikomProperty? temperatureEco,
    // (prlsa = PowerRegulatorListenerSilentAdjustment). Number of degrees Celsius that the PowerRegulatorListener
    // has silently adjusted the temperature in the background. (As of Feb 2019 will always be a negative value,
    // that is, adjustment is done by lowering the temperature. But, in principle we might also adjust the temperature
    // upwards, for instance heating the house extra before morning, in order for the thermostats to turn off in the
    // morning). While silent adjustment is in force, temperature_eco / temperature_comfort will be adjusted with this
    // value, keeping the fact of a adjustment "hidden" from BPAPI-user only relating to temperature_eco /
    // temperature_comfort.
    @JsonKey(name: 'temperature_eco_prlsa')
    SikomProperty? temperatureEcoAdjustment,
    // Thermostat temperature in switch_mode 'comfort'
    @JsonKey(name: 'temperature_comfort') SikomProperty? temperatureComfort,
    // (prlsa = PowerRegulatorListenerSilentAdjustment). Number of degrees Celsius that the PowerRegulatorListener
    // has silently adjusted the temperature in the background. (As of Feb 2019 will always be a negative value,
    // that is, adjustment is done by lowering the temperature. But, in principle we might also adjust the temperature
    // upwards, for instance heating the house extra before morning, in order for the thermostats to turn off in the
    // morning). While silent adjustment is in force, temperature_eco / temperature_comfort will be adjusted with this
    // value, keeping the fact of a adjustment "hidden" from BPAPI-user only relating to temperature_eco /
    // temperature_comfort.
    @JsonKey(name: 'temperature_comfort_prlsa')
    SikomProperty? temperatureComfortAdjustment,
    // Tells whether the device is currently being regulated
    // or not (0 = not regulated 1 = import regulated 2 = export regulated)
    @JsonKey(name: 'ams_regulated_state') SikomProperty? regulatedState,
    // The power (in W) that this device releases when regulated out, as estimated by
    // the system itself, compared to when regulated in (raw value, no PWM or other partial
    // regulation scheme accounted for). Will be a negative value (representing the power
    // "added" when the device is regulated out. Only relevant to set for devices which have
    // switch_mode (and when an ECOEnergyController is installed)
    @JsonKey(name: 'ams_regulation_priority') SikomProperty? regulationPriority,
    @JsonKey(name: 'estimated_reg_power')
    SikomProperty? estimatedRegulatedPower,
    // The power (in W) that this device draws when unregulated, as estimated by the system itself,
    // compared to when regulated out (raw value, no PWM or other partial regulation scheme accounted for).
    // Will be a positive value. Only relevant to set for devices which have
    // switch_mode (and when an ECOEnergyController)
    @JsonKey(name: 'estimated_unreg_power')
    SikomProperty? estimatedUnregulatedPower,
  }) = _SikomDeviceProperties;

  /// Get device id
  String get id => '${vendorType.deviceId}';

  /// Get human-readable device name
  String get name => (userDefinedName ?? bestEffortName).value;

  /// Get device type name
  SikomDeviceType get type => SikomDeviceType.fromNativeType(
      (deviceType ?? productCode ?? vendorType).value);

  /// Get device model name
  String get model => (deviceModelReadable ??
          deviceModel ??
          deviceType ??
          productCode ??
          vendorType)
      .value;

  /// Check if device reports current power usage
  bool get hasPower => currentPowerUsage != null;

  /// Check if device reports cumulative energy usage
  bool get hasEnergy => cumulativeEnergy != null;

  /// Check if device reports power voltage
  bool get hasVoltage => powerVoltage != null;

  /// Check if device reports temperature voltage
  bool get hasTemperature => temperature != null;

  /// Parse [DateTime] from [latestUpdateFromDevice]
  Optional<DateTime> get lastUpdated => Optional.ofNullable(
        latestUpdateFromDevice != null
            ? DateTime.tryParse(latestUpdateFromDevice!.value)
            : null,
      );
  factory SikomDeviceProperties.fromJson(Map<String, Object?> json) =>
      _$SikomDevicePropertiesFromJson(json);
}
