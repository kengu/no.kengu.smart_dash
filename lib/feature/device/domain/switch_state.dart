import 'package:freezed_annotation/freezed_annotation.dart';

part 'switch_state.freezed.dart';
part 'switch_state.g.dart';

/// The [SwitchState] contains device switch state information
@freezed
class SwitchState with _$SwitchState {
  const SwitchState._();

  const factory SwitchState({
    /// Device switch state (true:on/false:off)
    required bool state,

    /// Current switch mode
    required SwitchMode mode,

    /// Switch mode when on
    required SwitchMode onMode,

    /// Switch mode when off
    required SwitchMode offMode,

    /// [DateTime] timestamp of when data was updated last
    required DateTime lastUpdated,
  }) = _SwitchState;

  bool get isThermostat => !isRelay;

  bool get isRelay => onMode == SwitchMode.on;

  static SwitchState empty() => SwitchState(
        state: false,
        mode: SwitchMode.off,
        offMode: SwitchMode.off,
        onMode: SwitchMode.comfort,
        lastUpdated: DateTime.fromMillisecondsSinceEpoch(0),
      );

  factory SwitchState.fromJson(Map<String, Object?> json) =>
      _$SwitchStateFromJson(json);
}

enum SwitchMode {
  on,
  off,
  eco,
  comfort,
  antiFreeze;

  bool get isOn => this == on;
  bool get isOff => this == off;
  bool get isEco => this == eco;
  bool get isComfort => this == comfort;
  bool get isAntiFreeze => this == antiFreeze;

  static const offModes = [
    SwitchMode.off,
    SwitchMode.eco,
    SwitchMode.antiFreeze
  ];
}
