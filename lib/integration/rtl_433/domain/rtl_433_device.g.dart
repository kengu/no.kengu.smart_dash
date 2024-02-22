// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rtl_433_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Rtl433DeviceImpl _$$Rtl433DeviceImplFromJson(Map<String, dynamic> json) =>
    _$Rtl433DeviceImpl(
      id: json['id'] as Object,
      time: json['time'] as String,
      model: json['model'] as String,
      mic: json['mic'] as String?,
      channel: json['channel'] as String?,
      subtype: json['subtype'] as String?,
      batteryOk: (json['battery_ok'] as num?)?.toDouble(),
      batteryVolts: (json['battery_V'] as num?)?.toDouble(),
      temperatureCelsius: (json['temperature_C'] as num?)?.toDouble(),
      temperatureFahrenheit: (json['temperature_F'] as num?)?.toDouble(),
      targetTemperatureCelsius: (json['setpoint_C'] as num?)?.toDouble(),
      targetTemperatureFahrenheit: (json['setpoint_F'] as num?)?.toDouble(),
      humidity: (json['humidity'] as num?)?.toDouble(),
      moisture: (json['moisture'] as num?)?.toDouble(),
      windDirectionDegrees: (json['wind_dir_deg'] as num?)?.toDouble(),
      windAverageMeterPerSeconds: (json['wind_avg_m_s'] as num?)?.toDouble(),
      indAverageKilometerPerHour: (json['wind_avg_km_h'] as num?)?.toDouble(),
      indAverageMilesPerHour: (json['wind_avg_mi_h'] as num?)?.toDouble(),
      windMaxMeterPerSeconds: (json['wind_max_m_s'] as num?)?.toDouble(),
      windMaxKilometerPerHour: (json['wind_max_km_h'] as num?)?.toDouble(),
      windMaxMilesPerHour: (json['wind_max_mi_h'] as num?)?.toDouble(),
      rainInMillimeters: (json['rain_mm'] as num?)?.toDouble(),
      rainInInches: (json['rain_in'] as num?)?.toDouble(),
      rainRateMillimeterPerHour: (json['rain_rate_mm_h'] as num?)?.toDouble(),
      rainRateInchesPerHour: (json['rain_rate_in_h'] as num?)?.toDouble(),
      pressureInhPa: (json['pressure_hPa'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$Rtl433DeviceImplToJson(_$Rtl433DeviceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'time': instance.time,
      'model': instance.model,
      'mic': instance.mic,
      'channel': instance.channel,
      'subtype': instance.subtype,
      'battery_ok': instance.batteryOk,
      'battery_V': instance.batteryVolts,
      'temperature_C': instance.temperatureCelsius,
      'temperature_F': instance.temperatureFahrenheit,
      'setpoint_C': instance.targetTemperatureCelsius,
      'setpoint_F': instance.targetTemperatureFahrenheit,
      'humidity': instance.humidity,
      'moisture': instance.moisture,
      'wind_dir_deg': instance.windDirectionDegrees,
      'wind_avg_m_s': instance.windAverageMeterPerSeconds,
      'wind_avg_km_h': instance.indAverageKilometerPerHour,
      'wind_avg_mi_h': instance.indAverageMilesPerHour,
      'wind_max_m_s': instance.windMaxMeterPerSeconds,
      'wind_max_km_h': instance.windMaxKilometerPerHour,
      'wind_max_mi_h': instance.windMaxMilesPerHour,
      'rain_mm': instance.rainInMillimeters,
      'rain_in': instance.rainInInches,
      'rain_rate_mm_h': instance.rainRateMillimeterPerHour,
      'rain_rate_in_h': instance.rainRateInchesPerHour,
      'pressure_hPa': instance.pressureInhPa,
    };
