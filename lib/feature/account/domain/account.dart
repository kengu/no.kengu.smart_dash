import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/feature/account/domain/service_credentials.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
class Account with _$Account {
  const Account._();

  const factory Account({
    required String userId,
    required Set<ServiceCredentials> services,
    String? fname,
    String? lname,
  }) = _Account;

  String get fullName => [fname, lname].whereType<String>().join(' ');

  Optional<ServiceCredentials> lookup(String service) =>
      services.firstWhereOptional((c) => c.name == service);

  factory Account.fromJson(Map<String, Object?> json) =>
      _$AccountFromJson(json);
}

class AccountFields {
  static const String userId = 'userId';
  static const String fname = 'fname';
  static const String lname = 'lname';
}
