import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/util/data/num.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
class Weather with _$Weather {
  const Weather._();
  const factory Weather({
    @JsonKey(name: 'service') required String service,
    @JsonKey(name: 'geometry') required PointGeometry geometry,
    @JsonKey(name: 'properties') required WeatherProperties props,
    @JsonKey(name: 'observedBy') Identity? observedBy,
  }) = _Weather;

  bool get isObservation => observedBy != null;

  factory Weather.fromJson(Map<String, Object?> json) =>
      _$WeatherFromJson(json);

  static const compassDirections = {
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
      compassDirections[((direction ?? 0) / 45).floor()];

  WeatherTimeStep? select(DateTime when, [bool closest = true]) {
    WeatherTimeStep? step;
    final it = props.timeseries.iterator;
    if (it.moveNext()) {
      step = it.current;
      var looking = true;
      DateTime now = when.toUtc();
      var delta = step.time.difference(now);
      while (looking && it.moveNext()) {
        if (closest) {
          final next = it.current.time.difference(now).abs();
          delta = delta.abs();
          if (next < delta) {
            step = it.current;
            delta = next;
          }
          looking = delta.inMinutes >= 60;
        } else {
          if (looking = now.difference(step!.time).inMinutes > 0) {
            step = it.current;
          }
        }
      }
    }
    return step;
  }

  double toPrecipitationForecastAmount(int hours) {
    final steps = props.timeseries
        .take(hours)
        .map((e) => e.data.next1h?.details)
        .whereType<WeatherForecastDetails>()
        .where((e) => (e.precipitationAmount ?? 0) > 0)
        .map(
      (e) {
        final amountInMm = e.precipitationAmount ?? 0.0;
        final hasMinTemp = e.airTemperatureMin != null;
        final hasMaxTemp = e.airTemperatureMax != null;
        final minTemp = hasMinTemp ? e.airTemperatureMin! : 0.0;
        final maxTemp = hasMaxTemp ? e.airTemperatureMax! : 0.0;
        final temp = hasMinTemp && hasMinTemp
            ? min(minTemp, maxTemp)
            : min(minTemp, maxTemp);
        return amountInMm *
            (temp > 0 ? 1 : _calcSnowRatioInInches(temp) * 0.254);
      },
    );

    // Sum over next 24 from index
    return steps.sum();
  }

  // From https://goodcalculators.com/rain-to-snow-calculator/
  double _calcSnowRatioInInches(double temp) {
    // 1 to -2
    if (temp <= 1 && temp > -3) {
      return 10;
    }
    // -3 to -7
    else if (temp <= -3 && temp > -8) {
      return 15;
    }
    // -7 to -9
    else if (temp <= -7 && temp > -10) {
      return 20;
    }
    // -10 to -12
    else if (temp <= -10 && temp > -13) {
      return 30;
    }
    // -13 to -18
    else if (temp <= -13 && temp > -19) {
      return 40;
    }
    // -18 to -29
    else if (temp <= -18 && temp > -30) {
      return 50;
    }
    // <-29
    return 100;
  }
}

@freezed
class WeatherTimeStep with _$WeatherTimeStep {
  const WeatherTimeStep._();

  const factory WeatherTimeStep({
    @JsonKey(name: 'time') required DateTime time,
    @JsonKey(name: 'data') required WeatherData data,
  }) = _WeatherTimeStep;

  factory WeatherTimeStep.fromJson(Map<String, Object?> json) =>
      _$WeatherTimeStepFromJson(json);
}

@freezed
class WeatherData with _$WeatherData {
  const WeatherData._();

  const factory WeatherData({
    @JsonKey(name: 'instant') required WeatherInstant instant,
    @JsonKey(name: 'next_1_hours') WeatherForecast? next1h,
    @JsonKey(name: 'next_6_hours') WeatherForecast? next6h,
    @JsonKey(name: 'next_12_hours') WeatherForecast? next12h,
  }) = _WeatherData;

  factory WeatherData.fromJson(Map<String, Object?> json) =>
      _$WeatherDataFromJson(json);
}

@freezed
class WeatherInstant with _$WeatherInstant {
  const WeatherInstant._();

  const factory WeatherInstant({
    @JsonKey(name: 'details') required WeatherInstantDetails details,
  }) = _WeatherInstant;

  factory WeatherInstant.fromJson(Map<String, Object?> json) =>
      _$WeatherInstantFromJson(json);
}

@freezed
class WeatherInstantDetails with _$WeatherInstantDetails {
  const WeatherInstantDetails._();

  const factory WeatherInstantDetails({
    /// Air pressure at sea level
    @JsonKey(name: 'air_pressure_at_sea_level') double? airPressureAtSeaLevel,

    /// Air temperature
    @JsonKey(name: 'air_temperature') double? airTemperature,

    /// Amount of sky covered by clouds.
    @JsonKey(name: 'cloud_area_fraction') double? cloudAreaFraction,

    /// The direction which the wind moves towards
    @JsonKey(name: 'wind_from_direction') double? windFromDirection,

    /// Speed of wind
    @JsonKey(name: 'wind_speed') double? windSpeed,

    /// Speed of wind gust
    @JsonKey(name: 'wind_speed_of_gust') double? windSpeedOfGust,

    /// Light luminance (in lux)
    @JsonKey(name: 'light_luminance') int? lightLuminance,

    /// Air humidity (in percent, %)
    @JsonKey(name: 'relative_humidity') double? relativeHumidity,

    /// Ultraviolet radiation (in UV index, UVI)
    @JsonKey(name: 'ultraviolet_radiation') int? ultravioletRadiation,

    /// Amount of precipitation in mm water equivalents
    @JsonKey(name: 'precipitation_amount') double? precipitationAmount,
  }) = _WeatherInstantDetails;

  factory WeatherInstantDetails.fromJson(Map<String, Object?> json) =>
      _$WeatherInstantDetailsFromJson(json);
}

@freezed
class WeatherForecast with _$WeatherForecast {
  const WeatherForecast._();

  const factory WeatherForecast({
    @JsonKey(name: 'summary') required WeatherSummary summary,
    @JsonKey(name: 'details') required WeatherForecastDetails details,
  }) = _WeatherForecast;

  factory WeatherForecast.fromJson(Map<String, Object?> json) =>
      _$WeatherForecastFromJson(json);
}

@freezed
class WeatherForecastDetails with _$WeatherForecastDetails {
  const WeatherForecastDetails._();

  const factory WeatherForecastDetails({
    @JsonKey(name: 'air_temperature_min') double? airTemperatureMin,
    @JsonKey(name: 'air_temperature_max') double? airTemperatureMax,
    @JsonKey(name: 'precipitation_amount') double? precipitationAmount,
    @JsonKey(name: 'precipitation_amount_min') double? precipitationAmountMin,
    @JsonKey(name: 'precipitation_amount_max') double? precipitationAmountMax,
    @JsonKey(name: 'probability_of_precipitation')
    double? probabilityOfPrecipitation,
    @JsonKey(name: 'probability_of_thunder') double? probabilityOfThunder,
  }) = _WeatherForecastDetails;

  factory WeatherForecastDetails.fromJson(Map<String, Object?> json) =>
      _$WeatherForecastDetailsFromJson(json);
}

@freezed
class WeatherDetails with _$WeatherDetails {
  const WeatherDetails._();

  const factory WeatherDetails({
    @JsonKey(name: 'symbol_code') required String symbolCode,
  }) = _WeatherDetails;

  factory WeatherDetails.fromJson(Map<String, Object?> json) =>
      _$WeatherDetailsFromJson(json);
}

@freezed
class WeatherSummary with _$WeatherSummary {
  const WeatherSummary._();

  const factory WeatherSummary({
    @JsonKey(name: 'symbol_code') required String symbolCode,
  }) = _WeatherSummary;

  factory WeatherSummary.fromJson(Map<String, Object?> json) =>
      _$WeatherSummaryFromJson(json);
}

@freezed
class WeatherProperties with _$WeatherProperties {
  const WeatherProperties._();
  const factory WeatherProperties({
    @JsonKey(name: 'meta') required WeatherMeta meta,
    @JsonKey(name: 'timeseries') required List<WeatherTimeStep> timeseries,
  }) = _WeatherProperties;
  factory WeatherProperties.fromJson(Map<String, Object?> json) =>
      _$WeatherPropertiesFromJson(json);
}

@freezed
class WeatherMeta with _$WeatherMeta {
  const WeatherMeta._();
  const factory WeatherMeta({
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'units') required WeatherUnits units,
  }) = _WeatherMeta;
  factory WeatherMeta.fromJson(Map<String, Object?> json) =>
      _$WeatherMetaFromJson(json);
}

@freezed
class PointGeometry with _$PointGeometry {
  const PointGeometry._();

  const factory PointGeometry({
    @JsonKey(name: 'coordinates') required List<double> coords,
  }) = _PointGeometry;

  double get lon => coords.length > 1 ? coords[0] : double.nan;
  double get lat => coords.length > 1 ? coords[1] : double.nan;
  double get alt => coords.length > 2 ? coords[2] : double.nan;

  factory PointGeometry.fromJson(Map<String, Object?> json) =>
      _$PointGeometryFromJson(json);

  bool isHere(double lon, double lat) => this.lon == lon && this.lat == lat;
}

@freezed
class WeatherUnits with _$WeatherUnits {
  const WeatherUnits._();
  const factory WeatherUnits({
    @JsonKey(name: 'air_pressure_at_sea_level') String? airPressureAtSeaLevel,
    @JsonKey(name: 'air_temperature') String? airTemperature,
    @JsonKey(name: 'cloud_area_fraction') String? cloudAreaFraction,
    @JsonKey(name: 'precipitation_amount') String? precipitationAmount,
    @JsonKey(name: 'relative_humidity') String? relativeHumidity,
    @JsonKey(name: 'wind_from_direction') String? windFromDirection,
    @JsonKey(name: 'wind_speed') String? windSpeed,
    @JsonKey(name: 'wind_speed_of_gust') String? windSpeedOfGust,
    @JsonKey(name: 'light_luminance') String? lightLuminance,
    @JsonKey(name: 'ultraviolet_radiation') String? ultravioletRadiation,
  }) = _WeatherUnits;
  factory WeatherUnits.fromJson(Map<String, Object?> json) =>
      _$WeatherUnitsFromJson(json);
}
