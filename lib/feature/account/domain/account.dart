import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/feature/account/domain/service_config.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/feature/system/domain/network_info.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
class Account with _$Account {
  const Account._();

  const factory Account({
    required String userId,
    String? fname,
    String? lname,
    List<AccountHome>? homes,
  }) = _Account;

  String get name => [fname, lname].whereType<String>().join(' ');

  factory Account.fromJson(Map<String, Object?> json) =>
      _$AccountFromJson(json);

  Optional<AccountHome> firstHomeWhere(String name) =>
      homes?.firstWhereOptional((c) => c.name == name) ??
      const Optional.empty();

  List<AccountHome> homeWhere(String name) =>
      homes?.where((c) => c.name == name).toList() ?? const [];
}

@freezed
class AccountHome with _$AccountHome {
  const AccountHome._();

  const factory AccountHome({
    required String name,
    required List<ServiceConfig> services,
    required List<AccountHomeMember> members,
    String? address,
  }) = _AccountHome;

  factory AccountHome.fromJson(Map<String, Object?> json) =>
      _$AccountHomeFromJson(json);

  Optional<ServiceConfig> firstServiceWhere(String key) =>
      services.firstWhereOptional((c) => c.key == key);

  List<ServiceConfig> serviceWhere(String key) =>
      services.where((c) => c.key == key).toList();
}

@freezed
class AccountHomeMember with _$AccountHomeMember {
  const AccountHomeMember._();

  const factory AccountHomeMember({
    required String key,
    required String name,
  }) = _AccountHomeMember;

  Token toToken() => Token(
        tag: 'presence',
        name: key,
        label: name,
        unit: TokenUnit.count,
        type: DeviceCapability.onOff.type,
      );

  factory AccountHomeMember.fromDevice(NetworkDeviceInfo info) =>
      AccountHomeMember(
        name: info.readableName,
        key: info.macAddress == null
            ? 'presence:ip:${info.ipAddress}'
            : 'presence:mac:${info.macAddress}',
      );

  factory AccountHomeMember.fromJson(Map<String, Object?> json) =>
      _$AccountHomeMemberFromJson(json);
}

class AccountFields {
  static const String userId = 'userId';
  static const String fname = 'fname';
  static const String lname = 'lname';
  static const String home = 'home';
  static const String homes = 'homes';
}

class AccountHomeFields {
  static const String name = 'name';
  static const String members = 'members';
  static const String services = 'services';
}

class AccountHomeMemberFields {
  static const String key = 'key';
  static const String name = 'name';
}
