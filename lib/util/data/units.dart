import 'dart:math';

import 'package:optional/optional.dart';

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

  int get magnitude => this == 0 || isNaN || isInfinite ? 0 : log(this) ~/ ln10;

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

  String format(String unit, [int orderDigits = 2, int orderMin = 3]) {
    final o = order;
    final s = symbol(o, orderMin);
    final b = (o == 0 || s.isEmpty ? this : this / pow(10, o));
    final d = o.abs() < orderMin ? 0 : orderDigits;
    return [b.toStringAsFixed(d), '$s$unit'].join(' ');
  }
}

extension UnitInListX<T extends num> on List<T> {
  String power([int? index, int fractionDigits = 2]) =>
      format('W', index, fractionDigits);
  String energy([int? index, int fractionDigits = 2]) =>
      format('Wh', index, fractionDigits);
  String voltage([int? index, int fractionDigits = 2]) =>
      format('V', index, fractionDigits);
  String price(String currency, [int? index, int fractionDigits = 2]) {
    final raw = isEmpty ? 0 : this[min(length - 1, index ?? length - 1)];
    return '${raw.toStringAsFixed(fractionDigits)} $currency';
  }

  String format(String unit, [int? index, int fractionDigits = 2]) {
    final raw = isEmpty ? 0 : this[index ?? length - 1];
    return raw.format(unit, fractionDigits);
  }
}
