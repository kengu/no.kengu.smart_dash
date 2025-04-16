import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash_account/smart_dash_account.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
sealed class Account with _$Account {
  const Account._();

  const factory Account({
    required String userId,
    required List<Home> homes,
    String? fname,
    String? lname,
  }) = _Account;

  String get name => [fname, lname].whereType<String>().join(' ');

  factory Account.fromJson(Map<String, Object?> json) =>
      _$AccountFromJson(json);

  Optional<Home> homeWhere(String id) =>
      homes.firstWhereOptional((c) => c.id == id);
}

class AccountFields {
  static const String userId = 'userId';
  static const String fname = 'fname';
  static const String lname = 'lname';
  static const String homes = 'homes';
}
