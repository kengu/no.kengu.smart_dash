import 'package:flutter/material.dart';
import 'package:smart_dash/feature/analytics/domain/data_array.dart';
import 'package:smart_dash/feature/analytics/domain/time_series.dart';
import 'package:smart_dash/util/data/data_array.dart';
import 'package:smart_dash/util/time/date_time.dart';
import 'package:smart_dash/util/time/duration.dart';
import 'package:smart_dash/util/data/json.dart';
import 'package:smart_dash/util/data/list.dart';
import 'package:smart_dash/util/data/num.dart';
import 'package:smart_dash/util/time/time_scale.dart';

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
      reduce<T>(tail ? _tail : _head, span: span, start: begin);
  static T _head<T>(_, __, ___, List<T> inside) => inside.first;
  static T _tail<T>(_, __, ___, List<T> inside) => inside.last;

  TimeSeries max<T extends num>(
          {Duration? span, int begin = 0, bool tail = true}) =>
      reduce<T>(_max, span: span, start: begin);
  static T _max<T extends num>(_, __, ___, List<T> inside) => inside.max();

  TimeSeries min<T extends num>(
          {Duration? span, int begin = 0, bool tail = true}) =>
      reduce<T>(_min, span: span, start: begin);
  static T _min<T extends num>(_, __, ___, List<T> inside) => inside.min();

  TimeSeries avg<T extends num>(
          {Duration? span, int begin = 0, bool tail = true}) =>
      reduce<T>(_avg, span: span, start: begin);
  static T _avg<T extends num>(_, __, ___, List<T> inside) => inside.avg();

  TimeSeries sum<T extends num>(
          {Duration? span, int begin = 0, bool tail = true}) =>
      reduce<T>(_sum,
          span: span,
          start: begin,
          initial: List<T>.generate(1, (index) => 0.cast<T>()));
  static T _sum<T extends num>(_, __, value, List<T> inside) =>
      value + inside.sum();

  TimeSeries reduce<T extends num>(
    T Function(int column, int row, T previous, List<T> inside) combine, {
    Duration? span,
    int start = 0,
    List<T>? initial,
  }) {
    var ts0 = tsAt(start);
    var row0 = initial ?? rowAt(start);

    final coords = <JsonObject>[];
    final data = generateArray<T>(width);

    final tailCoords = <JsonObject>[];
    final tailData = generateArray<T>(width);
    final hSpan = span ?? this.span;
    final scale = hSpan.to();

    for (int i = start; i < length; i++) {
      final ts = tsAt(i);
      final row = rowAt(i);
      final delta = ts.difference(ts0);

      // First element is always selected
      final isWithin = i > start && hSpan.isWithin(scale, delta);

      for (int j = 0; j < width; j++) {
        tailData[j].add(row[j].cast<T>());
        if (!isWithin) {
          // TODO: Fix initial conditions by starting at i==start
          final value = combine(j, i, row0[j].cast<T>(), tailData[j]);

          // Reduce
          data[j].add(value);

          ts0 = ts;
          row0[j] = value;
        }
      }

      if (isWithin) {
        tailCoords.add(array.coords[i]);
      } else {
        coords.add(array.coords[i]);

        tailData.clear();
        tailCoords.clear();
        tailData.addAll(generateArray<T>(width));
      }
    }

    // Last element is always selected
    if (tailCoords.isNotEmpty) {
      for (int i = 0; i < width; i++) {
        data[i].add(
          combine(i, length - 1, row0[i].cast<T>(), tailData[i]),
        );
      }
      coords.add(tailCoords.last);
    }

    if (false) {
      debugPrint('reduce($name):: [$scale]');
      debugPrint('old:: ${lastColumn.last} @ $length');
      debugPrint('new:: ${data[0].last} @ ${data[0].length}');
    }
    return TimeSeries(
      name: name,
      span: hSpan,
      offset: offset,
      array: array.copyWith(
        data: data,
        coords: coords,
      ),
    );
  }

  TimeSeries record<T extends num>(
    T value,
    DateTime ts, {
    int min = 1,
    int max = 1,
    required T pad,
  }) {
    var ts0 = offset;

    // Define array components for next time series
    var count = length;
    var coords = array.coords.toList();
    var data = isEmpty ? <T>[] : this[0].toList().cast<T>();

    // Lookup index relative to current offset
    final point = ts0.indexAt(ts, span);

    if (point >= count) {
      final delta = point - count;
      if (delta > 1) {
        // Insert gaps between end and new point in history
        final padding = delta - 1;
        data = data.padAt(count - 1, padding, pad);
        coords = coords.padAt(count - 1, padding, {});
        debugPrint(
          'record($name): PAD [$padding](length:${data.length}) $value @ $ts',
        );
      }
      // Add point to end
      data.add(value);
      coords.add({'ts': ts.millisecondsSinceEpoch});
      count = data.length;
      debugPrint(
        'record($name): APPEND [${count - 1}](length:$count) $value @ $ts',
      );
    } else if (point < 0) {
      final delta = point.abs();
      if (delta > 1) {
        // Insert gaps between point and first
        data = data.padAt(0, delta - 1, pad);
        coords = coords.padAt(0, delta - 1, {});
      }
      // Append to head of time series
      ts0 = tsAt(delta - 1);
      data.insert(delta - 1, value);
      coords.insert(delta - 1, {'ts': ts.millisecondsSinceEpoch});
      count = data.length;
      debugPrint(
        'record($name): APPEND [${delta - 1}](length:$count) $value @ $ts',
      );
    } else {
      // Replace existing point
      data[point] = value;
      coords[point] = {'ts': ts.millisecondsSinceEpoch};
      if (false) {
        debugPrint(
          'record($name): REPLACE [$point](length:$count) $value @ $ts',
        );
      }
    }

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

    return next.clamp<T>(min, max, pad: pad, head: true);
  }

  /// Formats [TimeSeries.tsAt] to a fuzzy time like
  /// 'a moment ago' relative to [end] of
  /// history if [when] is not given.
  String tsAgo(int index, [DateTime? when]) {
    final span = scale.to(index);
    final time = offset.add(span);
    return time.format(clock: (when ?? end));
  }
}
