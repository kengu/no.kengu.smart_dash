import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/feature/home/domain/home.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
class Account with _$Account {
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

  Optional<Home> homeWhere(String name) =>
      homes.firstWhereOptional((c) => c.name == name);
}

class AccountFields {
  static const String userId = 'userId';
  static const String fname = 'fname';
  static const String lname = 'lname';
  static const String homes = 'homes';
}
