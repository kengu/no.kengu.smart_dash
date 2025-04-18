import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dash_analytics/smart_dash_analytics.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

part 'time_series.freezed.dart';
part 'time_series.g.dart';

/// The [TimeSeries] class is a representation of
/// a series of data points indexed in time order.
@freezed
sealed class TimeSeries with _$TimeSeries {
  const TimeSeries._();
  const factory TimeSeries({
    /// Get the time series's name
    required String name,

    /// Get the time series's data array
    required DataArray array,

    /// Get the time series's [DateTime] offset from epoch
    required DateTime offset,

    /// Get duration between each coordinate
    required Duration span,
  }) = _TimeSeries;

  /// Test if [array] is empty
  bool get isEmpty => array.isEmpty;

  /// Test if [array] is not empty
  bool get isNotEmpty => array.isNotEmpty;

  /// Get number of columns in array (length of data in rows)
  int get width => array.width;

  /// Get length of data in columns (number of rows)
  int get length => array.length;

  /// Check if array is uni-variate (length = 1)
  bool get isVector => array.isVector;

  /// Check if array is multi-variate (length > 1)
  bool get isMatrix => array.isMatrix;

  /// Test if every column (list of numbers) has
  /// length equal to coords [length]
  bool get isValid => array.isValid;

  List<num> get firstRow => array.firstRow;

  /// Get last array row (same as rowAt(length-1))
  List<num> get lastRow => array.lastRow;

  /// Get first array column (same as array[0])
  List<num> get firstColumn => array.firstColumn;

  /// Get last array column (same as array[width-1])
  List<num> get lastColumn => array.lastColumn;

  /// Get last timestamp (same as tsAt(length-1))
  DateTime get end => offset.tsAt(length - 1, span);

  /// Get the duration between [end] and [offset]
  Duration get duration => end.difference(offset);

  /// Get [DateTime] at coordinate position given by [index]
  DateTime tsAt(int index, [bool end = true]) => offset.tsAt(index, span, end);

  /// Get row as list of length equal to [width] at given coordinate [index].
  /// ```text
  /// Example:
  ///                               |       width       |
  ///        Index       Ts         A         B         C
  /// 0 2012-01-01 00:00:00 -0.033823 -0.121514 -0.081447
  /// 0 2012-01-01 00:03:00  0.056909  0.146731 -0.024320
  /// ```
  /// where
  List<num> rowAt(int index) => array.rowAt(index);

  /// Get column at dimension [index] (same as array[index])
  List<num> columnAt(int index) => array[index];

  /// Get coordinate index at given timestamp [ts].
  int indexAt(DateTime ts, [bool end = true]) => offset.indexAt(ts, span, end);

  /// Get coordinate index at timestamp [DateTime.now()].
  int indexNow([bool end = true]) => max(0, indexAt(DateTime.now(), end) - 1);

  /// Get column data at dimension [index]
  List<num> operator [](int index) => array[index];

  factory TimeSeries.fromJson(Map<String, Object?> json) =>
      _$TimeSeriesFromJson(json);

  static TimeSeries empty(
    String name, {
    int size = 1,
    DateTime? offset,
    Duration? span,
    List<JsonObject> dims = const [],
  }) =>
      TimeSeries(
        name: name,
        offset: offset ?? DateTime.now(),
        span: span ?? TimeScale.minutes.to(),
        array: DataArray.size(1, dims),
      );
}
