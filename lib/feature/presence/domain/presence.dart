import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/feature/system/domain/network_info.dart';

part 'presence.freezed.dart';
part 'presence.g.dart';

@freezed
class Presence with _$Presence {
  const Presence._();
  const factory Presence({
    required Token token,
    required bool isHome,
    required DateTime when,
    required List<Token> members,
  }) = _Presence;

  bool get isAway => !isHome;
  String get name => token.label;

  static Presence empty(Token token) => Presence(
        token: token,
        isHome: false,
        when: DateTime.now(),
        members: const [],
      );

  static Token toToken(NetworkDeviceInfo data) {
    return Token(
      tag: 'presence',
      label: data.readableName,
      unit: TokenUnit.count,
      type: DeviceCapability.onOff.type,
      name: 'presence:${data.macAddress}',
    );
  }

  factory Presence.fromJson(Map<String, Object?> json) =>
      _$PresenceFromJson(json);
}
