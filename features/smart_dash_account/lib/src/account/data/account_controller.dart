import 'package:riverpod/riverpod.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:smart_dash_account/smart_dash_account_backend.dart';
import 'package:smart_dash_datasource/smart_dash_datasource.dart';

class AccountController
    extends RepositoryController<String, Account, AccountRepositoryMixin> {
  AccountController(this.ref, this.dbPath);

  static const ids = 'ids';
  static const userId = 'userId';

  final String dbPath;
  final ProviderContainer ref;

  @override
  AccountRepositoryMixin get repo =>
      ref.read(backendAccountRepositoryProvider(dbPath));

  @override
  Account fromJson(JsonObject json) {
    return Account.fromJson(json);
  }

  @override
  String toId(String key) {
    return key;
  }

  @override
  String toIdFromJson(JsonObject json, Map<String, String?> params) {
    return (json[userId] ?? params[userId] ?? '') as String;
  }

  @override
  JsonObject toJson(Account item) {
    return item.toJson();
  }

  @override
  Iterable<String> toMissingKeys(JsonObject json, Map<String, String?> params) {
    return <String>[
      if ((params[userId] ?? json[userId]) == null) userId,
    ];
  }

  @override
  Router get router {
    return Router()
      // Queries
      ..get('/account', handleQuery(const [], [ids]))
      ..get('/account/<$userId>', handleGet([userId]))
      // Commands
      ..post('/account', handlePost([userId]))
      ..put('/account/<$userId>', handlePut([userId]))
      ..delete('/account/<$userId>', handleDelete([userId]));
  }
}
