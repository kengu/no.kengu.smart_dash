import 'package:smart_dash_common/smart_dash_common.dart';

class Tag<T> {
  Tag({
    required this.data,
    required this.when,
    required this.token,
  }) {
    assert(
      token.isType(data),
      'Token type [${token.type}] for [${token.name}] does not match data type [$type]',
    );
  }

  final T data;
  final Token token;
  final DateTime when;
  Type get type => typeOf<T>();
  String get name => token.name;

  bool isInt() => this.data is int;
  bool isBool() => this.data is bool;
  bool isNumber() => this.data is num;
  bool isDouble() => this.data is double;
  bool isType<E>() => this is Tag<E>;

  String toStringValue() {
    switch (token.type) {
      case ValueType.bool:
        return data.toString();
      case ValueType.int:
        return (data as int).format(token.unit.symbol);
      case ValueType.double:
        return (data as double).format(token.unit.symbol);
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Tag &&
          runtimeType == other.runtimeType &&
          token == other.token &&
          data == other.data;

  @override
  int get hashCode => token.hashCode ^ data.hashCode;

  @override
  String toString() {
    return 'FlowTag{token: ${token.name}, data: $data}';
  }
}
