import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/feature/device/domain/device_definition.dart';
import 'package:smart_dash/feature/weather/domain/weather.dart';
// ignore: unused_import
import 'package:smart_dash/integration/metno/metno.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

part 'weather_now_device.freezed.dart';
part 'weather_now_device.g.dart';

@freezed
class WeatherNowDevice with _$WeatherNowDevice, DeviceMapper {
  const WeatherNowDevice._();
  const factory WeatherNowDevice({
    @JsonKey(name: 'state') required Weather state,
  }) = _WeatherNowDevice;

  Optional<WeatherInstant> get observed => state.props.timeseries.isEmpty
      ? const Optional.empty()
      : Optional.of(state.props.timeseries.first.data.instant);

  String get id => state.observedBy!.id;

  PointGeometry get location => state.geometry;

  DateTime get lastUpdated => state.props.meta.updatedAt;

  bool get hasRain => observed.value.details.precipitationAmount != null;

  double? get rain {
    return observed.value.details.precipitationAmount;
  }

  bool get hasPressure => observed.value.details.airPressureAtSeaLevel != null;

  double? get pressure {
    return observed.value.details.airPressureAtSeaLevel;
  }

  bool get hasWindAngle => observed.value.details.windFromDirection != null;
  double? get windAngle {
    return observed.value.details.windFromDirection;
  }

  bool get hasWindSpeed => observed.value.details.windSpeed != null;
  double? get windSpeed {
    return observed.value.details.windSpeed;
  }

  bool get hasGustSpeed => observed.value.details.windSpeedOfGust != null;
  double? get gustSpeed {
    return observed.value.details.windSpeedOfGust;
  }

  bool get hasUltraviolet =>
      observed.value.details.ultravioletRadiation != null;

  int? get ultraviolet {
    return observed.value.details.ultravioletRadiation;
  }

  bool get hasHumidity => observed.value.details.relativeHumidity != null;

  double? get humidity {
    return observed.value.details.relativeHumidity;
  }

  bool get hasLuminance => observed.value.details.lightLuminance != null;

  int? get luminance {
    return observed.value.details.lightLuminance;
  }

  bool get hasTemperature => observed.value.details.airTemperature != null;

  double? get temperature {
    return observed.value.details.airTemperature;
  }

  factory WeatherNowDevice.fromJson(Map<String, Object?> json) =>
      _$WeatherNowDeviceFromJson(json);

  @override
  Device toDevice() => Device(
        id: id,
        name: 'now',
        data: toJson(),
        type: DeviceType.sensor,
        service: '$Weather'.toLowerCase(),
        capabilities: [
          if (hasRain) Capability.rain,
          // TODO: Implement DeviceCapability.pressure
          //if (hasPressure) DeviceCapability.pressure,
          if (hasHumidity) Capability.humidity,
          if (hasLuminance) Capability.luminance,
          if (hasTemperature) Capability.temperature,
          if (hasWindSpeed) Capability.windSpeed,
          if (hasGustSpeed) Capability.gustSpeed,
          if (hasUltraviolet) Capability.ultraviolet,
        ],
        rain: rain,
        humidity: humidity,
        luminance: luminance,
        windSpeed: windSpeed,
        gustSpeed: gustSpeed,
        windAngle: windAngle,
        ultraviolet: ultraviolet,
        lastUpdated: lastUpdated,
      );

  DeviceDefinition toDeviceDefinition() {
    return DeviceDefinition(
      type: DeviceType.sensor,
      name: DeviceType.sensor.name,
    );
  }
}
