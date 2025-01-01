import 'package:optional/optional.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:smart_dash_account/smart_dash_account_backend.dart';
import 'package:smart_dash_datasource/smart_dash_datasource.dart';

import 'account_repository.dart';

class AccountBackendController
    extends RepositoryController<String, Account, AccountRepositoryMixin> {
  AccountBackendController(this.ref, this.dbPath);

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
  Future<List<Account>> where(Map<String, List<String>> query) async {
    return repo.where((e) => _matches(e, query));
  }

  bool _matches(Account it, Map<String, List<String>> query) {
    int matches = 0;
    for (final entry in query.entries) {
      if (ids.startsWith(entry.key) && entry.value.contains(it.userId)) {
        matches++;
      }
    }
    return query.length == matches;
  }

  @override
  Future<Optional<ProblemDetails>> validate(
    RepositoryAction action,
    Uri uri,
    Account item,
  ) async {
    // Check home duplicates
    final homeIds = [];
    final duplicateIds = [];
    for (final id in item.homes.map((e) => e.id)) {
      if (homeIds.contains(id)) {
        duplicateIds.add(id);
      }
      homeIds.add(id);
    }
    if (duplicateIds.isNotEmpty) {
      return Optional.of(
        ProblemDetails(
          status: 400,
          type: 'account-duplicate-home',
          title: 'Home duplicate found',
          detail: 'Home ids must be unique. '
              'Duplicate ids: [${duplicateIds.join(',')}]',
          instance: '$uri',
        ),
      );
    }

    return Optional.empty();
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
