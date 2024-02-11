import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/feature/account/domain/service_config.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
class Account with _$Account {
  const Account._();

  const factory Account({
    required String userId,
    required Set<ServiceConfig> services,
    String? fname,
    String? lname,
    Presence? presence,
  }) = _Account;

  String get fullName => [fname, lname].whereType<String>().join(' ');

  Optional<ServiceConfig> firstWhere(String key) =>
      services.firstWhereOptional((c) => c.key == key);

  List<ServiceConfig> where(String key) =>
      services.where((c) => c.key == key).toList();

  factory Account.fromJson(Map<String, Object?> json) =>
      _$AccountFromJson(json);
}

@freezed
class Presence with _$Presence {
  const Presence._();

  const factory Presence({
    required String ipAddress,
    required String deviceName,
    String? macAddress,
  }) = _Presence;

  factory Presence.fromJson(Map<String, Object?> json) =>
      _$PresenceFromJson(json);
}

class AccountFields {
  static const String userId = 'userId';
  static const String fname = 'fname';
  static const String lname = 'lname';
  static const String presence = 'presence';
  static const String services = 'services';
}
