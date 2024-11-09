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
  String toId(Account item) => item.userId;

  @override
  Future<Optional<Account>> get(String userId);

  @override
  Future<List<Account>> getAll([List<String> userIds = const []]);

  String toValue(Account item) => jsonEncode(item.toJson());

  Account? map(String key, String? data) {
    return data == null ? null : Account.fromJson(jsonDecode(data));
  }

  Future<void> clear();
}
