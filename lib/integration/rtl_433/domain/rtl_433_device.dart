import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/feature/device/domain/device_definition.dart';
import 'package:smart_dash/integration/rtl_433/rtl_433.dart';

part 'rtl_433_device.freezed.dart';
part 'rtl_433_device.g.dart';

/// Supported Rtl433 Device types
enum Rtl433DeviceType {
  /// Any supported Rtl433 Device type
  any(''),

  sensor('Sensor'),

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

  static Rtl433DeviceType fromNativeType(String name) => switch (name) {
        'Cotech-367959' => Rtl433DeviceType.sensor,
        _ => Rtl433DeviceType.unknown
      };

  static Rtl433DeviceType fromDeviceType(DeviceType type) => switch (type) {
        DeviceType.any => Rtl433DeviceType.any,
        DeviceType.sensor => Rtl433DeviceType.sensor,
        _ => Rtl433DeviceType.unknown
      };

  DeviceType toDeviceType() => switch (this) {
        Rtl433DeviceType.any => DeviceType.any,
        Rtl433DeviceType.sensor => DeviceType.sensor,
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
    @JsonKey(name: 'wind_dir_deg') double? windDirectionDegrees,
    @JsonKey(name: 'wind_avg_m_s') double? windAverageMeterPerSeconds,
    @JsonKey(name: 'wind_avg_km_h') double? indAverageKilometerPerHour,
    @JsonKey(name: 'wind_avg_mi_h') double? indAverageMilesPerHour,
    @JsonKey(name: 'wind_max_m_s') double? windMaxMeterPerSeconds,
    @JsonKey(name: 'wind_max_km_h') double? windMaxKilometerPerHour,
    @JsonKey(name: 'wind_max_mi_h') double? windMaxMilesPerHour,
    @JsonKey(name: 'rain_mm') double? rainInMillimeters,
    @JsonKey(name: 'rain_in') double? rainInInches,
    @JsonKey(name: 'rain_rate_mm_h') double? rainRateMillimeterPerHour,
    @JsonKey(name: 'rain_rate_in_h') double? rainRateInchesPerHour,
    @JsonKey(name: 'pressure_hPa') double? pressureInhPa,
  }) = _Rtl433Device;

  bool get hasTemperature =>
      temperatureCelsius != null || temperatureFahrenheit != null;

  DateTime get lastUpdated {
    List<String> parts = time.split('.');
    int seconds = int.parse(parts[0]);
    int microseconds = int.parse(parts[1]);
    int totalMicroseconds = seconds * 1000000 + microseconds;

    DateTime dateTime =
        DateTime.fromMicrosecondsSinceEpoch(totalMicroseconds, isUtc: true);

    return dateTime;
  }

  factory Rtl433Device.fromJson(Map<String, Object?> json) =>
      _$Rtl433DeviceFromJson(json);

  @override
  Device toDevice() => Device(
        data: toJson(),
        id: '$model-$id',
        name: model,
        capabilities: [
          if (hasTemperature) DeviceCapability.temperature,
        ],
        temperature: temperatureCelsius ??
            (temperatureFahrenheit == null
                ? null
                : (5 / 9 * (temperatureFahrenheit! - 32.0))),
        service: Rtl433.key,
        lastUpdated: lastUpdated,
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
