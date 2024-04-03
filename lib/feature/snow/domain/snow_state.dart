import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dash/util/time/date_time.dart';

part 'snow_state.freezed.dart';
part 'snow_state.g.dart';

@freezed
class SnowState with _$SnowState {
  const SnowState._();
  const factory SnowState({
    /// Measurement location
    @JsonKey(name: 'location') required String location,

    /// Snow depth in cm
    @JsonKey(name: 'depth') required int depth,

    /// Elevation above sea level
    @JsonKey(name: 'elevation') required int elevation,

    /// Water equivalent if all snow was melted (in kg/m2)
    @JsonKey(name: 'equivalent') required int equivalent,

    /// Air temperature at measurement time (in °C)
    @JsonKey(name: 'temperature') required double temperature,

    /// Time of next scheduled measurement update
    @JsonKey(name: 'nextUpdate') required DateTime nextUpdate,

    /// Time of current measurement update
    @JsonKey(name: 'lastUpdated') required DateTime lastUpdated,
  }) = _SnowState;

  factory SnowState.fromJson(Map<String, Object?> json) =>
      _$SnowStateFromJson(json);

  static DateTime toLatestUpdate(List<SnowState> states) {
    return DateTime.fromMillisecondsSinceEpoch(
      states
          .map((e) => e.lastUpdated)
          .fold(0, (latest, e) => max(latest, e.millisecondsSinceEpoch)),
    );
  }

  static DateTime toEarliestNextUpdate(List<SnowState> states,
      {Duration limit = const Duration(minutes: 5)}) {
    final now = DateTime.now();
    final next = DateTime.fromMillisecondsSinceEpoch(
      states.map((e) => e.nextUpdate).where((e) => e.isFuture).fold(
            now.add(const Duration(days: 1)).millisecondsSinceEpoch,
            (earliest, e) => e.difference(now).isNegative
                ? now.subtract(limit).millisecondsSinceEpoch
                : min(earliest, e.millisecondsSinceEpoch),
          ),
    );
    final span = next.difference(now) - limit;
    return span.isNegative ? next.add(span.abs()) : next;
  }
}
