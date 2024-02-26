import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/home/data/home_repository.dart';
import 'package:smart_dash/feature/home/domain/home.dart';
import 'package:smart_dash/feature/identity/data/user_repository.dart';
import 'package:smart_dash/feature/identity/domain/user.dart';
import 'package:smart_dash/util/future.dart';
import 'package:smart_dash/util/guard.dart';

part 'home_service.g.dart';

class HomeService {
  HomeService(this.ref) {
    ref.onDispose(() {
      _controller.close();
    });
  }

  final Ref ref;
  final _cache = FutureCache(prefix: '$HomeService');
  final _controller = StreamController<HomeEvent>.broadcast();

  Stream<HomeEvent> get events => _controller.stream;

  User get currentUser => ref.read(userRepositoryProvider).currentUser;

  Future<Optional<Home>> newHome(String name, [String? userId]) {
    return guard(() async {
      final uid = userId ?? currentUser.userId;
      final result =
          await ref.read(homeRepositoryProvider).newHome(name, userId: uid);
      if (result.isPresent) {
        _controller.add(
          NewHomeEvent(userId: uid, home: result.value),
        );
      }
      return result;
    });
  }

  Future<Optional<Home>> getCurrentHome([String? userId]) {
    return _cache.getOrFetch('get_current_home', () async {
      final uid = userId ?? currentUser.userId;
      return ref.read(homeRepositoryProvider).getCurrentHome(uid);
    });
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

  Future<List<Home>> getHomes([String? userId]) {
    final uid = userId ?? currentUser.userId;
    return _cache.getOrFetch('get_homes', () async {
      return ref.read(homeRepositoryProvider).getHomes(uid);
    });
  }
}

@Riverpod(keepAlive: true)
HomeService homeService(HomeServiceRef ref) => HomeService(ref);

@Riverpod()
Future<Optional<Home>> getCurrentHome(GetCurrentHomeRef ref, [String? userId]) {
  return ref.watch(homeServiceProvider).getCurrentHome(userId);
}

@Riverpod()
Future<List<Home>> getHomes(GetHomesRef ref, [String? userId]) {
  return ref.watch(homeServiceProvider).getHomes(userId);
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
