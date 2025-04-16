import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dash_account/smart_dash_account.dart';

import 'network_info.dart';

part 'presence.freezed.dart';
part 'presence.g.dart';

@freezed
sealed class Presence with _$Presence {
  const Presence._();
  const factory Presence({
    required Token token,
    required bool isHome,
    required DateTime when,
    required List<Token> members,
  }) = _Presence;

  String get id => token.name;

  bool get isAway => !isHome;
  String get name => token.label;

  static Presence empty(Token token) => Presence(
        token: token,
        isHome: false,
        members: const [],
        when: DateTime.now(),
      );

  static Token toHomeToken(Home home) {
    return Token(
      tag: 'presence',
      label: home.name,
      capability: Capability.any,
      // TODO: Add unique home id using nanoid
      name: 'presence:${home.id.toLowerCase()}',
    );
  }

  static Token toMemberToken(NetworkDeviceInfo data) {
    return Token(
      tag: 'presence',
      label: data.readableName,
      capability: Capability.onOff,
      name: data.macAddress == null
          ? 'presence:ip:${data.ipAddress}'
          : 'presence:mac:${data.macAddress}',
    );
  }

  static HomeMember toHomeMember(NetworkDeviceInfo data) => HomeMember(
        name: data.readableName,
        key: data.macAddress == null
            ? 'presence:ip:${data.ipAddress}'
            : 'presence:mac:${data.macAddress}',
      );

  static HomeMember homeMemberFromToken(Token token) {
    return HomeMember(
      key: token.name,
      name: token.label,
    );
  }

  factory Presence.fromJson(Map<String, Object?> json) =>
      _$PresenceFromJson(json);
}
