import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/account/data/account_repository.dart';
import 'package:smart_dash/feature/account/domain/account.dart';
import 'package:smart_dash/feature/identity/data/user_repository.dart';
import 'package:smart_dash/feature/identity/domain/user.dart';
import 'package:smart_dash/util/future.dart';

part 'account_service.g.dart';

class AccountService {
  AccountService(this.ref);

  final Ref ref;
  final _cache = FutureCache(prefix: '$AccountService');

  User get currentUser => ref.read(userRepositoryProvider).currentUser;

  Future<Optional<Account>> getAccount([String? userId]) {
    final uid = userId ?? currentUser.userId;
    return _cache.getOrFetch('get_user_account:$userId', () {
      return ref.read(accountRepositoryProvider).get(uid);
    });
  }

  Future<bool> addOrUpdate(Account account) {
    return ref.read(accountRepositoryProvider).addOrUpdate(account);
  }
}

@Riverpod(keepAlive: true)
AccountService accountService(AccountServiceRef ref) => AccountService(ref);

@Riverpod()
Future<Optional<Account>> getAccount(GetAccountRef ref, [String? userId]) {
  return ref.watch(accountServiceProvider).getAccount(userId);
}
