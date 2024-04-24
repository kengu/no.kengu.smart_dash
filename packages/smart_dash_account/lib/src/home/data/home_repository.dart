import 'dart:convert';

import 'package:nanoid/nanoid.dart';
import 'package:optional/optional.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_account/smart_dash_account.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

part 'home_repository.g.dart';

class HomeRepository extends SharedPreferencesRepository<String, CurrentHome> {
  HomeRepository(this.ref) : super(key);

  final Ref ref;

  static const key = 'current_home';

  @override
  String toId(CurrentHome item) => item.userId;

  @override
  String toKey(String id) => '$key:$id';

  @override
  String toValue(CurrentHome item) => jsonEncode(item.toJson());

  @override
  CurrentHome? map(String key, String? data) {
    return data == null ? null : CurrentHome.fromJson(jsonDecode(data));
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

    final current = await get(uid);
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
    final current = await get(uid);

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

    final current = CurrentHome(userId: userId, homeId: home.id);
    final updates = await updateAll([current]);
    return updates.isNotEmpty;
  }
}

@Riverpod(keepAlive: true)
HomeRepository homeRepository(HomeRepositoryRef ref) {
  return HomeRepository(ref);
}
