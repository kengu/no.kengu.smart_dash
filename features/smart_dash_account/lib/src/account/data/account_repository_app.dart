import 'dart:convert';

import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_account/smart_dash_account_app.dart';
import 'package:smart_dash_common/smart_dash_common_flutter.dart';
import 'package:smart_dash_datasource/smart_dash_datasource_app.dart';

part 'account_repository_app.g.dart';

class AppAccountRepository extends ConnectionAwareRepository<String, Account>
    with AccountRepositoryMixin {
  AppAccountRepository(
    super.ref, {
    required AccountRepositoryMixin local,
    required AccountRepositoryMixin remote,
  }) : super(
          local: local,
          remote: remote,
          checker: ref.read(connectivityProvider),
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
    with BulkRemoteRepositoryMixin<String, Account>, AccountRepositoryMixin {
  RemoteAccountRepository(super.ref, this.baseUrl);

  final String baseUrl;

  @override
  AccountClient get client => ref.read(accountClientProvider(baseUrl));

  @override
  Future<void> clear() {
    throw UnsupportedError('$RemoteAccountRepository does not support clear');
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
    ref,
    local: LocalAccountRepository(ref),
    remote: RemoteAccountRepository(ref, 'http://localhost:8080'),
  );
}
