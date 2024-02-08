import 'package:freezed_annotation/freezed_annotation.dart';

import 'device.dart';
import 'switch_state.dart';

part 'thermostat.freezed.dart';
part 'thermostat.g.dart';

/// The [Thermostat] contains temperature targets
@freezed
class Thermostat with _$Thermostat {
  const Thermostat._();

  const factory Thermostat({
    /// Minimum allowed temperature (default null)
    double? temperatureMin,

    /// Maximum allowed temperature (default null)
    double? temperatureMax,

    /// Thermostat target temperature in [SwitchMode.eco]
    double? temperatureEco,

    /// Thermostat target temperature in [SwitchMode.comfort]
    double? temperatureComfort,

    /// The amount of temperature adjustment applied to
    /// [temperatureEco] when regulated
    double? temperatureEcoAdjustment,

    /// The amount of temperature adjustment applied to
    /// [temperatureComfort] when regulated
    double? temperatureComfortAdjustment,

    /// [DateTime] timestamp of when data was updated last
    required DateTime lastUpdated,
  }) = _Thermostat;

  bool get hasMinTarget => temperatureMin != null;
  bool get hasMaxTarget => temperatureMax != null;
  bool get hasEcoTarget => temperatureEco != null;
  bool get hasComfortTarget => temperatureComfort != null;
  bool get hasEcoAdjustment => temperatureEcoAdjustment != null;
  bool get hasComfortAdjustment => temperatureComfortAdjustment != null;

  double getTarget(SwitchMode mode, [double defaultTarget = 0.0]) =>
      switch (mode) {
        SwitchMode.off => defaultTarget,
        SwitchMode.eco => temperatureEco,
        SwitchMode.antiFreeze => temperatureEco,
        SwitchMode.on => temperatureComfort,
        SwitchMode.comfort => temperatureComfort,
      } ??
      defaultTarget;

  Thermostat setTarget(SwitchMode mode, double? target) => switch (mode) {
        SwitchMode.off => copyWith(temperatureEco: target),
        SwitchMode.eco => copyWith(temperatureEco: target),
        SwitchMode.antiFreeze => copyWith(temperatureEco: target),
        SwitchMode.on => copyWith(temperatureComfort: target),
        SwitchMode.comfort => copyWith(temperatureComfort: target),
      };

  factory Thermostat.fromJson(Map<String, Object?> json) =>
      _$ThermostatFromJson(json);
}

extension ThermostatX on Device {
  /// Get target temperature.
  double? getTargetTemperature() {
    if (!hasTargetTemperature) return null;
    return thermostat?.getTarget(onOff!.mode);
  }

  /// Set target temperature.
  Device setTargetTemperature(double newValue) {
    if (!hasTargetTemperature) return this;
    return copyWith(
      thermostat: thermostat!.setTarget(
        onOff!.mode,
        newValue,
      ),
    );
  }
}
