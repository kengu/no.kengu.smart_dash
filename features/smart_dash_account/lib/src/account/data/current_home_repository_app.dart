import 'dart:convert';

import 'package:optional/optional.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_account/smart_dash_account_app.dart';
import 'package:smart_dash_datasource/smart_dash_datasource_app.dart';

part 'current_home_repository_app.g.dart';

typedef CurrentHomeRepository
    = SharedPreferencesRepository<String, CurrentHome>;

mixin CurrentHomeRepositoryMixin
    on SharedPreferencesRepository<String, CurrentHome> {
  static const key = 'current_home';

  @override
  String toId(CurrentHome item) => item.userId;

  @override
  String toKey(String userId) => '$key:$userId';

  @override
  Future<Optional<CurrentHome>> get(String userId);

  /// Set current home for [userId]
  Future<(CurrentHome, bool)> set(String userId, String homeId) async {
    final current = CurrentHome(userId: userId, homeId: homeId);
    final result = await updateAll([current]);
    return (current, result.isNotEmpty);
  }

  @override
  Future<List<CurrentHome>> getAll([List<String> userIds = const []]);

  @override
  String toValue(CurrentHome item) => jsonEncode(item.toJson());

  @override
  CurrentHome? map(String key, String? data) {
    return data == null ? null : CurrentHome.fromJson(jsonDecode(data));
  }
}

class AppCurrentHomeRepository
    extends SharedPreferencesRepository<String, CurrentHome>
    with CurrentHomeRepositoryMixin {
  AppCurrentHomeRepository(this.ref) : super(CurrentHomeRepositoryMixin.key);

  final Ref ref;
}

@Riverpod(keepAlive: true)
AppCurrentHomeRepository appCurrentHomeRepository(
    AppCurrentHomeRepositoryRef ref) {
  return AppCurrentHomeRepository(ref);
}
