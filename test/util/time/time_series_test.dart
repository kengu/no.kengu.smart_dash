import 'package:smart_dash/feature/analytics/domain/data_array.dart';
import 'package:smart_dash/feature/analytics/domain/time_series.dart';
import 'package:smart_dash/util/time/date_time.dart';
import 'package:smart_dash/util/time/time_scale.dart';
import 'package:smart_dash/util/time/time_series.dart';
import 'package:test/test.dart';

void main() {
  const duration = Duration(minutes: 60 * 3);
  final data1 = List.generate(
    duration.inMinutes,
    (index) => 1,
  );
  final data2 = List.generate(
    duration.inMinutes,
    (index) => 2,
  );
  final data = [data1, data2];
  final sum1 = List.generate(
    duration.inMinutes,
    (index) => index + 1,
  );
  final coords = List.generate(
    duration.inMinutes,
    (index) => {'minute': index + 1},
  );

  test('TimeSeries.sum() adds up correctly', () {
    // Arrange
    final sum2 = List.generate(
      duration.inMinutes,
      (index) => (index + 1) * 2,
    );
    final sum = [sum1, sum2];

    final series = TimeSeries(
      name: 'sum',
      span: TimeScale.minutes.to(),
      offset: DateTime.now().subtract(duration),
      array: DataArray(
        data,
        dims: [{}],
        coords: coords,
      ),
    );

    // Act
    final result = series.sum();

    // Assert
    expect(TimeScale.from(result.span), TimeScale.minutes);
    expect(TimeScale.from(result.duration), TimeScale.hours);
    expect(result[0], sum1);
    expect(result[1], sum2);
    expect(result.array.data, sum);
    expect(result.array.coords, coords);
  });

  test('TimeSeries.sum(span:{TimeScale.up()}) adds up correctly', () {
    // Arrange
    final sum1 = [60, 120, 180];
    final sum2 = [60 * 2, 120 * 2, 180 * 2];
    final sum = [sum1, sum2];
    final group = List.generate(
      3,
      (index) => {'minute': (index + 1) * 60},
    );

    final series = TimeSeries(
      name: 'sum',
      span: TimeScale.minutes.to(),
      offset: DateTime.now().subtract(duration),
      array: DataArray(
        data,
        dims: [{}],
        coords: coords,
      ),
    );

    // Act
    final result = series.sum(span: TimeScale.minutes.up().to());

    // Assert
    expect(TimeScale.from(result.span), TimeScale.hours);
    expect(TimeScale.from(result.duration), TimeScale.hours);
    expect(result.array.coords, group);
    expect(result[0], sum1);
    expect(result[1], sum2);
    expect(result.array.data, sum);
    expect(result.array.coords, group);
  });

  test('TimeSeries.record replaces correctly', () {
    // Arrange
    final empty = [<int>[]];
    final offset = DateTime(2020, 1, 1, 0, 0, 0);

    final series = TimeSeries(
      name: 'record',
      span: TimeScale.minutes.to(),
      offset: offset,
      array: DataArray(
        empty,
        dims: [{}],
        coords: [{}],
      ),
    );

    // Act
    final result1 = series.record(1, offset);
    final result2 = result1.record(2, offset);

    // Assert
    expect(TimeScale.from(result1.span), TimeScale.minutes);
    expect(TimeScale.from(result1.duration), TimeScale.minutes);
    expect(TimeScale.from(result2.span), TimeScale.minutes);
    expect(TimeScale.from(result2.duration), TimeScale.minutes);
    expect(result1[0], [1]);
    expect(result2[0], [2]);
  });

  test('TimeSeries.record appends correctly', () {
    // Arrange
    final empty = [<int>[]];
    final span = TimeScale.minutes.to();
    final offset = DateTime(2020, 1, 1, 0, 0, 0);
    final t1 = offset.add(const Duration(seconds: 60 * 1));

    final series = TimeSeries(
      name: 'record',
      span: span,
      offset: offset,
      array: DataArray(
        empty,
        dims: [{}],
        coords: [{}],
      ),
    );

    // Act
    final result1 = series.record(1, offset);
    final result2 = result1.record(2, offset.add(const Duration(seconds: 60)));

    // Assert
    expect(TimeScale.from(result1.span), TimeScale.minutes);
    expect(TimeScale.from(result1.duration), TimeScale.minutes);
    expect(TimeScale.from(result2.span), TimeScale.minutes);
    expect(TimeScale.from(result2.duration), TimeScale.minutes);
    expect(result1[0], [1]);
    expect(result2[0], [1, 2]);
    expect(result2[0][offset.indexAt(offset, span)], 1);
    expect(result2[0][offset.indexAt(t1, span)], 2);
  });

  test('TimeSeries.record pads to end correctly', () {
    // Arrange
    final empty = [<int>[]];
    final span = TimeScale.minutes.to();
    final offset = DateTime(2020, 1, 1, 0, 0, 0);
    final t1 = offset.add(const Duration(seconds: 60 * 1));
    final t2 = offset.add(const Duration(seconds: 60 * 2));
    final t3 = offset.add(const Duration(seconds: 60 * 3));

    final series = TimeSeries(
      name: 'record',
      span: TimeScale.minutes.to(),
      offset: offset,
      array: DataArray(
        empty,
        dims: [{}],
        coords: [{}],
      ),
    );

    // Act
    final result1 = series.record(1, offset);
    final result2 = result1.record(2, t3, pad: 0);

    // Assert
    expect(TimeScale.from(result1.span), TimeScale.minutes);
    expect(TimeScale.from(result1.duration), TimeScale.minutes);
    expect(TimeScale.from(result2.span), TimeScale.minutes);
    expect(TimeScale.from(result2.duration), TimeScale.minutes);
    expect(result1[0], [1]);
    expect(result2[0], [1, 0, 0, 2]);
    expect(result2[0][offset.indexAt(offset, span)], 1);
    expect(result2[0][offset.indexAt(t1, span)], 0);
    expect(result2[0][offset.indexAt(t2, span)], 0);
    expect(result2[0][offset.indexAt(t3, span)], 2);
  });

  test('TimeSeries.record appends correctly', () {
    // Arrange
    final empty = [<int>[]];
    final span = TimeScale.minutes.to();
    final offset = DateTime(2020, 1, 1, 0, 0, 0);
    final t1 = offset.add(const Duration(seconds: 60 * 1));
    final t2 = offset.add(const Duration(seconds: 60 * 2));
    final t3 = offset.add(const Duration(seconds: 60 * 3));

    final series = TimeSeries(
      name: 'record',
      span: TimeScale.minutes.to(),
      offset: offset,
      array: DataArray(
        empty,
        dims: [{}],
        coords: [{}],
      ),
    );

    // Act
    final result1 = series.record(1, offset);
    final result2 = result1.record(2, t3);

    // Assert
    expect(TimeScale.from(result1.span), TimeScale.minutes);
    expect(TimeScale.from(result1.duration), TimeScale.minutes);
    expect(TimeScale.from(result2.span), TimeScale.minutes);
    expect(TimeScale.from(result2.duration), TimeScale.minutes);
    expect(result1[0], [1]);
    expect(result2[0], [1, 2, 2, 2]);
    expect(result2[0][offset.indexAt(offset, span)], 1);
    expect(result2[0][offset.indexAt(t1, span)], 2);
    expect(result2[0][offset.indexAt(t2, span)], 2);
    expect(result2[0][offset.indexAt(t3, span)], 2);
  });

  test('TimeSeries.record pads to start correctly', () {
    // Arrange
    final empty = [<int>[]];
    final span = TimeScale.minutes.to();
    final offset = DateTime(2020, 1, 1, 0, 0, 0);
    final t1 = offset.add(const Duration(seconds: -60 * 1));
    final t2 = offset.add(const Duration(seconds: -60 * 2));
    final t3 = offset.add(const Duration(seconds: -60 * 3));

    final series = TimeSeries(
      name: 'record',
      span: TimeScale.minutes.to(),
      offset: offset,
      array: DataArray(
        empty,
        dims: [{}],
        coords: [{}],
      ),
    );

    // Act
    final result1 = series.record(1, offset);
    final result2 = result1.record(2, t3, pad: 0);

    // Assert
    expect(TimeScale.from(result1.span), TimeScale.minutes);
    expect(TimeScale.from(result1.duration), TimeScale.minutes);
    expect(TimeScale.from(result2.span), TimeScale.minutes);
    expect(TimeScale.from(result2.duration), TimeScale.minutes);
    expect(result1[0], [1]);
    expect(result2[0], [2, 0, 0, 1]);
    expect(result2[0][t3.indexAt(t3, span)], 2);
    expect(result2[0][t3.indexAt(t2, span)], 0);
    expect(result2[0][t3.indexAt(t1, span)], 0);
    expect(result2[0][t3.indexAt(offset, span)], 1);
  });

  test('TimeSeries.record prepends correctly', () {
    // Arrange
    final empty = [<int>[]];
    final span = TimeScale.minutes.to();
    final offset = DateTime(2020, 1, 1, 0, 0, 0);
    final t1 = offset.add(const Duration(seconds: -60 * 1));
    final t2 = offset.add(const Duration(seconds: -60 * 2));
    final t3 = offset.add(const Duration(seconds: -60 * 3));

    final series = TimeSeries(
      name: 'record',
      span: TimeScale.minutes.to(),
      offset: offset,
      array: DataArray(
        empty,
        dims: [{}],
        coords: [{}],
      ),
    );

    // Act
    final result1 = series.record(1, offset);
    final result2 = result1.record(2, t3);

    // Assert
    expect(TimeScale.from(result1.span), TimeScale.minutes);
    expect(TimeScale.from(result1.duration), TimeScale.minutes);
    expect(TimeScale.from(result2.span), TimeScale.minutes);
    expect(TimeScale.from(result2.duration), TimeScale.minutes);
    expect(result1[0], [1]);
    expect(result2[0], [2, 2, 2, 1]);
    expect(result2[0][t3.indexAt(t3, span)], 2);
    expect(result2[0][t3.indexAt(t2, span)], 2);
    expect(result2[0][t3.indexAt(t1, span)], 2);
    expect(result2[0][t3.indexAt(offset, span)], 1);
  });

  test('TimeSeries.clamp to minimum', () {
    // Arrange
    final empty = [<int>[]];
    final offset = DateTime(2020, 1, 1, 0, 0, 0);

    final series = TimeSeries(
      name: 'record',
      span: TimeScale.minutes.to(),
      offset: offset,
      array: DataArray(
        empty,
        dims: [{}],
        coords: [{}],
      ),
    );

    // Act
    final result1 = series.clamp(5, 10, pad: 8);

    // Assert
    expect(TimeScale.from(result1.span), TimeScale.minutes);
    expect(TimeScale.from(result1.duration), TimeScale.minutes);
    expect(result1[0], [8, 8, 8, 8, 8]);
  });

  test('TimeSeries.clamp to maximum', () {
    // Arrange
    final empty = [
      [1, 2, 3, 4]
    ];
    final offset = DateTime(2020, 1, 1, 0, 0, 0);

    final series = TimeSeries(
      name: 'record',
      span: TimeScale.minutes.to(),
      offset: offset,
      array: DataArray(
        empty,
        dims: [{}],
        coords: [{}],
      ),
    );

    // Act
    final result1 = series.clamp(1, 3, pad: 8, head: true);
    final result2 = result1.clamp(4, 5, pad: 8, head: true);
    final result3 = result2.clamp(1, 2, pad: 8, head: false);

    // Assert
    expect(TimeScale.from(result1.span), TimeScale.minutes);
    expect(TimeScale.from(result1.duration), TimeScale.minutes);
    expect(result1[0], [2, 3, 4]);
    expect(result2[0], [8, 2, 3, 4]);
    expect(result3[0], [8, 2]);
  });
}
