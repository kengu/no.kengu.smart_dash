import 'dart:convert';

import 'package:optional/optional.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_account/smart_dash_account_app.dart';
import 'package:smart_dash_common/smart_dash_common_flutter.dart';
import 'package:smart_dash_datasource/smart_dash_datasource_app.dart';

import 'account_client.dart';

part 'account_repository_app.g.dart';

class AppAccountRepository extends ConnectionAwareRepository<String, Account>
    with AccountRepositoryMixin {
  AppAccountRepository({
    required AccountRepositoryMixin local,
    required AccountRepositoryMixin remote,
  }) : super(
          local: local,
          remote: remote,
          checker: Connectivity.online,
        );

  @override
  Future<bool> exists(String userId) async {
    final result = await get(userId);
    return result.isPresent;
  }

  @override
  Future<void> clear() {
    return (local as AccountRepositoryMixin).clear();
  }
}

class LocalAccountRepository
    extends SharedPreferencesRepository<String, Account>
    with AccountRepositoryMixin {
  LocalAccountRepository()
      : super(
          AccountRepositoryMixin.key,
//          key: AccountRepositoryMixin.key,
//          box: AccountRepositoryMixin.key,
//          adapter: AccountAdapter(),
//          cipher: FlutterHiveCipherStorage(),
        );
}

class RemoteAccountRepository extends Repository<String, Account>
    with AccountRepositoryMixin {
  RemoteAccountRepository(this.ref);

  final Ref ref;

  AccountClient _client() => ref.read(accountClientProvider);

  @override
  Future<bool> exists(String userId) => _client().exists(userId);

  @override
  Future<Optional<Account>> get(String userId) => _client().get(userId);

  @override
  Future<List<Account>> getAll([List<String> userIds = const []]) =>
      _client().getAll(userIds);

  @override
  Future<SingleRepositoryResult<String, Account>> addOrUpdate(
      Account account) async {
    final items = await _client().create(account);
    return SingleRepositoryResult<String, Account>.updated(items);
  }

  @override
  Future<SingleRepositoryResult<String, Account>> remove(
      Account account) async {
    final items = await _client().delete(account);
    return SingleRepositoryResult<String, Account>.removed(items);
  }

  @override
  Future<void> clear() {
    // TODO: implement clear
    throw UnimplementedError();
  }
}

class AccountAdapter extends TypedAdapter<Account> {
  AccountAdapter() : super(HiveTypeId.account);

  @override
  Account read(BinaryReader reader) {
    return Account.fromJson(jsonDecode(
      reader.read(),
    ));
  }

  @override
  void write(BinaryWriter writer, Account obj) {
    writer.write(jsonEncode(
      obj.toJson(),
    ));
  }
}

@Riverpod(keepAlive: true)
AppAccountRepository appAccountRepository(AppAccountRepositoryRef ref) {
  return AppAccountRepository(
    local: LocalAccountRepository(),
    remote: RemoteAccountRepository(ref),
  );
}
