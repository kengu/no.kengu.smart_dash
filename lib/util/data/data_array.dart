import 'package:smart_dash/feature/analytics/domain/data_array.dart';
import 'package:smart_dash/util/data/list.dart';

extension DataArrayX on DataArray {
  /// Insert [count] padding values at given column [index]
  DataArray padAt<T extends num>(int index, int count, T value) {
    assert(width > 0, 'Empty DataArray');
    assert(index > -1, 'Negative index');
    final array = <List<T>>[];
    for (var i = 0; i < width; i++) {
      array.add(
        data[i].cast<T>().padAt(index, count, value),
      );
    }
    return DataArray(
      array,
      dims: dims,
      coords: coords.padAt(index, count, {}),
    );
  }

  /// Remove data range from all columns
  DataArray removeAt(int index) {
    assert(width > 0, 'Empty DataArray');
    assert(index > -1, 'Negative index');
    final array = <List<num>>[];
    for (var i = 0; i < width; i++) {
      array.add(
        data[i].toList()..removeAt(index),
      );
    }
    return DataArray(
      array,
      dims: dims,
      coords: coords.toList()..removeAt(index),
    );
  }

  /// Remove data range from all columns
  DataArray removeRange(int start, int end) {
    assert(width > 0, 'Empty DataArray');
    assert(start > -1, 'Negative index: start');
    assert(end > -1, 'Negative index: end');
    final array = <List<num>>[];
    for (var i = 0; i < width; i++) {
      array.add(
        data[i].toList()..removeRange(start, end),
      );
    }
    return DataArray(
      array,
      dims: dims,
      coords: coords.toList()..removeRange(start, end),
    );
  }
}
