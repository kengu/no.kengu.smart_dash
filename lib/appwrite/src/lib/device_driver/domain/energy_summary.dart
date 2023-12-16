import 'package:freezed_annotation/freezed_annotation.dart';

part 'energy_summary.freezed.dart';
part 'energy_summary.g.dart';

/// The [Device] class is a representation of a
/// device paired with SmartDash
@freezed
class EnergySummary with _$EnergySummary {
  const factory EnergySummary({
    /// Last measured power usage (watt)
    required int currentPower,

    /// Energy accumulated from start (in watt/h)
    required int cumulative,

    /// Energy accumulated from midnight (in watt/h)
    required int cumulativeToday,

    /// [DateTime] timestamp of when data was updated last
    required DateTime lastUpdated,
  }) = _EnergySummary;

  static EnergySummary empty() => EnergySummary(
        cumulative: 0,
        currentPower: 0,
        cumulativeToday: 0,
        lastUpdated: DateTime.fromMillisecondsSinceEpoch(0),
      );

  factory EnergySummary.fromJson(Map<String, Object?> json) =>
      _$EnergySummaryFromJson(json);
}
