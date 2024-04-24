import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_account/smart_dash_account.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

part 'account_repository.g.dart';

class AccountRepository extends SharedPreferencesRepository<String, Account> {
  AccountRepository() : super(key);

  static const key = 'accounts';

  @override
  String toKey(String id) => '$key:$id';

  @override
  String toId(Account item) => item.userId;

  @override
  String toValue(Account item) => jsonEncode(item.toJson());

  @override
  Account? map(String key, String? data) {
    return data == null ? null : Account.fromJson(jsonDecode(data));
  }
}

@Riverpod(keepAlive: true)
AccountRepository accountRepository(AccountRepositoryRef ref) {
  return AccountRepository();
}
