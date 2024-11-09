import 'dart:convert';

import 'package:optional/optional_internal.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_account/smart_dash_account.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_common/smart_dash_common_flutter.dart';

import 'account_client.dart';
import 'account_repository.dart';

part 'account_repository_app.g.dart';

class AppAccountRepository extends ConnectionAwareRepository<String, Account>
    with AccountRepositoryMixin {
  AppAccountRepository({
    required AccountRepositoryMixin local,
    required AccountRepositoryMixin remote,
  }) : super(checker: Connectivity.offline, local: local, remote: remote);

  @override
  Future<void> clear() {
    return (local as AccountRepositoryMixin).clear();
  }
}

class LocalAccountRepository
    extends SharedPreferencesRepository<String, Account>
    with AccountRepositoryMixin, AccountRepositoryMixin {
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
  Future<Optional<Account>> get(String userId) => _client().get(userId);

  @override
  Future<List<Account>> getAll([List<String> ids = const []]) =>
      _client().getAll(ids);

  @override
  Future<List<Account>> removeAll(Iterable<Account> items) {
    // TODO: implement removeAll
    throw UnimplementedError();
  }

  @override
  Future<List<Account>> updateAll(Iterable<Account> items) {
    // TODO: implement updateAll
    throw UnimplementedError();
  }

  @override
  Future<void> clear() {
    // TODO: implement delete
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
