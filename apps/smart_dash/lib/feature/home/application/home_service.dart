import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/account/application/account_service.dart';
import 'package:smart_dash/feature/account/domain/account.dart';
import 'package:smart_dash/feature/home/data/home_repository.dart';
import 'package:smart_dash/feature/home/domain/home.dart';
import 'package:smart_dash/feature/identity/data/user_repository.dart';
import 'package:smart_dash/feature/identity/domain/user.dart';
import 'package:smart_dash/util/future.dart';
import 'package:smart_dash/util/guard.dart';

part 'home_service.g.dart';

class HomeService {
  static const ttl = Duration(seconds: 1);
  HomeService(this.ref) {
    ref.onDispose(() {
      _controller.close();
      for (final it in _subscriptions) {
        it.cancel();
      }
    });
    final service = ref.read(accountServiceProvider);
    _subscriptions.add(
      service.changes.listen(_onUpdate),
    );
  }

  final Ref ref;
  final _cache = FutureCache(prefix: '$HomeService');
  final _controller = StreamController<HomeEvent>.broadcast();

  final List<StreamSubscription> _subscriptions = [];

  Stream<HomeEvent> get events => _controller.stream;

  void _onUpdate(Account changed) {
    final current = getCachedCurrentHome();
    if (current.isPresent) {
      final home = current.value;
      final found = changed.homeWhere(home.id);
      if (found.isPresent && found.value != home) {
        _controller.add(CurrentHomeModifiedEvent(
          home: found.value,
          userId: changed.userId,
        ));
      }
    }
  }

  User get currentUser => ref.read(userRepositoryProvider).currentUser;

  Future<Optional<Home>> newHome(String name, [String? userId]) {
    return guard(() async {
      final uid = userId ?? currentUser.userId;
      final service = ref.read(homeRepositoryProvider);
      final result = await service.newHome(name, userId: uid);
      if (result.isPresent) {
        _controller.add(
          NewHomeEvent(userId: uid, home: result.value),
        );
      }
      return result;
    });
  }

  Optional<Home> getCachedCurrentHome([String? userId]) {
    final uid = userId ?? currentUser.userId;
    return _cache.get('get_current_home:$uid');
  }

  Future<Optional<Home>> getCurrentHome({String? userId, Duration? ttl = ttl}) {
    final uid = userId ?? currentUser.userId;
    return _cache.getOrFetch('get_current_home:$uid', () async {
      return ref.read(homeRepositoryProvider).getCurrentHome(uid);
    }, ttl: ttl);
  }

  Future<bool> setCurrentHome(Home home, [String? userId]) {
    return guard(
      () async {
        final uid = userId ?? currentUser.userId;
        final success =
            await ref.read(homeRepositoryProvider).setCurrentHome(uid, home);
        if (success) {
          _controller.add(
            NewHomeEvent(userId: uid, home: home),
          );
        }
        return success;
      },
      name: '$HomeService',
      task: 'setCurrentHome',
    );
  }

  Future<List<Home>> getHomes({String? userId, Duration? ttl = ttl}) {
    final uid = userId ?? currentUser.userId;
    return _cache.getOrFetch('get_homes', () async {
      return ref.read(homeRepositoryProvider).getHomes(uid);
    }, ttl: ttl);
  }
}

@Riverpod(keepAlive: true)
HomeService homeService(HomeServiceRef ref) => HomeService(ref);

@Riverpod()
Future<Optional<Home>> getCurrentHome(GetCurrentHomeRef ref, [String? userId]) {
  return ref.watch(homeServiceProvider).getCurrentHome(userId: userId);
}

@Riverpod()
Future<List<Home>> getHomes(GetHomesRef ref, [String? userId]) {
  return ref.watch(homeServiceProvider).getHomes(userId: userId);
}

class HomeEvent {
  HomeEvent({required this.userId, required this.home});
  final Home home;
  final String userId;
}

class NewHomeEvent extends HomeEvent {
  NewHomeEvent({required super.userId, required super.home});
}

class CurrentHomeSetEvent extends HomeEvent {
  CurrentHomeSetEvent({required super.userId, required super.home});
}

class CurrentHomeModifiedEvent extends HomeEvent {
  CurrentHomeModifiedEvent({required super.userId, required super.home});
}
