import 'package:smart_dash/feature/flow/domain/token.dart';

class Tokens {
  static const power = Token(
    name: 'power',
    type: TokenType.number,
    unit: TokenUnit.watt,
  );

  static const energy = Token(
    name: 'energy',
    type: TokenType.number,
    unit: TokenUnit.wattHour,
  );

  static const voltage = Token(
    name: 'voltage',
    type: TokenType.number,
    unit: TokenUnit.volt,
  );

  static const system = [energy, power, voltage];

  static bool isPower(Token token) => token == power;
  static bool isEnergy(Token token) => token == energy;
  static bool isVoltage(Token token) => token == voltage;
  static bool isSystemToken(Token token) => system.contains(token);

  static int indexOfSystemToken(String name) =>
      system.indexWhere((t) => t.name == name);

  static Token from(String name) => system.firstWhere((t) => t.name == name);
}

extension TokenX on Token {
  bool get isPower => Tokens.isPower(this);
  bool get isEnergy => Tokens.isEnergy(this);
  bool get isVoltage => Tokens.isVoltage(this);
  bool get isSystemToken => Tokens.isSystemToken(this);
}
