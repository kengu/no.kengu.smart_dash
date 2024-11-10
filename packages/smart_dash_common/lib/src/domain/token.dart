import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

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

    /// Get token capability
    required Capability capability,
  }) = _Token;

  ValueType get type => capability.type;
  ValueUnit get unit => capability.unit;

  bool isType<T>(T data) => switch (type) {
        ValueType.int => data is int,
        ValueType.bool => data is bool,
        ValueType.double => data is double,
      };

  factory Token.fromJson(Map<String, Object?> json) => _$TokenFromJson(json);

  static toName(String variable, String service, String type, String id) {
    return [variable, service, type, id].join(':');
  }
}

extension TokenX on Token {
  bool get isRain => unit == ValueUnit.rain;
  bool get isValue => unit == ValueUnit.any;
  bool get isOnOff => unit == ValueUnit.onOff;
  bool get isPower => unit == ValueUnit.power;
  bool get isEnergy => unit == ValueUnit.energy;
  bool get isVoltage => unit == ValueUnit.voltage;
  bool get isHumidity => unit == ValueUnit.humidity;
  bool get isRainRate => unit == ValueUnit.rainRate;
  bool get isRainTotal => unit == ValueUnit.rainTotal;
  bool get isWindAngle => unit == ValueUnit.windAngle;
  bool get isWindSpeed => unit == ValueUnit.windSpeed;
  bool get isGustSpeed => unit == ValueUnit.gustSpeed;
  bool get isLuminance => unit == ValueUnit.luminance;
  bool get isTemperature => unit == ValueUnit.temperature;
}
