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

  Future<bool> exists(String userId);

  @override
  Future<Optional<Account>> get(String userId);

  @override
  Future<List<Account>> getAll([List<String> userIds = const []]);

  Future<Account> create(Account account);

  @override
  Future<SingleRepositoryResult<String, Account>> addOrUpdate(
          Account account) =>
      super.addOrUpdate(account);

  /// Returns list of actual added accounts.
  @override
  Future<BulkRepositoryResult<String, Account>> updateAll(
      Iterable<Account> accounts);

  /// Attempt to remove all given accounts from repository.
  ///
  /// Returns list of actual removed account.
  @override
  Future<BulkRepositoryResult<String, Account>> removeAll(
      Iterable<Account> accounts);

  String toValue(Account account) => jsonEncode(account.toJson());

  Account? map(String key, String? data) {
    return data == null ? null : Account.fromJson(jsonDecode(data));
  }

  /// Clear all account from storage
  Future<void> clear();
}
