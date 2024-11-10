// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_database.dart';

// ignore_for_file: type=lint
class AccountTable extends Table
    with TableInfo<AccountTable, AccountTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  AccountTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'PRIMARY KEY NOT NULL');
  static const VerificationMeta _fnameMeta = const VerificationMeta('fname');
  late final GeneratedColumn<String> fname = GeneratedColumn<String>(
      'fname', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: 'NULL');
  static const VerificationMeta _lnameMeta = const VerificationMeta('lname');
  late final GeneratedColumn<String> lname = GeneratedColumn<String>(
      'lname', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: 'NULL');
  static const VerificationMeta _usersMeta = const VerificationMeta('users');
  late final GeneratedColumnWithTypeConverter<List<User>, String> users =
      GeneratedColumn<String>('users', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: true,
              $customConstraints: 'NOT NULL')
          .withConverter<List<User>>(AccountTable.$converterusers);
  static const VerificationMeta _homesMeta = const VerificationMeta('homes');
  late final GeneratedColumnWithTypeConverter<List<Home>, String> homes =
      GeneratedColumn<String>('homes', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: true,
              $customConstraints: 'NOT NULL')
          .withConverter<List<Home>>(AccountTable.$converterhomes);
  @override
  List<GeneratedColumn> get $columns => [id, fname, lname, users, homes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'AccountTable';
  @override
  VerificationContext validateIntegrity(Insertable<AccountTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('fname')) {
      context.handle(
          _fnameMeta, fname.isAcceptableOrUnknown(data['fname']!, _fnameMeta));
    }
    if (data.containsKey('lname')) {
      context.handle(
          _lnameMeta, lname.isAcceptableOrUnknown(data['lname']!, _lnameMeta));
    }
    context.handle(_usersMeta, const VerificationResult.success());
    context.handle(_homesMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AccountTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AccountTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      fname: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}fname']),
      lname: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}lname']),
      users: AccountTable.$converterusers.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}users'])!),
      homes: AccountTable.$converterhomes.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}homes'])!),
    );
  }

  @override
  AccountTable createAlias(String alias) {
    return AccountTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<List<User>, String, String> $converterusers =
      const UsersConverter();
  static JsonTypeConverter2<List<Home>, String, String> $converterhomes =
      const HomesConverter();
  @override
  bool get dontWriteConstraints => true;
}

class AccountTableData extends DataClass
    implements Insertable<AccountTableData> {
  final String id;
  final String? fname;
  final String? lname;
  final List<User> users;
  final List<Home> homes;
  const AccountTableData(
      {required this.id,
      this.fname,
      this.lname,
      required this.users,
      required this.homes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || fname != null) {
      map['fname'] = Variable<String>(fname);
    }
    if (!nullToAbsent || lname != null) {
      map['lname'] = Variable<String>(lname);
    }
    {
      map['users'] =
          Variable<String>(AccountTable.$converterusers.toSql(users));
    }
    {
      map['homes'] =
          Variable<String>(AccountTable.$converterhomes.toSql(homes));
    }
    return map;
  }

  factory AccountTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AccountTableData(
      id: serializer.fromJson<String>(json['id']),
      fname: serializer.fromJson<String?>(json['fname']),
      lname: serializer.fromJson<String?>(json['lname']),
      users: AccountTable.$converterusers
          .fromJson(serializer.fromJson<String>(json['users'])),
      homes: AccountTable.$converterhomes
          .fromJson(serializer.fromJson<String>(json['homes'])),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'fname': serializer.toJson<String?>(fname),
      'lname': serializer.toJson<String?>(lname),
      'users':
          serializer.toJson<String>(AccountTable.$converterusers.toJson(users)),
      'homes':
          serializer.toJson<String>(AccountTable.$converterhomes.toJson(homes)),
    };
  }

  AccountTableData copyWith(
          {String? id,
          Value<String?> fname = const Value.absent(),
          Value<String?> lname = const Value.absent(),
          List<User>? users,
          List<Home>? homes}) =>
      AccountTableData(
        id: id ?? this.id,
        fname: fname.present ? fname.value : this.fname,
        lname: lname.present ? lname.value : this.lname,
        users: users ?? this.users,
        homes: homes ?? this.homes,
      );
  AccountTableData copyWithCompanion(AccountTableCompanion data) {
    return AccountTableData(
      id: data.id.present ? data.id.value : this.id,
      fname: data.fname.present ? data.fname.value : this.fname,
      lname: data.lname.present ? data.lname.value : this.lname,
      users: data.users.present ? data.users.value : this.users,
      homes: data.homes.present ? data.homes.value : this.homes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AccountTableData(')
          ..write('id: $id, ')
          ..write('fname: $fname, ')
          ..write('lname: $lname, ')
          ..write('users: $users, ')
          ..write('homes: $homes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, fname, lname, users, homes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccountTableData &&
          other.id == this.id &&
          other.fname == this.fname &&
          other.lname == this.lname &&
          other.users == this.users &&
          other.homes == this.homes);
}

class AccountTableCompanion extends UpdateCompanion<AccountTableData> {
  final Value<String> id;
  final Value<String?> fname;
  final Value<String?> lname;
  final Value<List<User>> users;
  final Value<List<Home>> homes;
  final Value<int> rowid;
  const AccountTableCompanion({
    this.id = const Value.absent(),
    this.fname = const Value.absent(),
    this.lname = const Value.absent(),
    this.users = const Value.absent(),
    this.homes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AccountTableCompanion.insert({
    required String id,
    this.fname = const Value.absent(),
    this.lname = const Value.absent(),
    required List<User> users,
    required List<Home> homes,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        users = Value(users),
        homes = Value(homes);
  static Insertable<AccountTableData> custom({
    Expression<String>? id,
    Expression<String>? fname,
    Expression<String>? lname,
    Expression<String>? users,
    Expression<String>? homes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fname != null) 'fname': fname,
      if (lname != null) 'lname': lname,
      if (users != null) 'users': users,
      if (homes != null) 'homes': homes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AccountTableCompanion copyWith(
      {Value<String>? id,
      Value<String?>? fname,
      Value<String?>? lname,
      Value<List<User>>? users,
      Value<List<Home>>? homes,
      Value<int>? rowid}) {
    return AccountTableCompanion(
      id: id ?? this.id,
      fname: fname ?? this.fname,
      lname: lname ?? this.lname,
      users: users ?? this.users,
      homes: homes ?? this.homes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (fname.present) {
      map['fname'] = Variable<String>(fname.value);
    }
    if (lname.present) {
      map['lname'] = Variable<String>(lname.value);
    }
    if (users.present) {
      map['users'] =
          Variable<String>(AccountTable.$converterusers.toSql(users.value));
    }
    if (homes.present) {
      map['homes'] =
          Variable<String>(AccountTable.$converterhomes.toSql(homes.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountTableCompanion(')
          ..write('id: $id, ')
          ..write('fname: $fname, ')
          ..write('lname: $lname, ')
          ..write('users: $users, ')
          ..write('homes: $homes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AccountDatabase extends GeneratedDatabase {
  _$AccountDatabase(QueryExecutor e) : super(e);
  $AccountDatabaseManager get managers => $AccountDatabaseManager(this);
  late final AccountTable accountTable = AccountTable(this);
  Selectable<AccountTableData> getAll() {
    return customSelect('SELECT * FROM AccountTable',
        variables: [],
        readsFrom: {
          accountTable,
        }).asyncMap(accountTable.mapFromRow);
  }

  Selectable<int> exists(String userId) {
    return customSelect(
        switch (executor.dialect) {
          SqlDialect.sqlite => 'SELECT "rowId" FROM AccountTable WHERE id = ?1',
          SqlDialect.postgres ||
          _ =>
            'SELECT "rowId" FROM AccountTable WHERE id = \$1',
        },
        variables: [
          Variable<String>(userId)
        ],
        readsFrom: {
          accountTable,
        }).map((QueryRow row) => row.read<int>('rowid'));
  }

  Selectable<AccountTableData> entriesWithId(List<String> var1) {
    var $arrayStartIndex = 1;
    final expandedvar1 = $expandVar($arrayStartIndex, var1.length);
    $arrayStartIndex += var1.length;
    return customSelect(
        'SELECT * FROM AccountTable WHERE id IN ($expandedvar1)',
        variables: [
          for (var $ in var1) Variable<String>($)
        ],
        readsFrom: {
          accountTable,
        }).asyncMap(accountTable.mapFromRow);
  }

  Selectable<AccountTableData> getAccountWithUserId(String userId) {
    return customSelect(
        switch (executor.dialect) {
          SqlDialect.sqlite =>
            'SELECT * FROM AccountTable WHERE AccountTable.id IN (SELECT AccountTable.id FROM AccountTable,json_each(AccountTable.users)WHERE json_each.value ->> \'\$.userId\' = ?1)',
          SqlDialect.postgres ||
          _ =>
            'SELECT * FROM AccountTable WHERE AccountTable.id IN (SELECT AccountTable.id FROM AccountTable,json_each(AccountTable.users)WHERE json_each.value ->> \'\$.userId\' = \$1)',
        },
        variables: [
          Variable<String>(userId)
        ],
        readsFrom: {
          accountTable,
        }).asyncMap(accountTable.mapFromRow);
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [accountTable];
}

typedef $AccountTableCreateCompanionBuilder = AccountTableCompanion Function({
  required String id,
  Value<String?> fname,
  Value<String?> lname,
  required List<User> users,
  required List<Home> homes,
  Value<int> rowid,
});
typedef $AccountTableUpdateCompanionBuilder = AccountTableCompanion Function({
  Value<String> id,
  Value<String?> fname,
  Value<String?> lname,
  Value<List<User>> users,
  Value<List<Home>> homes,
  Value<int> rowid,
});

class $AccountTableFilterComposer
    extends Composer<_$AccountDatabase, AccountTable> {
  $AccountTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fname => $composableBuilder(
      column: $table.fname, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lname => $composableBuilder(
      column: $table.lname, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<User>, List<User>, String> get users =>
      $composableBuilder(
          column: $table.users,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<Home>, List<Home>, String> get homes =>
      $composableBuilder(
          column: $table.homes,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $AccountTableOrderingComposer
    extends Composer<_$AccountDatabase, AccountTable> {
  $AccountTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fname => $composableBuilder(
      column: $table.fname, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lname => $composableBuilder(
      column: $table.lname, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get users => $composableBuilder(
      column: $table.users, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get homes => $composableBuilder(
      column: $table.homes, builder: (column) => ColumnOrderings(column));
}

class $AccountTableAnnotationComposer
    extends Composer<_$AccountDatabase, AccountTable> {
  $AccountTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get fname =>
      $composableBuilder(column: $table.fname, builder: (column) => column);

  GeneratedColumn<String> get lname =>
      $composableBuilder(column: $table.lname, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<User>, String> get users =>
      $composableBuilder(column: $table.users, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<Home>, String> get homes =>
      $composableBuilder(column: $table.homes, builder: (column) => column);
}

class $AccountTableTableManager extends RootTableManager<
    _$AccountDatabase,
    AccountTable,
    AccountTableData,
    $AccountTableFilterComposer,
    $AccountTableOrderingComposer,
    $AccountTableAnnotationComposer,
    $AccountTableCreateCompanionBuilder,
    $AccountTableUpdateCompanionBuilder,
    (
      AccountTableData,
      BaseReferences<_$AccountDatabase, AccountTable, AccountTableData>
    ),
    AccountTableData,
    PrefetchHooks Function()> {
  $AccountTableTableManager(_$AccountDatabase db, AccountTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $AccountTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $AccountTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $AccountTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String?> fname = const Value.absent(),
            Value<String?> lname = const Value.absent(),
            Value<List<User>> users = const Value.absent(),
            Value<List<Home>> homes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AccountTableCompanion(
            id: id,
            fname: fname,
            lname: lname,
            users: users,
            homes: homes,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<String?> fname = const Value.absent(),
            Value<String?> lname = const Value.absent(),
            required List<User> users,
            required List<Home> homes,
            Value<int> rowid = const Value.absent(),
          }) =>
              AccountTableCompanion.insert(
            id: id,
            fname: fname,
            lname: lname,
            users: users,
            homes: homes,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $AccountTableProcessedTableManager = ProcessedTableManager<
    _$AccountDatabase,
    AccountTable,
    AccountTableData,
    $AccountTableFilterComposer,
    $AccountTableOrderingComposer,
    $AccountTableAnnotationComposer,
    $AccountTableCreateCompanionBuilder,
    $AccountTableUpdateCompanionBuilder,
    (
      AccountTableData,
      BaseReferences<_$AccountDatabase, AccountTable, AccountTableData>
    ),
    AccountTableData,
    PrefetchHooks Function()>;

class $AccountDatabaseManager {
  final _$AccountDatabase _db;
  $AccountDatabaseManager(this._db);
  $AccountTableTableManager get accountTable =>
      $AccountTableTableManager(_db, _db.accountTable);
}
