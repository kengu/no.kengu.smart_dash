import 'package:smart_dash/feature/analytics/domain/data_array.dart';
import 'package:smart_dash/feature/analytics/domain/time_series.dart';
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
}
