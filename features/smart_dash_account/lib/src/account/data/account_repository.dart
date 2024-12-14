import 'dart:convert';

import 'package:optional/optional.dart';
import 'package:smart_dash_account/smart_dash_account.dart';
import 'package:smart_dash_datasource/smart_dash_datasource.dart';

typedef AccountRepository = Repository<String, Account>;

mixin AccountRepositoryMixin on AccountRepository {
  static const key = 'accounts';
  static const box = 'paired';

  @override
  String toKey(String userId) => '$key:$userId';

  @override
  String toId(Account account) => account.userId;

  @override
  Future<bool> exists(String userId);

  @override
  Future<Optional<Account>> get(String userId);

  @override
  Future<List<Account>> getAll([List<String> userIds = const []]);

  @override
  Future<SingleRepositoryResult<String, Account>> addOrUpdate(Account account);

  @override
  Future<SingleRepositoryResult<String, Account>> remove(Account account);

  String toValue(Account account) => jsonEncode(account.toJson());

  Account? map(String key, String? data) {
    return data == null ? null : Account.fromJson(jsonDecode(data));
  }

  Future<void> clear();
}
