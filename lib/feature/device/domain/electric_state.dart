import 'package:freezed_annotation/freezed_annotation.dart';

part 'electric_state.freezed.dart';
part 'electric_state.g.dart';

/// The [ElectricState] contains electrical device information
@freezed
class ElectricState with _$ElectricState {
  const factory ElectricState({
    /// Get device's measured voltage (in V, default null)
    int? voltage,

    /// Last measured power usage (watt)
    int? currentPower,

    /// Energy accumulated from start (in watt/h, default null)
    int? cumulative,

    /// Energy accumulated from midnight (in watt/h, default null)
    int? cumulativeToday,

    /// [DateTime] timestamp of when data was updated last
    required DateTime lastUpdated,
  }) = _ElectricState;

  static ElectricState empty() => ElectricState(
        lastUpdated: DateTime.fromMillisecondsSinceEpoch(0),
      );

  factory ElectricState.fromJson(Map<String, Object?> json) =>
      _$ElectricStateFromJson(json);
}
