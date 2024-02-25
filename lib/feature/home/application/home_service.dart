import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/home/data/home_repository.dart';
import 'package:smart_dash/feature/home/domain/home.dart';
import 'package:smart_dash/feature/identity/data/user_repository.dart';
import 'package:smart_dash/feature/identity/domain/user.dart';
import 'package:smart_dash/util/future.dart';

part 'home_service.g.dart';

class HomeService {
  HomeService(this.ref);

  Ref ref;
  final _cache = FutureCache(prefix: '$HomeService');

  User get currentUser => ref.read(userRepositoryProvider).currentUser;

  Future<Optional<Home>> newHome(String name, [String? userId]) {
    return ref.read(homeRepositoryProvider).newHome(name);
  }

  Future<Optional<Home>> getCurrentHome([String? userId]) {
    return _cache.getOrFetch('get_current_home', () async {
      final uid = userId ?? currentUser.userId;
      return ref.read(homeRepositoryProvider).getCurrentHome(uid);
    });
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
