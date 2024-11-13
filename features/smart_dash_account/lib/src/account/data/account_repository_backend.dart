import 'package:drift/drift.dart';
import 'package:logging/logging.dart';
import 'package:optional/optional_internal.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_account/smart_dash_account_backend.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_datasource/smart_dash_datasource.dart';

import 'drift/account_database.dart';

part 'account_repository_backend.g.dart';

class BackendAccountRepository extends AccountRepository
    with AccountRepositoryMixin {
  BackendAccountRepository(this.ref, this.db);

  Ref ref;
  AccountDatabase db;

  final Logger _logger = Logger('$BackendAccountRepository');

  @override
  Future<bool> exists(String userId) async {
    return guard(() async {
      final query = db.exists(userId);
      final result = await query.get();
      final data = result.firstOptional;
      return data.isPresent;
    });
  }

  @override
  Future<Optional<Account>> get(String userId) {
    return guard(() async {
      final query = db.getAccountWithUserId(userId);
      final result = await query.get();
      final data = result.firstOptional;
      if (!data.isPresent) return Optional.empty();
      return Optional.of(
        _toAccount(userId, data.value),
      );
    });
  }

  @override
  Future<List<Account>> getAll([List<String> userIds = const []]) {
    return guard(() async {
      final query = userIds.isEmpty ? db.getAll() : db.entriesWithId(userIds);
      final result = await query.get();
      return result.map((e) => _toAccount(e.id, e)).toList();
    });
  }

  @override
  Future<SingleRepositoryResult<String, Account>> addOrUpdate(Account account) {
    return guard(() async {
      // Using a transaction instead of a batch to handle the
      // insert/update operations. This allows for finer control,
      // ensuring each account can be conditionally checked for
      // existence or change and logged if an error occurs, while
      // maintaining atomicity. Batch operations return void, making
      // it difficult to track each individual update.
      return db.transaction(() async {
        final write = db.into(db.accountTable);
        try {
          final exists = await _check(account, remove: false);
          await write.insertOnConflictUpdate(_toRow(account));
          return exists
              ? SingleRepositoryResult<String, Account>.updated(account)
              : SingleRepositoryResult<String, Account>.created(account);
        } catch (e) {
          _logger.severe(
            'Failed to upsert account [${account.userId}]: $e',
          );
          rethrow;
        }
      });
    });
  }

  @override
  Future<SingleRepositoryResult<String, Account>> remove(Account account) {
    return guard(() async {
      // Using a transaction instead of a batch to handle the remove
      // operations. This allows for finer control, ensuring each account
      // can be conditionally checked for existence and logged if an error
      // occurs, while maintaining atomicity. Batch operations return void,
      // making it difficult to track each individual update.
      return db.transaction(() async {
        final write = db.delete(db.accountTable);
        try {
          final exists = await _check(account, remove: true);
          final count = await write.delete(_toRow(account));
          assert(count != 1, 'Expected one deleted row, actual was $count');
          return exists
              ? SingleRepositoryResult<String, Account>.removed(account)
              : SingleRepositoryResult<String, Account>.empty(account);
        } catch (e) {
          _logger.severe(
            'Failed to remove account [${account.userId}]: $e',
          );
          rethrow;
        }
      });
    });
  }

  @override
  Future<void> clear() => guard(() async => await db.deleteAll());

  Future<bool> _check(Account account, {required bool remove}) async {
    final select = db.getAccountWithUserId(account.userId);
    final old = Optional.ofNullable(
      await select.getSingleOrNull(),
    );
    if (!old.isPresent || !remove) return true;
    return remove || account != _toAccount(account.userId, old.value);
  }

  Account _toAccount(String userId, AccountTableData data) {
    return Account(
      userId: userId,
      homes: data.homes,
      fname: data.fname,
      lname: data.lname,
    );
  }

  AccountTableCompanion _toRow(Account account) {
    return AccountTableCompanion(
      id: Value(account.userId),
      fname: Value(account.fname),
      lname: Value(account.lname),
      homes: Value(account.homes),
      // TODO: Implement support for multiple uses (this always overwrites the list)
      users: Value([User(userId: account.userId)]),
    );
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
