import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/feature/device/domain/energy_summary.dart';
import 'package:smart_dash/integration/sikom/domain/sikom_property.dart';

part 'sikom_device.freezed.dart';
part 'sikom_device.g.dart';

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
  String get type => properties.type;

  /// Get device's model name
  String get model => properties.model;

  /// Check if device is real
  bool get isReal => properties.dummy == null;

  /// Check if device is real
  int get voltage => toInt(properties.powerVoltage, -1);

  @override
  Device toDevice() => Device(
        data: toJson(),
        id: properties.id,
        type: properties.type,
        name: properties.name,
        voltage: voltage,
        energy: toEnergy(),
        lastUpdated: properties.lastUpdated.isPresent
            ? properties.lastUpdated.value
            : DateTime.now(),
        capabilities: [
          if (properties.hasPower) DeviceCapabilities.power,
          if (properties.hasEnergy) DeviceCapabilities.energy,
          if (properties.hasVoltage) DeviceCapabilities.voltage,
        ],
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
  }) = _SikomDeviceProperties;

  /// Get device id
  String get id => '${vendorType.deviceId}';

  /// Get human-readable device name
  String get name => (userDefinedName ?? bestEffortName).value;

  /// Get human-readable gateway device name
  String get type => (deviceModel ?? productCode ?? vendorType).value;

  /// Get human-readable gateway device name
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

  /// Parse [DateTime] from [latestUpdateFromDevice]
  Optional<DateTime> get lastUpdated => Optional.ofNullable(
        latestUpdateFromDevice != null
            ? DateTime.tryParse(latestUpdateFromDevice!.value)
            : null,
      );
  factory SikomDeviceProperties.fromJson(Map<String, Object?> json) =>
      _$SikomDevicePropertiesFromJson(json);
}
