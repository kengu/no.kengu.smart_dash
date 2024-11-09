import 'package:optional/optional_internal.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_account/smart_dash_account.dart';

import 'account_repository.dart';

part 'account_repository_backend.g.dart';

class BackendAccountRepository extends AccountRepository
    with AccountRepositoryMixin {
  BackendAccountRepository();

  @override
  Future<Optional<Account>> get(String id) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<List<Account>> getAll([List<String> ids = const []]) {
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
  String toKey(String id) {
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
    BackendAccountRepositoryRef ref) {
  return BackendAccountRepository();
}
