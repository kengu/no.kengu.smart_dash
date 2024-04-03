import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nanoid/nanoid.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_dash/feature/account/application/account_service.dart';
import 'package:smart_dash/feature/home/domain/home.dart';
import 'package:smart_dash/feature/home/domain/location.dart';
import 'package:smart_dash/util/data/json.dart';
import 'package:smart_dash/util/guard.dart';

part 'home_repository.g.dart';

class HomeRepository {
  HomeRepository(this.ref);

  final Ref ref;

  static const key = 'home';

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
    final service = ref.read(accountServiceProvider);
    final result = await service.getAccount(userId: userId);
    if (!result.isPresent) {
      return const Optional.empty();
    }
    final account = result.value;
    final uid = result.value.userId;
    final homes = result.value.homes;

    final it = Home(
      id: nanoid(),
      name: name,
      members: [],
      services: [],
      location: Location.empty(),
    );
    final added = await service.addOrUpdate(
      account.copyWith(homes: [...homes, it]),
    );
    if (!added) return const Optional.empty();

    final current = await _load(uid);
    if (isCurrent && !current.isPresent) {
      await setCurrentHome(uid, it);
    }

    return Optional.of(it);
  }

  /// Get current home selected by [userId].
  ///
  /// If [userId] is not given, current user
  /// is used.
  ///
  /// This method will set the first home in
  /// current user [Account] as current home if
  /// current user have not selected a home
  /// yet. The method will return [Optional.empty]
  /// result if current user is not found.
  Future<Optional<Home>> getCurrentHome([String? userId]) async {
    final account = await ref.read(accountServiceProvider).getAccount(
          userId: userId,
        );
    if (!account.isPresent || account.value.homes.isNotEmpty != true) {
      return const Optional.empty();
    }
    assert(
      account.value.homes.isNotEmpty == true,
      'At least one home should exists in an account',
    );
    final uid = account.value.userId;
    final homes = account.value.homes;
    final current = await _load(uid);

    if (!current.isPresent) {
      await setCurrentHome(uid, homes.first);
      return Optional.of(homes.first);
    }

    // TODO: Make selected home persisted
    final home = homes.firstWhereOptional(
      (home) => current.value.userId == uid,
    );

    if (!home.isPresent) {
      await setCurrentHome(uid, homes.first);
      return Optional.of(homes.first);
    }

    return home;
  }

  /// Get list of homes for given [userId].
  Future<List<Home>> getHomes(String userId) async {
    final account =
        await ref.read(accountServiceProvider).getAccount(userId: userId);
    return account.value.homes;
  }

  /// Set current home for [userId]
  Future<bool> setCurrentHome(String userId, Home home) async {
    final account =
        await ref.read(accountServiceProvider).getAccount(userId: userId);
    if (!account.isPresent) {
      return false;
    }
    assert(
      account.value.homes.isNotEmpty,
      'User $userId have no homes',
    );
    assert(
      account.value.homeWhere(home.id).isPresent,
      'User $userId have no home with name ${home.id}',
    );

    final homes = await _loadAll();
    final current = CurrentHome(userId: userId, homeId: home.id);
    if (homes.isEmpty) {
      return _setAll([current]);
    }
    final next = homes.map((e) => _replace(e, current)).toList();
    return _setAll(next);
  }

  Future<Optional<CurrentHome>> _load(String userId) => guard(
        () async {
          final prefs = await SharedPreferences.getInstance();
          final result = prefs.getStringList(HomeRepository.key);
          if (result == null) return const Optional.empty();
          return result
              .map(jsonDecode)
              .whereType<JsonObject>()
              .map(CurrentHome.fromJson)
              .firstWhereOptional((e) => e.userId == userId);
        },
        task: '_load',
        name: '$HomeRepository',
      );

  Future<List<CurrentHome>> _loadAll() => guard(
        () async {
          final prefs = await SharedPreferences.getInstance();
          final result = prefs.getStringList(HomeRepository.key);
          return result
                  ?.map(jsonDecode)
                  .whereType<JsonObject>()
                  .map(CurrentHome.fromJson)
                  .toList() ??
              [];
        },
        task: '_loadAll',
        name: '$HomeRepository',
      );

  Future<bool> _setAll(List<CurrentHome> homes) => guard(
        () async {
          final prefs = await SharedPreferences.getInstance();
          return prefs.setStringList(
            HomeRepository.key,
            homes.map(jsonEncode).toList(),
          );
        },
        task: '_setAll',
        name: '$HomeRepository',
      );

  CurrentHome _replace(CurrentHome current, CurrentHome next) =>
      current.userId == next.userId ? next : current;
}

@Riverpod(keepAlive: true)
HomeRepository homeRepository(HomeRepositoryRef ref) {
  return HomeRepository(ref);
}
