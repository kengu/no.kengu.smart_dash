import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dash/feature/analytics/application/history_manager.dart';
import 'package:smart_dash/feature/analytics/domain/data_array.dart';
import 'package:smart_dash/feature/analytics/domain/time_series.dart';
import 'package:smart_dash/util/time/time_scale.dart';
import 'package:smart_dash/util/time/time_series.dart';

part 'token.freezed.dart';
part 'token.g.dart';

sealed class Tokens {
  static const power = Token(
    name: 'power',
    type: TokenType.number,
    unit: TokenUnit.power,
  );

  static const energy = Token(
    name: 'energy',
    type: TokenType.number,
    unit: TokenUnit.energy,
  );

  static const voltage = Token(
    name: 'voltage',
    type: TokenType.number,
    unit: TokenUnit.voltage,
  );

  static const temperature = Token(
    name: 'temperature',
    type: TokenType.number,
    unit: TokenUnit.temperature,
  );

  static const system = [energy, power, voltage, temperature];

  static bool isSystemToken(Token token) => system.contains(token);

  static int indexOfSystemToken(String name) =>
      system.indexWhere((t) => t.name == name);

  static Token from(String name) => system.firstWhere((t) => t.name == name);
}

/// The [Token] class is a representation of
/// typed variables.
@freezed
class Token with _$Token {
  const Token._();

  const factory Token({
    /// Get token name
    required String name,

    /// Get token type
    required TokenType type,

    /// Get token unit
    required TokenUnit unit,
  }) = _Token;

  TimeSeries emptyTs([Duration? span]) => TimeSeries(
        name: name,
        offset: DateTime.now(),
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
  bool,
  number,
  string,
}

enum TokenUnit {
  voltage('V'),
  energy('W'),
  power('Wh'),
  temperature('°C');

  bool get isPower => this == power;
  bool get isEnergy => this == energy;
  bool get isVoltage => this == voltage;
  bool get isTemperature => this == temperature;

  static String symbolOf(String token) =>
      values.where((e) => e.name == token).firstOrNull?.symbol ?? token;

  const TokenUnit(this.symbol);

  final String symbol;
}

extension TokenX on Token {
  bool get isPower => unit == TokenUnit.power;
  bool get isEnergy => unit == TokenUnit.energy;
  bool get isVoltage => unit == TokenUnit.voltage;
  bool get isTemperature => unit == TokenUnit.temperature;
  bool get isSystemToken => Tokens.isSystemToken(this);
}
