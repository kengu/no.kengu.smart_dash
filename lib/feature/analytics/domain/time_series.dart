import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dash/feature/analytics/domain/data_array.dart';
import 'package:smart_dash/util/time/date_time.dart';

part 'time_series.freezed.dart';
part 'time_series.g.dart';

/// The [TimeSeries] class is a representation of
/// a series of data points indexed in time order.
@freezed
class TimeSeries with _$TimeSeries {
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

  /// Get length of data in column(s)
  int get length => array.length;

  /// Get number of columns in array (row length)
  int get width => array.width;

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

  /// Get first array column (same as data[0])
  List<num> get firstColumn => array.firstColumn;

  /// Get last array column (same as data[0])
  List<num> get lastColumn => array.lastColumn;

  /// Get last array column (same as tsAt(length-1))
  DateTime get end => offset.tsAt(length - 1, span);

  /// Get the duration between [end] and [offset]
  Duration get duration => end.difference(offset);

  /// Get [DateTime] at coordinate position given by [index]
  DateTime tsAt(int index, [bool end = true]) => offset.tsAt(index, span, end);

  /// Get row as list of length equal to [width] at given coordinate
  List<num> rowAt(int index) => array.rowAt(index);

  /// Get coordinate index at given timestamp [ts].
  int indexAt(DateTime ts, [bool end = true]) => offset.indexAt(ts, span, end);

  /// Get coordinate index at timestamp [DateTime.now()].
  int indexNow([bool end = true]) => max(0, indexAt(DateTime.now(), end) - 1);

  /// Get column data at dimension [index]
  List<num> operator [](int index) => array[index];

  factory TimeSeries.fromJson(Map<String, Object?> json) =>
      _$TimeSeriesFromJson(json);
}
