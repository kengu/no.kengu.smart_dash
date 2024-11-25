import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_device/smart_dash_device.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

import 'domain/weather_state.dart';

class Weather {
  static const supportedTypes = [
    DeviceType.weatherNow,
    DeviceType.weatherForecast,
  ];

  static const readableModelName = {
    DeviceType.weatherNow: 'Weather Now',
    DeviceType.weatherForecast: 'Weather Forecast',
  };

  static const _compassDirections = {
    0: "N",
    1: "NØ",
    2: "E",
    3: "SE",
    4: "S",
    5: "SW",
    6: "W",
    7: "NW"
  };

  static String? toCompassDirection(double? direction) =>
      _compassDirections[((direction ?? 0) / 45).floor()];

  static WeatherState toNow(Device device) {
    return WeatherState(
      service: device.service,
      observedBy: Identity.of(device).id,
      // TODO: Get [lat,lon] from device
      geometry: const PointGeometry(coords: []),
      props: WeatherProperties(
        timeseries: [
          WeatherTimeStep(
            time: device.lastUpdated,
            data: WeatherData(
              instant: WeatherInstant(
                details: WeatherInstantDetails(
                  windSpeed: device.windSpeed,
                  lightLuminance: device.luminance,
                  relativeHumidity: device.humidity,
                  windSpeedOfGust: device.gustSpeed,
                  airTemperature: device.temperature,
                  windFromDirection: device.windAngle,
                  precipitationAmount: device.rainTotal,
                  ultravioletRadiation: device.ultraviolet,
                ),
              ),
            ),
          ),
        ],
        meta: WeatherMeta(
          units: WeatherUnits(
            windSpeed: ValueUnit.windSpeed.symbol,
            precipitationAmount: ValueUnit.rain.symbol,
            lightLuminance: ValueUnit.luminance.symbol,
            relativeHumidity: ValueUnit.humidity.symbol,
            windSpeedOfGust: ValueUnit.gustSpeed.symbol,
            airTemperature: ValueUnit.temperature.symbol,
            windFromDirection: ValueUnit.windAngle.symbol,
            ultravioletRadiation: ValueUnit.ultraviolet.symbol,
          ),
          updatedAt: device.lastUpdated,
        ),
      ),
    );
  }
}

class WeatherEvent extends DriverDataEvent<WeatherState> {
  WeatherEvent(
    super.data, {
    required super.key,
    required super.last,
    required super.when,
  });

  factory WeatherEvent.now(String key, WeatherState data) {
    final when = DateTime.now();
    return WeatherEvent(
      data,
      key: key,
      when: when,
      last: when,
    );
  }
}
