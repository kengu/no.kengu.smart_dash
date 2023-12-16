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

extension NumListX<T extends num> on List<T> {
  T min() =>
      isEmpty ? 0.cast<T>() : map((value) => value.cast<T>()).reduce(math.min);
  T max() =>
      isEmpty ? 0.cast<T>() : map((value) => value.cast<T>()).reduce(math.max);
  T avg() => isEmpty
      ? 0.cast<T>()
      : map((value) => value.cast<T>())
          .reduce((sum, next) => ((sum + next) / length).cast<T>());
  T sum() => isEmpty
      ? 0.cast<T>()
      : map((value) => value.cast<T>())
          .reduce((prev, next) => (prev + next).cast());

  int minAt() => isEmpty ? -1 : indexOf(min());
  int maxAt() => isEmpty ? -1 : indexOf(max());

  int lastMinAt() => isEmpty ? -1 : lastIndexOf(min());
  int lastMaxAt() => isEmpty ? -1 : lastIndexOf(max());

  Iterable<E> to<E extends num>() => map((d) => d.cast<E>());
}
