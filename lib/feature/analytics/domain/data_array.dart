import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dash/util/data/json.dart';

part 'data_array.freezed.dart';
part 'data_array.g.dart';

/// The [DataArray] class is a representation of
/// a series of data points indexed in time order.
/// Every column (list of numbers) should be of
/// length equal to [coords] length. Use [isValid]
/// to test if all lengths are equal.
@freezed
class DataArray with _$DataArray {
  const DataArray._();
  const factory DataArray(
    /// Get the array's data (organized in
    /// columns). Each column is also known as
    /// a dimension.
    List<List<num>> data, {
    /// Get the array's coordinates
    /// (tick labels) to use for indexing
    /// along each dimension
    required List<JsonObject> coords,

    /// Get the array's name(s) of the data dimension(s)
    required List<JsonObject> dims,
  }) = _DataArray;

  bool get isNotEmpty => !isEmpty;
  bool get isEmpty => data.isEmpty || data.every((column) => column.isEmpty);

  /// Get number of columns in array (row length)
  int get width => data.length;

  /// Get length of data in column(s)
  int get length => isNotEmpty && data.first.isNotEmpty ? data.first.length : 0;

  /// Check if array is uni-variate (length = 1)
  bool get isVector => data.length == 1;

  /// Check if array is multi-variate (length > 1)
  bool get isMatrix => data.length > 1;

  /// Test if every column (list of numbers) has
  /// length equal to coords [length]
  bool get isValid => data.every((column) => column.length == length);

  /// Get first array row (same as rowAt(0))
  List<num> get firstRow => rowAt(0);

  /// Get last array row (same as rowAt(length-1))
  List<num> get lastRow => rowAt(length - 1);

  /// Get row as list of length equal to [width] at given coordinate
  List<num> rowAt(int index) => data
      .where((column) => column.isNotEmpty && column.length > index)
      .map((column) => column[index])
      .toList();

  /// Get first array column (same as data[0])
  List<num> get firstColumn => data.first;

  /// Get last array column (same as data[0])
  List<num> get lastColumn => data.last;

  /// Get column data at dimension [index]
  List<num> operator [](int index) => data[index];

  factory DataArray.empty(List<JsonObject> dims) =>
      DataArray([], coords: [], dims: dims);

  factory DataArray.size(int width, List<JsonObject> dims) => DataArray(
        List.generate(width, (index) => []),
        coords: [],
        dims: dims,
      );

  factory DataArray.fromVector(
    Iterable<num> data, {
    required List<JsonObject> coords,
    required List<JsonObject> dims,
  }) =>
      DataArray(
        [data.toList()],
        coords: coords,
        dims: dims,
      );

  factory DataArray.fromJson(Map<String, Object?> json) =>
      _$DataArrayFromJson(json);
}
