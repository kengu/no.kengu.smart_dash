import 'dart:convert';

import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_account/smart_dash_account_app.dart';
import 'package:smart_dash_common/smart_dash_common_flutter.dart';
import 'package:smart_dash_datasource/smart_dash_datasource_app.dart';

import 'account_app_client.dart';
import 'account_repository.dart';

part 'account_app_repository.g.dart';

class AccountAppRepository extends ConnectionAwareRepository<String, Account> {
  AccountAppRepository({
    required super.checker,
    required AccountRepositoryMixin local,
    required RemoteAccountRepository remote,
  }) : super(
          local: local,
          remote: remote,
        );

  Future<void> clear() {
    return (local as AccountRepositoryMixin).clear();
  }
}

class LocalAccountRepository
    extends SharedPreferencesRepository<String, Account>
    with AccountRepositoryMixin {
  LocalAccountRepository(Ref ref)
      : super(
          ref,
          AccountRepositoryMixin.key,
//          key: AccountRepositoryMixin.key,
//          box: AccountRepositoryMixin.key,
//          adapter: AccountAdapter(),
//          cipher: FlutterHiveCipherStorage(),
        );
}

class RemoteAccountRepository extends RemoteRepository<String, Account>
    with
        AccountRepositoryMixin,
        BulkRemoteRepositoryMixin<String, Account, Account> {
  RemoteAccountRepository(super.ref, this.baseUrl);

  final String baseUrl;

  @override
  AccountAppClient get client => ref.read(accountClientProvider(baseUrl));
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
AccountAppRepository appAccountRepository(Ref ref) {
  return AccountAppRepository(
    local: LocalAccountRepository(ref),
    remote: RemoteAccountRepository(ref, 'http://localhost:8080'),
    checker: ref.read(connectivityProvider),
  );
}
