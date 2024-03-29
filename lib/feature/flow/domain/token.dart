import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dash/feature/analytics/application/history_manager.dart';
import 'package:smart_dash/feature/analytics/domain/data_array.dart';
import 'package:smart_dash/feature/analytics/domain/time_series.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/util/time/time_scale.dart';
import 'package:smart_dash/util/time/time_series.dart';

part 'token.freezed.dart';
part 'token.g.dart';

typedef TokenMap = Map<String, Token>;

/// The [Token] class is a representation of typed variables.
@freezed
class Token with _$Token {
  const Token._();

  const factory Token({
    /// Get token tag
    required String tag,

    /// Get token name
    required String name,

    /// Get token label
    required String label,

    /// Get token type
    required TokenType type,

    /// Get token unit
    required TokenUnit unit,

    /// Get device capability
    required DeviceCapability capability,
  }) = _Token;

  bool isType<T>(T data) => switch (type) {
        TokenType.int => data is int,
        TokenType.bool => data is bool,
        TokenType.double => data is double,
      };

  TimeSeries emptyTs({DateTime? offset, Duration? span}) => TimeSeries(
        name: name,
        offset: offset ?? DateTime.now(),
        span: span ?? TimeScale.minutes.to(),
        array: DataArray.size(1, [
          toJson(),
        ]),
      );

  TimeSeries toTs(HistoryEvent? event, [int size = 90]) {
    if (event != null && event.token == this) {
      return event.data.clamp(size, size, pad: 0);
    }
    return emptyTs();
  }

  factory Token.fromJson(Map<String, Object?> json) => _$TokenFromJson(json);
}

enum TokenType {
  int,
  bool,
  double;

  static TokenType of(String? name) => values.firstWhere((e) => e.name == name);
}

extension TokenTypeX on TokenType {
  Object tryParse(Object value) {
    switch (this) {
      case TokenType.int:
        return num.tryParse(
              value.toString(),
            )?.toInt() ??
            0;
      case TokenType.bool:
        return bool.tryParse(
              value.toString(),
              caseSensitive: false,
            ) ??
            false;
      case TokenType.double:
        return double.tryParse(
              value.toString(),
            ) ??
            0.0;
      default:
        return value;
    }
  }
}

enum TokenUnit {
  value(''),
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
  bool get isValue => this == value;
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

  static TokenUnit of(String name) => values.firstWhere((e) => e.name == name);

  static String symbolOf(String token) =>
      values.where((e) => e.name == token).firstOrNull?.symbol ?? token;

  const TokenUnit(this.symbol);

  final String symbol;
}

extension TokenX on Token {
  bool get isRain => unit == TokenUnit.rain;
  bool get isValue => unit == TokenUnit.value;
  bool get isOnOff => unit == TokenUnit.onOff;
  bool get isPower => unit == TokenUnit.power;
  bool get isEnergy => unit == TokenUnit.energy;
  bool get isVoltage => unit == TokenUnit.voltage;
  bool get isHumidity => unit == TokenUnit.humidity;
  bool get isRainRate => unit == TokenUnit.rainRate;
  bool get isRainTotal => unit == TokenUnit.rainTotal;
  bool get isWindAngle => unit == TokenUnit.windAngle;
  bool get isWindSpeed => unit == TokenUnit.windSpeed;
  bool get isGustSpeed => unit == TokenUnit.gustSpeed;
  bool get isLuminance => unit == TokenUnit.luminance;
  bool get isTemperature => unit == TokenUnit.temperature;
}
