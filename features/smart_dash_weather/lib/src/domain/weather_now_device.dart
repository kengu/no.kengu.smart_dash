import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash_account/smart_dash_account.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_device/smart_dash_device.dart';
import 'package:smart_dash_weather/smart_dash_weather.dart';

part 'weather_now_device.freezed.dart';
part 'weather_now_device.g.dart';

@freezed
class WeatherNowDevice with _$WeatherNowDevice, DeviceMapper {
  const WeatherNowDevice._();
  const factory WeatherNowDevice({
    @JsonKey(name: 'service') required String service,
    @JsonKey(name: 'state') required WeatherState state,
  }) = _WeatherNowDevice;

  Optional<WeatherInstant> get observed => state.props.timeseries.isEmpty
      ? const Optional.empty()
      : Optional.of(state.props.timeseries.first.data.instant);

  String get location {
    if (place != null) return place!;
    return '$lon;$lat';
  }

  String? get place => state.place;
  double get lat => state.geometry.lat;
  double get lon => state.geometry.lon;

  PointGeometry get geometry => state.geometry;

  String get id => state.observedBy ?? location;

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
        service: service,
        type: DeviceType.sensor,
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
      type: DeviceType.weatherNow,
      name: DeviceType.weatherNow.name,
    );
  }
}
