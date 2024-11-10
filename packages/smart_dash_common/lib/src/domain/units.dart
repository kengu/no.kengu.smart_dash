import 'dart:math';

import 'package:optional/optional.dart';

enum ValueUnit {
  any(''),
  onOff(''),
  power('W'),
  rain('mm'),
  rainTotal('mm'),
  rainRate('mm/h'),
  energy('Wh'),
  voltage('V'),
  humidity('%'),
  windAngle('°'),
  luminance('lx'),
  windSpeed('m/s'),
  gustSpeed('m/s'),
  snow('cm'),
  snowDepth('cm'),
  snowWeight('kg/m²'),
  ultraviolet('UVI'),
  temperature('°C');

  bool get isRain => this == rain;
  bool get isValue => this == any;
  bool get isOnOff => this == onOff;
  bool get isPower => this == power;
  bool get isEnergy => this == energy;
  bool get isVoltage => this == voltage;
  bool get isHumidity => this == humidity;
  bool get isWindAngle => this == windAngle;
  bool get isWindSpeed => this == windSpeed;
  bool get isGustSpeed => this == gustSpeed;
  bool get isLuminance => this == luminance;
  bool get isTemperature => this == temperature;
  bool get isSnowDepth => this == snowDepth;
  bool get isSnowWeight => this == snowWeight;

  static ValueUnit of(String name) => values.firstWhere((e) => e.name == name);

  static String symbolOf(String token) =>
      values.where((e) => e.name == token).firstOrNull?.symbol ?? token;

  const ValueUnit(this.symbol);

  final String symbol;
}

extension UnitX on num {
  static const Map<int, String> upper = {
    30: 'Q',
    27: 'R',
    24: 'Y',
    21: 'Z',
    18: 'E',
    15: 'P',
    12: 'T',
    9: 'G',
    6: 'M',
    3: 'k',
    2: 'h',
    1: 'da',
    0: '',
  };

  static const Map<int, String> lower = {
    -1: 'd',
    -2: 'c',
    -3: 'm',
    -6: 'µ',
    -9: 'n',
    -12: 'p',
    -15: 'f',
    -18: 'a',
    -21: 'z',
    -24: 'y',
    -27: 'r',
    -30: 'q',
  };

  int get magnitude =>
      this == 0 || isNaN || isInfinite ? 0 : log(abs()) ~/ ln10;

  int get order {
    final m = magnitude;
    final u = upper.keys.firstWhereOptional((u) => m >= u);
    if (u.isPresent) {
      return u.value;
    }
    return lower.keys.firstWhereOptional((l) => m >= l).value;
  }

  String symbol([int? order, int min = 3]) {
    final o = order ?? this.order;
    return o.abs() < min ? '' : (o >= 0 ? upper[o] : lower[o]) ?? '';
  }

  String toPower([int orderDigits = 2]) =>
      format(ValueUnit.power.symbol, orderDigits: orderDigits);
  String toEnergy([int orderDigits = 2]) =>
      format(ValueUnit.energy.symbol, orderDigits: orderDigits);
  String toVoltage([int orderDigits = 2]) =>
      format(ValueUnit.voltage.symbol, orderDigits: orderDigits);
  String toTemperature([int orderDigits = 0]) => format(
        ValueUnit.temperature.symbol,
        orderDigits: orderDigits,
        withOrder: false,
      );
  String toPrice(String currency, [int fractionDigits = 2]) {
    return '${toStringAsFixed(fractionDigits)} $currency';
  }

  String format(String unit,
      {int orderDigits = 2, int orderMin = 3, bool withOrder = true}) {
    final o = order;
    final s = withOrder ? symbol(o, orderMin) : '';
    final b = (o == 0 || s.isEmpty ? this : this / pow(10, o));
    final d = withOrder ? (o.abs() < orderMin ? 0 : orderDigits) : orderDigits;
    return [b.toStringAsFixed(d), '$s${ValueUnit.symbolOf(unit)}'].join(' ');
  }
}

extension UnitInListX<T extends num> on List<T> {
  String toPower({int? index, int orderDigits = 2}) =>
      format(ValueUnit.power.symbol, index: index, orderDigits: orderDigits);

  String toEnergy({int? index, int orderDigits = 2}) =>
      format(ValueUnit.energy.symbol, index: index, orderDigits: orderDigits);

  String toVoltage({int? index, int orderDigits = 2}) =>
      format(ValueUnit.voltage.symbol, index: index, orderDigits: orderDigits);

  String toTemperature({int? index, int orderDigits = 2}) => format(
        ValueUnit.temperature.symbol,
        index: index,
        withOrder: false,
        orderDigits: orderDigits,
      );

  String toPrice(String currency, {int? index, int fractionDigits = 2}) =>
      (isEmpty ? 0 : this[min(length - 1, index ?? length - 1)])
          .toPrice(currency, fractionDigits);

  String format(String unit,
      {int? index,
      int orderDigits = 2,
      int orderMin = 3,
      bool withOrder = true}) {
    final raw = isEmpty ? 0 : this[index ?? length - 1];
    return raw.format(
      unit,
      orderDigits: orderDigits,
      orderMin: orderMin,
      withOrder: withOrder,
    );
  }
}

/*
Sunlight	            107,527
Shade on a sunny day	10,752
Overcast day	        1,075
Very dark day	        107
Twilight	            10.8
Deep twilight	        1.08
Full moon	            0.108
Quarter moon	        0.0108
Starlight	            0.0011
Overcast night	      0.0001
 */

enum Illuminance {
  none(-1, 'None'),
  dark(0, 'Total darkness'),
  overcastNight(0.0001, 'Overcast Night'),
  starlightMoon(0.0011, 'Starlight Moon'),
  quarterMoon(0.0108, 'Quarter Moon'),
  fullMoon(0.108, 'Full Moon'),
  deepTwilight(1.08, 'Deep Twilight'),
  twilight(10.8, 'Twilight'),
  darkDay(107, 'Dark Day'),
  overcastDay(1075, 'Overcast Day'),
  shadyDay(10752, 'Shady Day'),
  sunlight(107527, 'Sunlight');

  const Illuminance(this.lux, this.description);

  final double lux;
  final String description;

  static Illuminance of(int lux) {
    for (int i = 0; i < values.length - 1; i++) {
      if (values[i].lux <= lux && values[i + 1].lux >= lux) {
        return values[i];
      }
    }
    return none;
  }
}
