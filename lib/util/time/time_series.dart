import 'dart:math' as math;

import 'package:logging/logging.dart';
import 'package:smart_dash/feature/analytics/domain/data_array.dart';
import 'package:smart_dash/feature/analytics/domain/time_series.dart';
import 'package:smart_dash/util/data/data_array.dart';
import 'package:smart_dash/util/time/date_time.dart';
import 'package:smart_dash/util/time/duration.dart';
import 'package:smart_dash/util/data/json.dart';
import 'package:smart_dash/util/data/list.dart';
import 'package:smart_dash/util/data/num.dart';
import 'package:smart_dash/util/time/time_scale.dart';

final _log = Logger('$TimeSeries');

extension TimeSeriesX on TimeSeries {
  TimeScale get scale => TimeScale.from(span);

  /// Clamp [TimeSeries] to [min,max]-range.
  /// If [length] is less than [min], [length-min]
  /// [pad] values are inserted to beginning of
  /// history (also known as head and first element
  /// of a list). When [head] is [true] (default),
  /// and [length] is greater than [max], [max-length]
  /// elements are removed from beginning of history.
  /// Otherwise, elements are removed from end of
  /// history.
  TimeSeries clamp<T extends num>(
    int min,
    int max, {
    required T pad,
    bool head = true,
  }) {
    assert(max >= min, 'min is greater than max');
    if (width > 0) {
      if (length < min) {
        return _padHead<T>(
          min,
          pad,
        );
      }
      if (max > min && length > max) {
        // Clamp series to max length
        return head ? _clampHead(max) : _clampTail(max);
      }
    }
    return this;
  }

  /// Pad list on left side (first element is head of list)
  TimeSeries _padHead<T extends num>(int min, pad) {
    final delta = min - length;
    // Add padding before current beginning of history
    final ts0 = offset.tsAt(-delta, span);
    final data = array.padAt<T>(0, delta, pad);
    return TimeSeries(
      name: name,
      span: span,
      array: data,
      offset: ts0,
    );
  }

  /// Clamp history from left (first element is head of list)
  TimeSeries _clampHead(int max) {
    final delta = length - max;
    final ts0 = offset.tsAt(delta, span);
    final data = array.removeRange(0, delta);
    return TimeSeries(
      name: name,
      span: span,
      array: data,
      offset: ts0,
    );
  }

  /// Clamp history from right (last element is tail of list)
  TimeSeries _clampTail(int max) {
    final delta = length - max;
    final ts0 = end.tsAt(-delta, span);
    final data = array.removeRange(max, length);
    return TimeSeries(
      name: name,
      span: span,
      array: data,
      offset: ts0,
    );
  }

  TimeSeries select<T extends num>(
          {Duration? span, int begin = 0, bool tail = true}) =>
      fold<T>(tail ? _tail : _head, span: span, begin: begin);
  static T _head<T>(_, __, value, List<T> inside) =>
      inside.isEmpty ? value : inside.first;
  static T _tail<T>(_, __, value, List<T> inside) =>
      inside.isEmpty ? value : inside.last;

  TimeSeries max<T extends num>({Duration? span, int begin = 0}) =>
      fold<T>(_max, span: span, begin: begin);
  static T _max<T extends num>(_, __, T value, List<T> inside) =>
      math.max(value, inside.max());

  TimeSeries min<T extends num>({Duration? span, int begin = 0}) =>
      fold<T>(_min, span: span, begin: begin);
  static T _min<T extends num>(_, __, T value, List<T> inside) =>
      math.min(value, inside.min());

  TimeSeries avg<T extends num>(
      {Duration? span, int begin = 0, bool cum = true}) {
    final series = fold<T>(cum ? _avgCum : _avg, span: span, begin: begin);
    return series.length == 1 ? this : series;
  }

  static T _avg<T extends num>(_, __, ___, List<T> inside) => inside.avg();

  static T _avgCum<T extends num>(_, int row, T value, List<T> inside) {
    final int span = inside.length;
    final int n = (row + 1) ~/ span;
    // Calculating moving average, see https://math.stackexchange.com/a/106720
    return (value + (inside.avg() - value) / n) as T;
  }

  TimeSeries sum<T extends num>(
          {Duration? span, int begin = 0, bool cum = true}) =>
      fold<T>(
        cum ? _sumCum : _sum,
        span: span,
        begin: begin,
        initial: List<T>.generate(width, (index) => 0.cast<T>()),
      );
  static T _sum<T extends num>(_, __, value, List<T> inside) => inside.sum();

  static T _sumCum<T extends num>(_, __, value, List<T> inside) =>
      value + inside.sum();

  TimeSeries zeros({Duration? span, int begin = 0}) => fold(
        _zeros,
        span: span,
        begin: begin,
        initial: List.generate(width, (index) => 0),
      );
  static int _zeros<T extends num>(_, __, int value, List<T> inside) =>
      value + inside.where((e) => e == (0 as T)).length;

  TimeSeries group<T extends num>({Duration? span, int begin = 0}) => fold<T>(
        _group,
        span: span,
        begin: begin,
        initial: List<T>.generate(width, (index) => 0.cast<T>()),
      );
  static T _group<T extends num>(_, __, value, List<T> inside) => inside.sum();

  TimeSeries fold<T extends num>(
    T Function(int column, int row, T value, List<T> inside) toElement, {
    Duration? span,
    int begin = 0,
    List<T>? initial,
  }) {
    if (isEmpty) return this;

    final hSpan = span ?? this.span;
    final scaled = hSpan.to() != TimeScale.from(this.span);

    final coords = <JsonObject>[];
    final data = generateArray<T>(width);

    final tailCoords = <JsonObject>[];
    final tailData = generateArray<T>(width);

    var ts0 = tsAt(begin);
    var row0 = initial ?? rowAt(begin);
    var init = List.generate(width, (index) => true);

    // Loop over all rows
    for (int i = begin; i < length; i++) {
      final ts = tsAt(i);
      final row = rowAt(i);
      final delta = ts.difference(ts0);

      // First element is always selected
      final isWithin = i >= begin && hSpan.isWithin(scale, delta);

      // Loop over all columns (dimensions) in i-th row
      for (int j = 0; j < width; j++) {
        tailData[j].add(row[j].cast<T>());
        if (!isWithin) {
          final value = toElement(
            j,
            i,
            row0[j].cast<T>(),
            init[j]
                ? tailData[j].sublist(0, tailData[j].length - 1)
                : tailData[j],
          );

          data[j].add(value);

          ts0 = ts;
          row0[j] = value;
          init[j] = false;
        }
      }

      final same = init.first || scaled && i >= length - 1 || !scaled;
      final coord = array.coords[same ? i : i - 1];

      if (!scaled || !isWithin) {
        coords.add(coord);
      }

      if (!isWithin) {
        tailData.clear();
        tailCoords.clear();
        tailData.addAll(generateArray<T>(width));
      }
      tailCoords.add(coord);
    }

    // Last element is always folded
    if (tailCoords.isNotEmpty) {
      for (int j = 0; j < width; j++) {
        tailData[j].add(lastRow[j].cast<T>());
        data[j].add(
          toElement(j, length - 1, row0[j].cast<T>(), tailData[j]),
        );
      }
      if (scaled) {
        coords.add(tailCoords.last);
      }
    }

    return TimeSeries(
      name: name,
      span: hSpan,
      offset: tsAt(begin),
      array: array.copyWith(
        data: data,
        coords: coords,
      ),
    );
  }

  TimeSeries record<T extends num>(
    T value,
    DateTime ts, {
    int index = 0,
    int min = 1,
    int max = 1,
    T? pad,
  }) {
    var begin = offset;

    // Define array components for next time series
    var coords = array.coords.toList();
    var data = isEmpty ? <T>[] : this[index].toList().cast<T>();

    // Lookup point index relative to current offset
    final point = begin.indexAt(ts, span, true);

    // Within [offset,end]?
    if (point >= 0 && point < length) {
      /*
      debugPrint(
        'record($name): REPLACE [$point][1](length:${data.length}) ${data[point]} <- $value @ $ts ',
      );
      */

      // Replace existing point (index is within [offset,end])
      data[point] = value;
      coords[point] = {'ts': ts.millisecondsSinceEpoch};

      return _next<T>(begin, data, coords, min, max, pad, value);
    }

    // After [offset,end]?
    if (point >= length) {
      final delta = point - length;

      if (delta > 1) {
        // Insert padding values between (after) end and new value
        final padding = delta;
        final padFrom = length;
        data = data.padAt(padFrom, padding, pad ?? value);
        coords = coords.padAt(padFrom, padding, {});
        _log.fine(
          'record($name): PAD [$padFrom][$padding](length:${data.length}) '
          '${pad ?? value} @ $ts [$end](+${ts.difference(end).inSeconds} s)',
        );
      }

      // Addend point to end (tail) of timeseries
      data.add(value);
      coords.add({'ts': ts.millisecondsSinceEpoch});
      _log.fine(
        'record($name): APPEND [${data.length - 1}][1](length:${data.length}) '
        '$value @ $ts [$end](+${ts.difference(end).inSeconds} s)',
      );

      return _next<T>(begin, data, coords, min, max, pad, value);
    }

    // Always Before [offset,end]!
    final delta = point.abs();

    if (delta > 1) {
      // Insert padding values before offset and new start (head) value
      final padding = delta - 1;
      data = data.padAt(0, padding, pad ?? value);
      coords = coords.padAt(0, padding, {});
      _log.fine(
        'record($name): PAD [$point][$padding](length:${data.length}) '
        '${pad ?? value} @ $ts [$end](${ts.difference(end).inSeconds} s)',
      );
    }

    // Prepend to start (head) of timeseries
    begin = tsAt(point + 1);
    data.insert(0, value);
    coords.insert(0, {'ts': ts.millisecondsSinceEpoch});
    _log.fine(
      'record($name): PREPEND [0][1](length:${data.length}) '
      '$value @ $ts [$offset](${ts.difference(offset).inSeconds} s)',
    );

    return _next<T>(begin, data, coords, min, max, pad, value);
  }

  TimeSeries _next<T extends num>(DateTime ts0, List<T> data,
      List<Map<String, Object?>> coords, int min, int max, T? pad, T value) {
    final next = TimeSeries(
      name: name,
      span: span,
      offset: ts0,
      array: DataArray.fromVector(
        data,
        coords: coords,
        dims: array.dims,
      ),
    );

    return next.clamp<T>(min, max, pad: pad ?? value, head: true);
  }

  /// Formats [TimeSeries.tsAt] to a fuzzy time like
  /// 'a moment ago' relative to [end] of
  /// history if [when] is not given.
  String tsAgo(int index, [DateTime? when]) {
    final span = scale.to(index);
    final time = offset.add(span);
    return time.format(clock: (when ?? end));
  }

  TimeSeriesStatistics<T> stats<T extends num>(
      {Duration? span, int begin = 0, bool cum = true}) {
    if (isEmpty) {
      return TimeSeriesStatistics.empty();
    }
    final zs = zeros(span: span, begin: begin).lastRow.cast<int>();
    return TimeSeriesStatistics<T>(
      zeros: zs,
      count: zs.length,
      unit: array.dims.last['unit']?.toString() ?? '',
      min: min<T>(span: span, begin: begin).lastRow.cast<T>(),
      max: max<T>(span: span, begin: begin).lastRow.cast<T>(),
      avg: avg<T>(span: span, begin: begin, cum: cum).lastRow.cast<T>(),
      sum: sum<T>(span: span, begin: begin, cum: cum).lastRow.cast<T>(),
    );
  }
}

class TimeSeriesStatistics<T extends num> {
  const TimeSeriesStatistics({
    required this.min,
    required this.max,
    required this.sum,
    required this.avg,
    required this.unit,
    required this.count,
    required this.zeros,
  });

  factory TimeSeriesStatistics.empty() => TimeSeriesStatistics<T>(
        min: [],
        max: [],
        sum: [],
        avg: [],
        unit: '',
        count: 0,
        zeros: [],
      );

  bool get isEmpty => min.isEmpty;
  bool get isNotEmpty => !isEmpty;

  final int count;

  final List<int> zeros;

  final List<T> min;
  final List<T> max;
  final List<T> sum;
  final List<T> avg;
  final String unit;
}
