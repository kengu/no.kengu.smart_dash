// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeatherState _$WeatherStateFromJson(Map<String, dynamic> json) =>
    _WeatherState(
      service: json['service'] as String,
      geometry:
          PointGeometry.fromJson(json['geometry'] as Map<String, dynamic>),
      props: WeatherProperties.fromJson(
          json['properties'] as Map<String, dynamic>),
      place: json['place'] as String?,
      observedBy: json['observedBy'] as String?,
    );

Map<String, dynamic> _$WeatherStateToJson(_WeatherState instance) =>
    <String, dynamic>{
      'service': instance.service,
      'geometry': instance.geometry.toJson(),
      'properties': instance.props.toJson(),
      'place': instance.place,
      'observedBy': instance.observedBy,
    };

_WeatherTimeStep _$WeatherTimeStepFromJson(Map<String, dynamic> json) =>
    _WeatherTimeStep(
      time: DateTime.parse(json['time'] as String),
      data: WeatherData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherTimeStepToJson(_WeatherTimeStep instance) =>
    <String, dynamic>{
      'time': instance.time.toIso8601String(),
      'data': instance.data.toJson(),
    };

_WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) => _WeatherData(
      instant: WeatherInstant.fromJson(json['instant'] as Map<String, dynamic>),
      next1h: json['next_1_hours'] == null
          ? null
          : WeatherForecast.fromJson(
              json['next_1_hours'] as Map<String, dynamic>),
      next6h: json['next_6_hours'] == null
          ? null
          : WeatherForecast.fromJson(
              json['next_6_hours'] as Map<String, dynamic>),
      next12h: json['next_12_hours'] == null
          ? null
          : WeatherForecast.fromJson(
              json['next_12_hours'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherDataToJson(_WeatherData instance) =>
    <String, dynamic>{
      'instant': instance.instant.toJson(),
      'next_1_hours': instance.next1h?.toJson(),
      'next_6_hours': instance.next6h?.toJson(),
      'next_12_hours': instance.next12h?.toJson(),
    };

_WeatherInstant _$WeatherInstantFromJson(Map<String, dynamic> json) =>
    _WeatherInstant(
      details: WeatherInstantDetails.fromJson(
          json['details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherInstantToJson(_WeatherInstant instance) =>
    <String, dynamic>{
      'details': instance.details.toJson(),
    };

_WeatherInstantDetails _$WeatherInstantDetailsFromJson(
        Map<String, dynamic> json) =>
    _WeatherInstantDetails(
      airPressureAtSeaLevel:
          (json['air_pressure_at_sea_level'] as num?)?.toDouble(),
      airTemperature: (json['air_temperature'] as num?)?.toDouble(),
      cloudAreaFraction: (json['cloud_area_fraction'] as num?)?.toDouble(),
      windFromDirection: (json['wind_from_direction'] as num?)?.toDouble(),
      windSpeed: (json['wind_speed'] as num?)?.toDouble(),
      windSpeedOfGust: (json['wind_speed_of_gust'] as num?)?.toDouble(),
      lightLuminance: (json['light_luminance'] as num?)?.toInt(),
      relativeHumidity: (json['relative_humidity'] as num?)?.toDouble(),
      ultravioletRadiation: (json['ultraviolet_radiation'] as num?)?.toInt(),
      precipitationAmount: (json['precipitation_amount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WeatherInstantDetailsToJson(
        _WeatherInstantDetails instance) =>
    <String, dynamic>{
      'air_pressure_at_sea_level': instance.airPressureAtSeaLevel,
      'air_temperature': instance.airTemperature,
      'cloud_area_fraction': instance.cloudAreaFraction,
      'wind_from_direction': instance.windFromDirection,
      'wind_speed': instance.windSpeed,
      'wind_speed_of_gust': instance.windSpeedOfGust,
      'light_luminance': instance.lightLuminance,
      'relative_humidity': instance.relativeHumidity,
      'ultraviolet_radiation': instance.ultravioletRadiation,
      'precipitation_amount': instance.precipitationAmount,
    };

_WeatherForecast _$WeatherForecastFromJson(Map<String, dynamic> json) =>
    _WeatherForecast(
      summary: WeatherSummary.fromJson(json['summary'] as Map<String, dynamic>),
      details: WeatherForecastDetails.fromJson(
          json['details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherForecastToJson(_WeatherForecast instance) =>
    <String, dynamic>{
      'summary': instance.summary.toJson(),
      'details': instance.details.toJson(),
    };

_WeatherForecastDetails _$WeatherForecastDetailsFromJson(
        Map<String, dynamic> json) =>
    _WeatherForecastDetails(
      airTemperatureMin: (json['air_temperature_min'] as num?)?.toDouble(),
      airTemperatureMax: (json['air_temperature_max'] as num?)?.toDouble(),
      precipitationAmount: (json['precipitation_amount'] as num?)?.toDouble(),
      precipitationAmountMin:
          (json['precipitation_amount_min'] as num?)?.toDouble(),
      precipitationAmountMax:
          (json['precipitation_amount_max'] as num?)?.toDouble(),
      probabilityOfPrecipitation:
          (json['probability_of_precipitation'] as num?)?.toDouble(),
      probabilityOfThunder:
          (json['probability_of_thunder'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WeatherForecastDetailsToJson(
        _WeatherForecastDetails instance) =>
    <String, dynamic>{
      'air_temperature_min': instance.airTemperatureMin,
      'air_temperature_max': instance.airTemperatureMax,
      'precipitation_amount': instance.precipitationAmount,
      'precipitation_amount_min': instance.precipitationAmountMin,
      'precipitation_amount_max': instance.precipitationAmountMax,
      'probability_of_precipitation': instance.probabilityOfPrecipitation,
      'probability_of_thunder': instance.probabilityOfThunder,
    };

_WeatherDetails _$WeatherDetailsFromJson(Map<String, dynamic> json) =>
    _WeatherDetails(
      symbolCode: json['symbol_code'] as String,
    );

Map<String, dynamic> _$WeatherDetailsToJson(_WeatherDetails instance) =>
    <String, dynamic>{
      'symbol_code': instance.symbolCode,
    };

_WeatherSummary _$WeatherSummaryFromJson(Map<String, dynamic> json) =>
    _WeatherSummary(
      symbolCode: json['symbol_code'] as String,
    );

Map<String, dynamic> _$WeatherSummaryToJson(_WeatherSummary instance) =>
    <String, dynamic>{
      'symbol_code': instance.symbolCode,
    };

_WeatherProperties _$WeatherPropertiesFromJson(Map<String, dynamic> json) =>
    _WeatherProperties(
      meta: WeatherMeta.fromJson(json['meta'] as Map<String, dynamic>),
      timeseries: (json['timeseries'] as List<dynamic>)
          .map((e) => WeatherTimeStep.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeatherPropertiesToJson(_WeatherProperties instance) =>
    <String, dynamic>{
      'meta': instance.meta.toJson(),
      'timeseries': instance.timeseries.map((e) => e.toJson()).toList(),
    };

_WeatherMeta _$WeatherMetaFromJson(Map<String, dynamic> json) => _WeatherMeta(
      updatedAt: DateTime.parse(json['updated_at'] as String),
      units: WeatherUnits.fromJson(json['units'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherMetaToJson(_WeatherMeta instance) =>
    <String, dynamic>{
      'updated_at': instance.updatedAt.toIso8601String(),
      'units': instance.units.toJson(),
    };

_WeatherUnits _$WeatherUnitsFromJson(Map<String, dynamic> json) =>
    _WeatherUnits(
      airPressureAtSeaLevel: json['air_pressure_at_sea_level'] as String?,
      airTemperature: json['air_temperature'] as String?,
      cloudAreaFraction: json['cloud_area_fraction'] as String?,
      precipitationAmount: json['precipitation_amount'] as String?,
      relativeHumidity: json['relative_humidity'] as String?,
      windFromDirection: json['wind_from_direction'] as String?,
      windSpeed: json['wind_speed'] as String?,
      windSpeedOfGust: json['wind_speed_of_gust'] as String?,
      lightLuminance: json['light_luminance'] as String?,
      ultravioletRadiation: json['ultraviolet_radiation'] as String?,
    );

Map<String, dynamic> _$WeatherUnitsToJson(_WeatherUnits instance) =>
    <String, dynamic>{
      'air_pressure_at_sea_level': instance.airPressureAtSeaLevel,
      'air_temperature': instance.airTemperature,
      'cloud_area_fraction': instance.cloudAreaFraction,
      'precipitation_amount': instance.precipitationAmount,
      'relative_humidity': instance.relativeHumidity,
      'wind_from_direction': instance.windFromDirection,
      'wind_speed': instance.windSpeed,
      'wind_speed_of_gust': instance.windSpeedOfGust,
      'light_luminance': instance.lightLuminance,
      'ultraviolet_radiation': instance.ultravioletRadiation,
    };
