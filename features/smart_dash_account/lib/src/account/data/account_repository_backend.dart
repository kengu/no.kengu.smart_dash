import 'package:optional/optional_internal.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_account/smart_dash_account.dart';
import 'package:smart_dash_account/src/account/data/drift/account_database.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

import 'account_repository.dart';

part 'account_repository_backend.g.dart';

class BackendAccountRepository extends AccountRepository
    with AccountRepositoryMixin {
  BackendAccountRepository(this.ref, this.db);

  Ref ref;
  AccountDatabase db;

  @override
  Future<Optional<Account>> get(String userId) {
    return guard(
      () async {
        final query = db.getAccountWithUserId(userId);
        final result = await query.get();
        final data = result.firstOptional;
        if (!data.isPresent) return Optional.empty();
        return Optional.of(Account(
          userId: userId,
          homes: data.value.homes,
          fname: data.value.fname,
          lname: data.value.lname,
        ));
      },
      error: (error, [stackTrace]) {
        return true;
      },
    );
  }

  @override
  Future<List<Account>> getAll([List<String> userIds = const []]) {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<List<Account>> removeAll(Iterable<Account> items) {
    // TODO: implement removeAll
    throw UnimplementedError();
  }

  @override
  String toId(Account item) {
    // TODO: implement toId
    throw UnimplementedError();
  }

  @override
  String toKey(String userId) {
    // TODO: implement toKey
    throw UnimplementedError();
  }

  @override
  Future<List<Account>> updateAll(Iterable<Account> items) {
    // TODO: implement updateAll
    throw UnimplementedError();
  }

  @override
  Future<void> clear() {
    // TODO: implement clear
    throw UnimplementedError();
  }
}

@Riverpod(keepAlive: true)
BackendAccountRepository backendAccountRepository(
    BackendAccountRepositoryRef ref, String dbPath) {
  return BackendAccountRepository(
    ref,
    AccountDatabase(ref, dbPath).autoDispose(ref),
  );
}
