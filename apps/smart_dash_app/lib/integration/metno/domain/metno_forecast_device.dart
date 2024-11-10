import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dash_app/feature/device/domain/device.dart';
import 'package:smart_dash_app/feature/device/domain/device_definition.dart';
import 'package:smart_dash_app/feature/weather/domain/weather.dart';
import 'package:smart_dash_app/integration/metno/metno.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

part 'metno_forecast_device.freezed.dart';
part 'metno_forecast_device.g.dart';

@freezed
class MetNoForecastDevice with _$MetNoForecastDevice, DeviceMapper {
  const MetNoForecastDevice._();
  const factory MetNoForecastDevice({
    @JsonKey(name: 'state') required Weather state,
  }) = _MetNoForecastDevice;

  String get location {
    if (place != null) return place!;
    return '$lon;$lat';
  }

  String? get place => state.place;
  double get lat => state.geometry.lat;
  double get lon => state.geometry.lon;

  DateTime get lastUpdated => state.props.meta.updatedAt;

  factory MetNoForecastDevice.fromJson(Map<String, Object?> json) =>
      _$MetNoForecastDeviceFromJson(json);

  @override
  Device toDevice() => Device(
        name: location,
        data: toJson(),
        id: location.toLowerCase(),
        service: MetNo.key,
        type: DeviceType.weatherForecast,
        capabilities: [
          Capability.rain1h,
          Capability.rain3h,
          Capability.rain6h,
          Capability.rain12h,
          Capability.rain1d,
          Capability.snow1h,
          Capability.snow3h,
          Capability.snow6h,
          Capability.snow12h,
          Capability.snow1d,
          Capability.temperature1h,
          Capability.temperature3h,
          Capability.temperature6h,
          Capability.temperature12h,
          Capability.temperature1d,
        ],
        lastUpdated: lastUpdated,
        rain1h: state.toRainForecastAmount(1),
        rain3h: state.toRainForecastAmount(3),
        rain6h: state.toRainForecastAmount(6),
        rain12h: state.toRainForecastAmount(12),
        rain1d: state.toRainForecastAmount(24),
        snow1h: state.toSnowForecastAmount(1),
        snow3h: state.toSnowForecastAmount(3),
        snow6h: state.toSnowForecastAmount(6),
        snow12h: state.toSnowForecastAmount(12),
        snow1d: state.toSnowForecastAmount(24),
        temperature1h: state.toTemperatureAt(1).orElseNull,
        temperature3h: state.toTemperatureAt(3).orElseNull,
        temperature6h: state.toTemperatureAt(6).orElseNull,
        temperature12h: state.toTemperatureAt(12).orElseNull,
        temperature1d: state.toTemperatureAt(24).orElseNull,
      );

  DeviceDefinition toDeviceDefinition() {
    const type = DeviceType.sensor;
    return DeviceDefinition(
      type: type,
      name: MetNo.readableModelName[type] ?? type.name,
    );
  }
}
