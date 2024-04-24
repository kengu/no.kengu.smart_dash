import 'dart:async';

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
  AccountService(this.ref) {
    ref.onDispose(() {
      _controller.close();
    });
  }

  final Ref ref;
  final _cache = FutureCache(prefix: '$AccountService');

  final StreamController<Account> _controller = StreamController.broadcast();

  Stream<Account> get changes => _controller.stream;

  User get currentUser => ref.read(userRepositoryProvider).currentUser;

  Optional<Account> getCachedAccount([String? userId]) {
    final uid = userId ?? currentUser.userId;
    return _cache.get('get_user_account:$uid');
  }

  Future<Optional<Account>> getAccount({
    String? userId,
    Duration? ttl = Duration.zero,
  }) {
    final uid = userId ?? currentUser.userId;
    return _cache.getOrFetch('get_user_account:$uid', () async {
      final data = await ref.read(accountRepositoryProvider).get(uid);
      return data;
    }, ttl: ttl);
  }

  Future<bool> addOrUpdate(Account account) async {
    final repo = ref.read(accountRepositoryProvider);
    final result = await repo.addOrUpdate(account);
    if (result) {
      _cache.set(
        'get_user_account:${account.userId}',
        Optional.of(account),
      );
      _controller.add(account);
    }
    return result;
  }
}

@Riverpod(keepAlive: true)
AccountService accountService(AccountServiceRef ref) => AccountService(ref);

@Riverpod()
Future<Optional<Account>> getAccount(GetAccountRef ref,
    {String? userId, Duration? ttl}) {
  return ref.watch(accountServiceProvider).getAccount(userId: userId);
}
