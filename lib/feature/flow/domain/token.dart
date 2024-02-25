import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dash/feature/analytics/application/history_manager.dart';
import 'package:smart_dash/feature/analytics/domain/data_array.dart';
import 'package:smart_dash/feature/analytics/domain/time_series.dart';
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
}

enum TokenUnit {
  onOff(''),
  count(''),
  power('W'),
  rain('mm'),
  energy('Wh'),
  voltage('V'),
  humidity('%'),
  windAngle('°'),
  luminance('lx'),
  windSpeed('m/s'),
  gustSpeed('m/s'),
  ultraviolet('uvi'),
  temperature('°C');

  bool get isRain => this == rain;
  bool get isCount => this == count;
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

  static String symbolOf(String token) =>
      values.where((e) => e.name == token).firstOrNull?.symbol ?? token;

  const TokenUnit(this.symbol);

  final String symbol;
}

extension TokenX on Token {
  bool get isRain => unit == TokenUnit.rain;
  bool get isCount => unit == TokenUnit.count;
  bool get isOnOff => unit == TokenUnit.onOff;
  bool get isPower => unit == TokenUnit.power;
  bool get isEnergy => unit == TokenUnit.energy;
  bool get isVoltage => unit == TokenUnit.voltage;
  bool get isHumidity => unit == TokenUnit.humidity;
  bool get isWindAngle => unit == TokenUnit.windAngle;
  bool get isWindSpeed => unit == TokenUnit.windSpeed;
  bool get isGustSpeed => unit == TokenUnit.gustSpeed;
  bool get isLuminance => unit == TokenUnit.luminance;
  bool get isTemperature => unit == TokenUnit.temperature;
}
