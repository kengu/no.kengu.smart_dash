import 'package:freezed_annotation/freezed_annotation.dart';

part 'token.freezed.dart';
part 'token.g.dart';

/// The [Token] class is a representation of
/// typed variables.
@freezed
class Token with _$Token {
  const factory Token({
    /// Get token name
    required String name,

    /// Get token type
    required TokenType type,

    /// Get token unit
    required TokenUnit unit,
  }) = _Token;

  factory Token.fromJson(Map<String, Object?> json) => _$TokenFromJson(json);
}

enum TokenType {
  bool,
  number,
  string,
}

enum TokenUnit {
  volt,
  watt,
  wattHour,
}
