import 'dart:convert';

import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_dash/feature/account/domain/account.dart';
import 'package:smart_dash/util/guard.dart';

part 'account_repository.g.dart';

class AccountRepository {
  static const key = 'accounts';

  Future<Optional<List<Account>>> getAll() async {
    return Optional.of(await _load());
  }

  Future<Optional<Account>> get(String userId) async {
    final accounts = await _load();
    return accounts.isEmpty
        ? Optional.of(Account(
            userId: userId,
            homes: const [],
          ))
        : accounts.firstWhereOptional(
            (account) => account.userId == userId,
          );
  }

  Future<bool> addOrUpdate(Account account) async {
    final accounts = await _load();
    final next = accounts.map((e) => _replace(e, account)).toList();
    return _setAll({...next, account}.toList());
  }

  Future<List<Account>> _load() => guard(
        () async {
          final prefs = await SharedPreferences.getInstance();
          final result = prefs.getStringList(AccountRepository.key);
          final accounts = result
                  ?.map(jsonDecode)
                  .whereType<Map<String, Object?>>()
                  .map(Account.fromJson)
                  .toList() ??
              [];
          return accounts;
        },
        task: '_load',
        name: '$AccountRepository',
      );

  Future<bool> _setAll(List<Account> accounts) => guard(
        () async {
          final prefs = await SharedPreferences.getInstance();
          return prefs.setStringList(
            AccountRepository.key,
            accounts.map(jsonEncode).toList(),
          );
        },
        task: '_setAll',
        name: '$AccountRepository',
      );

  Account _replace(Account current, Account next) =>
      current.userId == next.userId ? next : current;
}

@Riverpod(keepAlive: true)
AccountRepository accountRepository(AccountRepositoryRef ref) {
  return AccountRepository();
}
