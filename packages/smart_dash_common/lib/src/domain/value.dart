enum ValueType {
  int,
  bool,
  double;

  static ValueType of(String? name) => values.firstWhere((e) => e.name == name);
}

extension ValueTypeX on ValueType {
  Object tryParse(Object value) {
    switch (this) {
      case ValueType.int:
        return num.tryParse(
          value.toString(),
        )?.toInt() ??
            0;
      case ValueType.bool:
        return bool.tryParse(
          value.toString(),
          caseSensitive: false,
        ) ??
            false;
      case ValueType.double:
        return double.tryParse(
          value.toString(),
        ) ??
            0.0;
    }
  }
}