import 'package:optional/optional.dart';
import 'package:smart_dash_common/src/domain/units.dart';
import 'package:smart_dash_common/src/domain/value.dart';

/// Copied from https://apps-sdk-v3.developer.homey.app/tutorial-device-capabilities.html
/// TODO: Make my own capability definitions
enum Capability {
  any(
    'value',
    'This implies that the device has value capability',
    ValueUnit.any,
    ValueType.int,
  ),

  energy(
    'meter_energy',
    'This implies that the device has '
        'energy measurement capability',
    ValueUnit.energy,
    ValueType.int,
  ),

  power(
    'measure_power',
    'This implies that the device has '
        'power measurement capability',
    ValueUnit.power,
    ValueType.int,
  ),

  voltage(
    'measure_voltage',
    'This implies that the device has '
        'voltage measurement capability',
    ValueUnit.voltage,
    ValueType.int,
  ),

  onOff(
    'switch_mode',
    'This implies that the device has on/off switch capability',
    ValueUnit.onOff,
    ValueType.bool,
  ),

  targetTemperature(
    'target_temperature',
    'This implies that the device has the ability to regulate temperature',
    ValueUnit.temperature,
    ValueType.double,
  ),

  temperature(
    'measure_temperature',
    'This implies that the device has '
        'temperature measurement (in celsius degrees, C°) capability',
    ValueUnit.temperature,
    ValueType.double,
  ),

  humidity(
    'measure_humidity',
    'This implies that the device has '
        'humidity measurement (in percent, %) capability',
    ValueUnit.humidity,
    ValueType.double,
  ),

  rain(
    'measure_rain',
    'This implies that the device has '
        'rain measurement (in millimeter) capability',
    ValueUnit.rain,
    ValueType.double,
  ),

  rainRate(
    'measure_rain_rate',
    'This implies that the device has '
        'rain rate measurement (in millimeter per hour) capability',
    ValueUnit.rainRate,
    ValueType.double,
  ),

  rainTotal(
    'measure_rain_total',
    'This implies that the device has '
        'rain total measurement (in millimeter) capability',
    ValueUnit.rainTotal,
    ValueType.double,
  ),

  windAngle(
    'measure_wind_angle',
    'This implies that the device has '
        'wind angle measurement (in degrees, °) capability',
    ValueUnit.windAngle,
    ValueType.double,
  ),

  windSpeed(
    'measure_wind_speed',
    'This implies that the device has '
        'wind strength measurement (in meters per seconds) capability',
    ValueUnit.windSpeed,
    ValueType.double,
  ),

  gustSpeed(
    'measure_gust_speed',
    'This implies that the device has '
        'wind gust measurement (in meters per seconds) capability',
    ValueUnit.gustSpeed,
    ValueType.double,
  ),

  ultraviolet(
    'measure_ultraviolet',
    'This implies that the device has '
        'ultraviolet measurement (in UV index, UVI) capability',
    ValueUnit.ultraviolet,
    ValueType.int,
  ),

  luminance(
    'measure_luminance',
    'This implies that the device has '
        'luminance measurement (in lux) capability',
    ValueUnit.luminance,
    ValueType.int,
  ),

  snowDepth(
    'measure_snow_depth',
    'This implies that the device has '
        'snow depth measurement (in cm) capability',
    ValueUnit.snowDepth,
    ValueType.int,
  ),

  snowWeight(
    'measure_snow_weight',
    'This implies that the device has '
        'snow weight measurement (in kg) capability',
    ValueUnit.snowWeight,
    ValueType.int,
  ),

  // =====================
  // Forecast capabilities
  // =====================

  temperature1h(
    'measure_temperature',
    'This implies that the device has temperature '
        'forecast (in celsius degrees, C°) next 1h capability',
    ValueUnit.temperature,
    ValueType.double,
  ),

  temperature3h(
    'measure_temperature',
    'This implies that the device has temperature '
        'forecast (in celsius degrees, C°) in 3h capability',
    ValueUnit.temperature,
    ValueType.double,
  ),

  temperature6h(
    'measure_temperature',
    'This implies that the device has temperature '
        'forecast (in celsius degrees, C°) in 6h capability',
    ValueUnit.temperature,
    ValueType.double,
  ),

  temperature12h(
    'measure_temperature',
    'This implies that the device has temperature '
        'forecast (in celsius degrees, C°) in 12h capability',
    ValueUnit.temperature,
    ValueType.double,
  ),

  temperature1d(
    'measure_temperature',
    'This implies that the device has temperature '
        'forecast (in celsius degrees, C°) in 1d capability',
    ValueUnit.temperature,
    ValueType.double,
  ),

  rain1h(
    'forecast_rain_1h',
    'This implies that the device has precipitation as '
        'rain forecast (in millimeter) next 1h capability',
    ValueUnit.rain,
    ValueType.double,
  ),

  rain3h(
    'forecast_rain_3h',
    'This implies that the device has precipitation as '
        'rain forecast (in millimeter) next 3h capability',
    ValueUnit.rain,
    ValueType.double,
  ),

  rain6h(
    'forecast_rain_6h',
    'This implies that the device has precipitation as '
        'rain forecast (in millimeter) next 6h capability',
    ValueUnit.rain,
    ValueType.double,
  ),

  rain12h(
    'forecast_rain_12h',
    'This implies that the device has precipitation as '
        'rain forecast (in millimeter) next 12h capability',
    ValueUnit.rain,
    ValueType.double,
  ),

  rain1d(
    'forecast_rain_1d',
    'This implies that the device has precipitation as '
        'rain forecast (in millimeter) next 1d capability',
    ValueUnit.rain,
    ValueType.double,
  ),

  snow1h(
    'forecast_snow_1h',
    'This implies that the device has precipitation as '
        'snow forecast (in cm) next 1h capability',
    ValueUnit.snow,
    ValueType.double,
  ),

  snow3h(
    'forecast_snow_3h',
    'This implies that the device has precipitation as '
        'snow forecast (in cm) next 3h capability',
    ValueUnit.snow,
    ValueType.double,
  ),

  snow6h(
    'forecast_snow_6h',
    'This implies that the device has precipitation as '
        'snow forecast (in cm) next 6h capability',
    ValueUnit.snow,
    ValueType.double,
  ),

  snow12h(
    'forecast_snow_12h',
    'This implies that the device has precipitation as '
        'snow forecast (in cm) next 12h capability',
    ValueUnit.snow,
    ValueType.double,
  ),

  snow1d(
    'forecast_snow_1d',
    'This implies that the device has precipitation as '
        'snow forecast (in cm) next 1d capability',
    ValueUnit.snow,
    ValueType.double,
  );

  // Measure capabilities
  bool get hasRain => this == rain;
  bool get hasRainRate => this == rainRate;
  bool get hasRainTotal => this == rainTotal;
  bool get hasOnOff => this == onOff;
  bool get hasPower => this == power;
  bool get hasEnergy => this == energy;
  bool get hasVoltage => this == voltage;
  bool get hasHumidity => this == humidity;
  bool get hasLuminance => this == luminance;
  bool get hasWindAngle => this == windAngle;
  bool get hasWindStrength => this == windSpeed;
  bool get hasGustStrength => this == gustSpeed;
  bool get hasUltraviolet => this == ultraviolet;
  bool get hasTemperature => this == temperature;
  bool get hasTargetTemperature => this == targetTemperature;
  bool get hasSnowDepth => this == snowDepth;
  bool get hasSnowWeight => this == snowWeight;

  // Forecast capabilities
  bool get hasRain1h => this == rain1h;
  bool get hasRain3h => this == rain3h;
  bool get hasRain6h => this == rain6h;
  bool get hasRain12h => this == rain12h;
  bool get hasRain1d => this == rain1d;
  bool get hasSnow1h => this == snow1h;
  bool get hasSnow3h => this == snow3h;
  bool get hasSnow6h => this == snow6h;
  bool get hasSnow12h => this == snow12h;
  bool get hasSnow1d => this == snow1d;
  bool get hasTemperature1h => this == temperature1h;
  bool get hasTemperature3h => this == temperature3h;
  bool get hasTemperature6h => this == temperature6h;
  bool get hasTemperature12h => this == temperature12h;
  bool get hasTemperature1d => this == temperature1d;

  const Capability(this.variable, this.description, this.unit, this.type);

  final ValueType type;
  final ValueUnit unit;
  final String variable;
  final String description;

  static Optional<Capability> of(String name) =>
      values.firstWhereOptional((e) => e.name == name);
}

extension CapabilityX on List<Capability> {
  bool get hasOnOff => any((c) => c.hasOnOff);
  bool get hasPower => any((c) => c.hasPower);
  bool get hasEnergy => any((c) => c.hasEnergy);
  bool get hasVoltage => any((c) => c.hasVoltage);
  bool get hasRain => any((c) => c.hasRain);
  bool get hasRainRate => any((c) => c.hasRainRate);
  bool get hasRainTotal => any((c) => c.hasRainTotal);
  bool get hasHumidity => any((c) => c.hasHumidity);
  bool get hasWindAngle => any((c) => c.hasWindAngle);
  bool get hasLuminance => any((c) => c.hasLuminance);
  bool get hasUltraviolet => any((c) => c.hasUltraviolet);
  bool get hasTemperature => any((c) => c.hasTemperature);
  bool get hasWindStrength => any((c) => c.hasWindStrength);
  bool get hasGustStrength => any((c) => c.hasGustStrength);
  bool get hasTargetTemperature => any((c) => c.hasTargetTemperature);
  bool get hasSnowDepth => any((c) => c.hasSnowDepth);
  bool get hasSnowWeight => any((c) => c.hasSnowWeight);

  // Forecasts
  bool get hasRain1h => any((c) => c.hasRain1h);
  bool get hasRain3h => any((c) => c.hasRain3h);
  bool get hasRain6h => any((c) => c.hasRain6h);
  bool get hasRain12h => any((c) => c.hasRain12h);
  bool get hasRain1d => any((c) => c.hasRain1d);
  bool get hasSnow1h => any((c) => c.hasSnow1h);
  bool get hasSnow3h => any((c) => c.hasSnow3h);
  bool get hasSnow6h => any((c) => c.hasSnow6h);
  bool get hasSnow12h => any((c) => c.hasSnow12h);
  bool get hasSnow1d => any((c) => c.hasSnow1d);
  bool get hasTemperature1h => any((c) => c.hasTemperature1d);
  bool get hasTemperature3h => any((c) => c.hasTemperature1d);
  bool get hasTemperature6h => any((c) => c.hasTemperature1d);
  bool get hasTemperature12h => any((c) => c.hasTemperature1d);
  bool get hasTemperature1d => any((c) => c.hasTemperature1d);

  bool get isWeather => isWeatherNow || isWeatherForecast;

  bool get isWeatherNow => any(
        (c) => const [
          Capability.rain,
          Capability.temperature,
          Capability.windSpeed,
          Capability.windAngle,
          Capability.gustSpeed,
          Capability.humidity,
          Capability.luminance,
          Capability.ultraviolet,
        ].contains(c),
      );

  bool get isWeatherForecast =>
      isRainForecast || isSnowForecast || isTemperatureForecast;

  bool get isRainForecast => any(
        (c) => const [
          Capability.rain1h,
          Capability.rain3h,
          Capability.rain6h,
          Capability.rain12h,
          Capability.rain1d,
        ].contains(c),
      );

  bool get isSnowForecast => any(
        (c) => const [
          Capability.snow1h,
          Capability.snow3h,
          Capability.snow6h,
          Capability.snow12h,
          Capability.snow1d,
        ].contains(c),
      );

  bool get isTemperatureForecast => any(
        (c) => const [
          Capability.temperature1h,
          Capability.temperature3h,
          Capability.temperature6h,
          Capability.temperature12h,
          Capability.temperature1d,
        ].contains(c),
      );
}
