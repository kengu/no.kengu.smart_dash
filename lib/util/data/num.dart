import 'dart:math' as math;

extension NumX on num {
  bool get isInt => runtimeType.toString() == 'int';
  bool get isDouble => runtimeType.toString() == 'double';

  T cast<T extends num>() {
    if ('$T'[0] == 'i') {
      return toInt() as T;
    }
    if ('$T'[0] == 'd') {
      return toDouble() as T;
    }
    return this as T;
  }
}

extension NumIterableX<T extends num> on Iterable<T> {
  T min() =>
      isEmpty ? 0.cast<T>() : map((value) => value.cast<T>()).reduce(math.min);
  T max() =>
      isEmpty ? 0.cast<T>() : map((value) => value.cast<T>()).reduce(math.max);
  T avg() {
    if (isEmpty) {
      return 0.cast<T>();
    }
    if (length == 1) {
      return first;
    }
    return (sum() / length) as T;
  }

  T sum() => isEmpty
      ? 0.cast<T>()
      : map((value) => value.cast<T>())
          .reduce((prev, next) => (prev + next).cast());

  Iterable<E> to<E extends num>() => map((d) => d.cast<E>());
}

extension NumListX<T extends num> on List<T> {
  int minAt() => isEmpty ? -1 : indexOf(min());
  int maxAt() => isEmpty ? -1 : indexOf(max());

  int lastMinAt() => isEmpty ? -1 : lastIndexOf(min());
  int lastMaxAt() => isEmpty ? -1 : lastIndexOf(max());
}
