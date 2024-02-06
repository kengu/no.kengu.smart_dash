import 'package:freezed_annotation/freezed_annotation.dart';

part 'thermostat.freezed.dart';
part 'thermostat.g.dart';

/// The [Thermostat] contains temperature targets
@freezed
class Thermostat with _$Thermostat {
  const Thermostat._();

  const factory Thermostat({
    /// Thermostat target temperature when switched on
    double? temperatureTarget,

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

  bool get hasTarget => temperatureTarget != null;
  bool get hasMinTarget => temperatureMin != null;
  bool get hasMaxTarget => temperatureMax != null;
  bool get hasEcoTarget => temperatureEco != null;
  bool get hasComfortTarget => temperatureComfort != null;
  bool get hasEcoAdjustment => temperatureEcoAdjustment != null;
  bool get hasComfortAdjustment => temperatureComfortAdjustment != null;

  factory Thermostat.fromJson(Map<String, Object?> json) =>
      _$ThermostatFromJson(json);
}
