import 'dart:async';

import 'package:async/async.dart';
import 'package:nanoid/nanoid.dart';
import 'package:optional/optional.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_account/smart_dash_account_app.dart';
import 'package:smart_dash_account/src/account/data/account_app_repository.dart';
import 'package:smart_dash_account/src/account/data/current_home_app_repository.dart';

part 'account_service.g.dart';

class AccountService {
  AccountService(this.ref) {
    ref.onDispose(() {
      _controller.close();
    });
  }

  static const ttl = Duration(seconds: 1);

  final Ref ref;
  final _cache = FutureCache(prefix: '$AccountService');

  AccountAppRepository get repo => ref.read(appAccountRepositoryProvider);

  final StreamController<AccountEvent> _controller =
      StreamController.broadcast();

  Stream<AccountEvent> get changes {
    return StreamGroup.merge([
      _controller.stream,
      _changes(),
    ]);
  }

  Stream<AccountEvent> _changes() async* {
    await for (final e in repo.events) {
      if (e.isSingle && e.item.data.userId == currentUser.userId) {
        yield AccountEvent(e.item.data);
      }
    }
  }

  /// Get current [User]
  User get currentUser => ref.read(userRepositoryProvider).currentUser;

  Optional<Account> getCachedAccount([String? userId]) {
    final uid = userId ?? currentUser.userId;
    return _cache.get('get_user_account:$uid');
  }

  /// Onboard [userId] with new account
  Future<Optional<Account>> onboardIfAbsent(
    Future<Optional<Account>> Function(String userId) onboard, {
    String? userId,
    Duration? ttl = Duration.zero,
  }) {
    final uid = userId ?? currentUser.userId;
    return _cache.getOrFetch('get_user_account:$uid', () async {
      final account = await repo.get(uid);
      if (account.isPresent) {
        account;
      }
      final newAccount = await onboard(uid);
      if (!newAccount.isPresent) {
        return Optional.empty();
      }
      final result = await repo.addOrUpdate(
        newAccount.value,
      );
      return result.item.data.toOptional;
    }, ttl: ttl);
  }

  /// Get [Account] for [userId] if given.
  /// If not given, get [Account] for [currentUser]
  Future<Optional<Account>> getAccount({
    String? userId,
    Duration? ttl = const Duration(milliseconds: 200),
  }) {
    final uid = userId ?? currentUser.userId;
    return _cache.getOrFetch('get_user_account:$uid', () async {
      final result = await ref.read(appAccountRepositoryProvider).get(uid);
      return result.isPresent
          ? result.value.data.toOptional
          : const Optional.empty();
    }, ttl: ttl);
  }

  /// Create a new home for given [userId].
  ///
  /// If [userId] is not given, current user
  /// is used.
  ///
  /// This method will set the first home in
  /// current user [Account] as current home if
  /// current user have not selected a home
  /// yet. The method will return [Optional.empty]
  /// result if current user is not found.
  Future<Optional<Home>> newHome(
    String name, {
    String? userId,
    bool isCurrent = true,
  }) async {
    final result = await getAccount(userId: userId);
    if (!result.isPresent) {
      return const Optional.empty();
    }
    final account = result.value;
    final homes = result.value.homes;

    final home = Home(
      id: nanoid(),
      name: name,
      members: [],
      services: [],
      location: Location.empty(),
    );
    await addOrUpdate(
      account.copyWith(homes: [...homes, home]),
    );

    _controller.add(
      NewHomeEvent(account, home),
    );

    return Optional.of(home);
  }

  Optional<Home> getCachedHome(String homeId, {String? userId}) {
    final uid = userId ?? currentUser.userId;
    return _cache.get('get_home:$uid:$homeId');
  }

  /// Get [Home] from given [homeId] from [currentUser] or [userId] if given.
  Future<Optional<Home>> getHome(String homeId,
      {String? userId, Duration? ttl = ttl}) {
    final uid = userId ?? currentUser.userId;
    return _cache.getOrFetch('get_home:$uid:$homeId', () async {
      final repo = ref.read(appAccountRepositoryProvider);
      final result = await repo.get(uid);
      if (!result.isPresent) return Optional.empty();
      return result.value.data.homeWhere(homeId);
    }, ttl: ttl);
  }

  Optional<Home> getCachedCurrentHome([String? userId]) {
    final uid = userId ?? currentUser.userId;
    return _cache.get('get_current_home:$uid');
  }

  /// Get current [Home] from [currentUser] or [userId] if given.
  Future<Optional<Home>> getCurrentHome({String? userId, Duration? ttl = ttl}) {
    final uid = userId ?? currentUser.userId;
    return _cache.getOrFetch('get_current_home:$uid', () async {
      final current = await ref.read(appCurrentHomeRepositoryProvider).get(uid);
      if (!current.isPresent) return const Optional.empty();

      final account = await getAccount(userId: current.value.userId);
      if (!account.isPresent) return const Optional.empty();

      return account.value.homeWhere(current.value.homeId);
    }, ttl: ttl);
  }

  Future<bool> setCurrentHome(Home home, [String? userId]) {
    return guard(
      () async {
        final uid = userId ?? currentUser.userId;
        final repo = ref.read(appCurrentHomeRepositoryProvider);
        final (current, success) = await repo.set(uid, home.id);
        if (success) {
          final account = await getAccount(userId: current.userId);
          if (account.isPresent) {
            _controller.add(
              NewHomeEvent(account.value, home),
            );
          }
        }
        return success;
      },
      name: '$AccountService',
      task: 'setCurrentHome',
    );
  }

  Future<List<Home>> getHomes({String? userId, Duration? ttl = ttl}) {
    final uid = userId ?? currentUser.userId;
    return _cache.getOrFetch('get_homes', () async {
      final account = await getAccount(userId: uid);
      if (!account.isPresent) return [];
      return account.value.homes;
    }, ttl: ttl);
  }

  Future<bool> addOrUpdate(Account account) async {
    final repo = ref.read(appAccountRepositoryProvider);
    final result = await repo.addOrUpdate(account);
    if (result.isNotEmpty) {
      _cache.set(
        'get_user_account:${account.userId}',
        Optional.of(account),
      );
    }
    return result.isNotEmpty;
  }

  Future<void> clear() {
    return ref.read(appAccountRepositoryProvider).clear();
  }
}

class AccountEvent {
  AccountEvent(this.account);
  final Account account;
}

class HomeEvent extends AccountEvent {
  HomeEvent(super.account, this.home);
  final Home home;
  String get userId => account.userId;
}

class NewHomeEvent extends HomeEvent {
  NewHomeEvent(super.account, super.home);
}

class CurrentHomeSetEvent extends HomeEvent {
  CurrentHomeSetEvent(super.account, super.home);
}

class CurrentHomeModifiedEvent extends HomeEvent {
  CurrentHomeModifiedEvent(super.account, super.home);
}

@Riverpod(keepAlive: true)
AccountService accountService(AccountServiceRef ref) => AccountService(ref);

@Riverpod()
Future<Optional<Account>> getAccount(GetAccountRef ref,
    {String? userId, Duration? ttl}) {
  return ref.watch(accountServiceProvider).getAccount(userId: userId);
}

@Riverpod()
Future<Optional<Home>> getCurrentHome(GetCurrentHomeRef ref, [String? userId]) {
  return ref.watch(accountServiceProvider).getCurrentHome(userId: userId);
}

@Riverpod()
Future<List<Home>> getHomes(GetHomesRef ref, [String? userId]) {
  return ref.watch(accountServiceProvider).getHomes(userId: userId);
}
