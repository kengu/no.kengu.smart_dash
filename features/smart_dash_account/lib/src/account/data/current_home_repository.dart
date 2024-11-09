import 'dart:convert';

import 'package:optional/optional.dart';
import 'package:smart_dash_account/smart_dash_account.dart';
import 'package:smart_dash_common/smart_dash_common_flutter.dart';

typedef CurrentHomeRepository
    = SharedPreferencesRepository<String, CurrentHome>;

mixin CurrentHomeRepositoryMixin on CurrentHomeRepository {
  static const key = 'current_home';

  @override
  String toId(CurrentHome item) => item.userId;

  @override
  String toKey(String userId) => '$key:$userId';

  @override
  Future<Optional<CurrentHome>> get(String userId);

  /// Set current home for [userId]
  Future<CurrentHome> set(String userId, String homeId) async {
    final current = CurrentHome(userId: userId, homeId: homeId);
    return addOrUpdate(current);
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
