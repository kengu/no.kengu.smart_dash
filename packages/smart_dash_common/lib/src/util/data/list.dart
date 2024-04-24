import 'dart:math';
import 'dart:typed_data';

extension ListX<T> on List<T> {
  bool get isListNum => runtimeType.toString() == 'List<num>';
  bool get isListInt => runtimeType.toString() == 'List<int>';
  bool get isListDouble => runtimeType.toString() == 'List<double>';

  /// Insert [count] padding values at given column [index]
  List<T> padAt(int index, int count, T value) {
    assert(index > -1, 'Negative index');
    final offset = min(length, index);
    final data = toList();
    if (data is! Iterable<Never>) {
      data.insertAll(
        offset,
        List<T>.generate(count, (_) => value),
      );
    }
    return data;
  }

  Uint8List toUint8List() {
    if (isEmpty) {
      return Uint8List.fromList([]);
    }
    if (isListInt || this[0] is int) {
      return Uint8List.fromList(this as List<int>);
    }
    final uint8List = Uint8List(8 * length);
    final bytes = ByteData.view(uint8List.buffer);
    for (int i = 0; i < length; i++) {
      bytes.setFloat64(i * 8, this[i] as double);
    }
    return uint8List;
  }
}

extension Uint8ListX on Uint8List {
  List<double> toListOfDouble() {
    final bytes = ByteData.view(buffer);
    return List.generate(
        (length / 8).round(), (index) => bytes.getFloat64(index * 8));
  }
}

List<List<T>> generateArray<T>(int width) {
  return List<List<T>>.generate(width, (_) => <T>[]);
}
