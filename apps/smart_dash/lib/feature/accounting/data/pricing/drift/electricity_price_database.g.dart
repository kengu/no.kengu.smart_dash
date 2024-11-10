// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'electricity_price_database.dart';

// ignore_for_file: type=lint
class ElectricityPriceTable extends Table
    with TableInfo<ElectricityPriceTable, ElectricityPriceTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  ElectricityPriceTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _ts0Meta = const VerificationMeta('ts0');
  late final GeneratedColumn<DateTime> ts0 = GeneratedColumn<DateTime>(
      'ts0', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _ts1Meta = const VerificationMeta('ts1');
  late final GeneratedColumn<DateTime> ts1 = GeneratedColumn<DateTime>(
      'ts1', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _nokPerKwhMeta =
      const VerificationMeta('nokPerKwh');
  late final GeneratedColumn<double> nokPerKwh = GeneratedColumn<double>(
      'nokPerKwh', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _eurPerKwhMeta =
      const VerificationMeta('eurPerKwh');
  late final GeneratedColumn<double> eurPerKwh = GeneratedColumn<double>(
      'eurPerKwh', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _eurToNokRateMeta =
      const VerificationMeta('eurToNokRate');
  late final GeneratedColumn<double> eurToNokRate = GeneratedColumn<double>(
      'eurToNokRate', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _areaMeta = const VerificationMeta('area');
  late final GeneratedColumn<String> area = GeneratedColumn<String>(
      'area', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns =>
      [id, ts0, ts1, nokPerKwh, eurPerKwh, eurToNokRate, area];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ElectricityPriceTable';
  @override
  VerificationContext validateIntegrity(
      Insertable<ElectricityPriceTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ts0')) {
      context.handle(
          _ts0Meta, ts0.isAcceptableOrUnknown(data['ts0']!, _ts0Meta));
    } else if (isInserting) {
      context.missing(_ts0Meta);
    }
    if (data.containsKey('ts1')) {
      context.handle(
          _ts1Meta, ts1.isAcceptableOrUnknown(data['ts1']!, _ts1Meta));
    } else if (isInserting) {
      context.missing(_ts1Meta);
    }
    if (data.containsKey('nokPerKwh')) {
      context.handle(_nokPerKwhMeta,
          nokPerKwh.isAcceptableOrUnknown(data['nokPerKwh']!, _nokPerKwhMeta));
    } else if (isInserting) {
      context.missing(_nokPerKwhMeta);
    }
    if (data.containsKey('eurPerKwh')) {
      context.handle(_eurPerKwhMeta,
          eurPerKwh.isAcceptableOrUnknown(data['eurPerKwh']!, _eurPerKwhMeta));
    } else if (isInserting) {
      context.missing(_eurPerKwhMeta);
    }
    if (data.containsKey('eurToNokRate')) {
      context.handle(
          _eurToNokRateMeta,
          eurToNokRate.isAcceptableOrUnknown(
              data['eurToNokRate']!, _eurToNokRateMeta));
    } else if (isInserting) {
      context.missing(_eurToNokRateMeta);
    }
    if (data.containsKey('area')) {
      context.handle(
          _areaMeta, area.isAcceptableOrUnknown(data['area']!, _areaMeta));
    } else if (isInserting) {
      context.missing(_areaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {ts0, ts1, area},
      ];
  @override
  ElectricityPriceTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ElectricityPriceTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      ts0: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}ts0'])!,
      ts1: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}ts1'])!,
      nokPerKwh: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}nokPerKwh'])!,
      eurPerKwh: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}eurPerKwh'])!,
      eurToNokRate: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}eurToNokRate'])!,
      area: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}area'])!,
    );
  }

  @override
  ElectricityPriceTable createAlias(String alias) {
    return ElectricityPriceTable(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const ['UNIQUE(ts0, ts1, area)'];
  @override
  bool get dontWriteConstraints => true;
}

class ElectricityPriceTableData extends DataClass
    implements Insertable<ElectricityPriceTableData> {
  final int id;
  final DateTime ts0;
  final DateTime ts1;
  final double nokPerKwh;
  final double eurPerKwh;
  final double eurToNokRate;
  final String area;
  const ElectricityPriceTableData(
      {required this.id,
      required this.ts0,
      required this.ts1,
      required this.nokPerKwh,
      required this.eurPerKwh,
      required this.eurToNokRate,
      required this.area});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ts0'] = Variable<DateTime>(ts0);
    map['ts1'] = Variable<DateTime>(ts1);
    map['nokPerKwh'] = Variable<double>(nokPerKwh);
    map['eurPerKwh'] = Variable<double>(eurPerKwh);
    map['eurToNokRate'] = Variable<double>(eurToNokRate);
    map['area'] = Variable<String>(area);
    return map;
  }

  factory ElectricityPriceTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ElectricityPriceTableData(
      id: serializer.fromJson<int>(json['id']),
      ts0: serializer.fromJson<DateTime>(json['ts0']),
      ts1: serializer.fromJson<DateTime>(json['ts1']),
      nokPerKwh: serializer.fromJson<double>(json['nokPerKwh']),
      eurPerKwh: serializer.fromJson<double>(json['eurPerKwh']),
      eurToNokRate: serializer.fromJson<double>(json['eurToNokRate']),
      area: serializer.fromJson<String>(json['area']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ts0': serializer.toJson<DateTime>(ts0),
      'ts1': serializer.toJson<DateTime>(ts1),
      'nokPerKwh': serializer.toJson<double>(nokPerKwh),
      'eurPerKwh': serializer.toJson<double>(eurPerKwh),
      'eurToNokRate': serializer.toJson<double>(eurToNokRate),
      'area': serializer.toJson<String>(area),
    };
  }

  ElectricityPriceTableData copyWith(
          {int? id,
          DateTime? ts0,
          DateTime? ts1,
          double? nokPerKwh,
          double? eurPerKwh,
          double? eurToNokRate,
          String? area}) =>
      ElectricityPriceTableData(
        id: id ?? this.id,
        ts0: ts0 ?? this.ts0,
        ts1: ts1 ?? this.ts1,
        nokPerKwh: nokPerKwh ?? this.nokPerKwh,
        eurPerKwh: eurPerKwh ?? this.eurPerKwh,
        eurToNokRate: eurToNokRate ?? this.eurToNokRate,
        area: area ?? this.area,
      );
  ElectricityPriceTableData copyWithCompanion(
      ElectricityPriceTableCompanion data) {
    return ElectricityPriceTableData(
      id: data.id.present ? data.id.value : this.id,
      ts0: data.ts0.present ? data.ts0.value : this.ts0,
      ts1: data.ts1.present ? data.ts1.value : this.ts1,
      nokPerKwh: data.nokPerKwh.present ? data.nokPerKwh.value : this.nokPerKwh,
      eurPerKwh: data.eurPerKwh.present ? data.eurPerKwh.value : this.eurPerKwh,
      eurToNokRate: data.eurToNokRate.present
          ? data.eurToNokRate.value
          : this.eurToNokRate,
      area: data.area.present ? data.area.value : this.area,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ElectricityPriceTableData(')
          ..write('id: $id, ')
          ..write('ts0: $ts0, ')
          ..write('ts1: $ts1, ')
          ..write('nokPerKwh: $nokPerKwh, ')
          ..write('eurPerKwh: $eurPerKwh, ')
          ..write('eurToNokRate: $eurToNokRate, ')
          ..write('area: $area')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, ts0, ts1, nokPerKwh, eurPerKwh, eurToNokRate, area);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ElectricityPriceTableData &&
          other.id == this.id &&
          other.ts0 == this.ts0 &&
          other.ts1 == this.ts1 &&
          other.nokPerKwh == this.nokPerKwh &&
          other.eurPerKwh == this.eurPerKwh &&
          other.eurToNokRate == this.eurToNokRate &&
          other.area == this.area);
}

class ElectricityPriceTableCompanion
    extends UpdateCompanion<ElectricityPriceTableData> {
  final Value<int> id;
  final Value<DateTime> ts0;
  final Value<DateTime> ts1;
  final Value<double> nokPerKwh;
  final Value<double> eurPerKwh;
  final Value<double> eurToNokRate;
  final Value<String> area;
  const ElectricityPriceTableCompanion({
    this.id = const Value.absent(),
    this.ts0 = const Value.absent(),
    this.ts1 = const Value.absent(),
    this.nokPerKwh = const Value.absent(),
    this.eurPerKwh = const Value.absent(),
    this.eurToNokRate = const Value.absent(),
    this.area = const Value.absent(),
  });
  ElectricityPriceTableCompanion.insert({
    this.id = const Value.absent(),
    required DateTime ts0,
    required DateTime ts1,
    required double nokPerKwh,
    required double eurPerKwh,
    required double eurToNokRate,
    required String area,
  })  : ts0 = Value(ts0),
        ts1 = Value(ts1),
        nokPerKwh = Value(nokPerKwh),
        eurPerKwh = Value(eurPerKwh),
        eurToNokRate = Value(eurToNokRate),
        area = Value(area);
  static Insertable<ElectricityPriceTableData> custom({
    Expression<int>? id,
    Expression<DateTime>? ts0,
    Expression<DateTime>? ts1,
    Expression<double>? nokPerKwh,
    Expression<double>? eurPerKwh,
    Expression<double>? eurToNokRate,
    Expression<String>? area,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ts0 != null) 'ts0': ts0,
      if (ts1 != null) 'ts1': ts1,
      if (nokPerKwh != null) 'nokPerKwh': nokPerKwh,
      if (eurPerKwh != null) 'eurPerKwh': eurPerKwh,
      if (eurToNokRate != null) 'eurToNokRate': eurToNokRate,
      if (area != null) 'area': area,
    });
  }

  ElectricityPriceTableCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? ts0,
      Value<DateTime>? ts1,
      Value<double>? nokPerKwh,
      Value<double>? eurPerKwh,
      Value<double>? eurToNokRate,
      Value<String>? area}) {
    return ElectricityPriceTableCompanion(
      id: id ?? this.id,
      ts0: ts0 ?? this.ts0,
      ts1: ts1 ?? this.ts1,
      nokPerKwh: nokPerKwh ?? this.nokPerKwh,
      eurPerKwh: eurPerKwh ?? this.eurPerKwh,
      eurToNokRate: eurToNokRate ?? this.eurToNokRate,
      area: area ?? this.area,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ts0.present) {
      map['ts0'] = Variable<DateTime>(ts0.value);
    }
    if (ts1.present) {
      map['ts1'] = Variable<DateTime>(ts1.value);
    }
    if (nokPerKwh.present) {
      map['nokPerKwh'] = Variable<double>(nokPerKwh.value);
    }
    if (eurPerKwh.present) {
      map['eurPerKwh'] = Variable<double>(eurPerKwh.value);
    }
    if (eurToNokRate.present) {
      map['eurToNokRate'] = Variable<double>(eurToNokRate.value);
    }
    if (area.present) {
      map['area'] = Variable<String>(area.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ElectricityPriceTableCompanion(')
          ..write('id: $id, ')
          ..write('ts0: $ts0, ')
          ..write('ts1: $ts1, ')
          ..write('nokPerKwh: $nokPerKwh, ')
          ..write('eurPerKwh: $eurPerKwh, ')
          ..write('eurToNokRate: $eurToNokRate, ')
          ..write('area: $area')
          ..write(')'))
        .toString();
  }
}

abstract class _$ElectricityPriceDatabase extends GeneratedDatabase {
  _$ElectricityPriceDatabase(QueryExecutor e) : super(e);
  $ElectricityPriceDatabaseManager get managers =>
      $ElectricityPriceDatabaseManager(this);
  late final ElectricityPriceTable electricityPriceTable =
      ElectricityPriceTable(this);
  Selectable<ElectricityPriceTableData> getFromExactNameAndDate(
      String area, DateTime ts0, DateTime ts1) {
    return customSelect(
        'SELECT * FROM ElectricityPriceTable WHERE area = ?1 AND ts0 BETWEEN ?2 AND ?3',
        variables: [
          Variable<String>(area),
          Variable<DateTime>(ts0),
          Variable<DateTime>(ts1)
        ],
        readsFrom: {
          electricityPriceTable,
        }).asyncMap(electricityPriceTable.mapFromRow);
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [electricityPriceTable];
}

typedef $ElectricityPriceTableCreateCompanionBuilder
    = ElectricityPriceTableCompanion Function({
  Value<int> id,
  required DateTime ts0,
  required DateTime ts1,
  required double nokPerKwh,
  required double eurPerKwh,
  required double eurToNokRate,
  required String area,
});
typedef $ElectricityPriceTableUpdateCompanionBuilder
    = ElectricityPriceTableCompanion Function({
  Value<int> id,
  Value<DateTime> ts0,
  Value<DateTime> ts1,
  Value<double> nokPerKwh,
  Value<double> eurPerKwh,
  Value<double> eurToNokRate,
  Value<String> area,
});

class $ElectricityPriceTableFilterComposer
    extends Composer<_$ElectricityPriceDatabase, ElectricityPriceTable> {
  $ElectricityPriceTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get ts0 => $composableBuilder(
      column: $table.ts0, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get ts1 => $composableBuilder(
      column: $table.ts1, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get nokPerKwh => $composableBuilder(
      column: $table.nokPerKwh, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get eurPerKwh => $composableBuilder(
      column: $table.eurPerKwh, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get eurToNokRate => $composableBuilder(
      column: $table.eurToNokRate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get area => $composableBuilder(
      column: $table.area, builder: (column) => ColumnFilters(column));
}

class $ElectricityPriceTableOrderingComposer
    extends Composer<_$ElectricityPriceDatabase, ElectricityPriceTable> {
  $ElectricityPriceTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get ts0 => $composableBuilder(
      column: $table.ts0, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get ts1 => $composableBuilder(
      column: $table.ts1, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get nokPerKwh => $composableBuilder(
      column: $table.nokPerKwh, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get eurPerKwh => $composableBuilder(
      column: $table.eurPerKwh, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get eurToNokRate => $composableBuilder(
      column: $table.eurToNokRate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get area => $composableBuilder(
      column: $table.area, builder: (column) => ColumnOrderings(column));
}

class $ElectricityPriceTableAnnotationComposer
    extends Composer<_$ElectricityPriceDatabase, ElectricityPriceTable> {
  $ElectricityPriceTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get ts0 =>
      $composableBuilder(column: $table.ts0, builder: (column) => column);

  GeneratedColumn<DateTime> get ts1 =>
      $composableBuilder(column: $table.ts1, builder: (column) => column);

  GeneratedColumn<double> get nokPerKwh =>
      $composableBuilder(column: $table.nokPerKwh, builder: (column) => column);

  GeneratedColumn<double> get eurPerKwh =>
      $composableBuilder(column: $table.eurPerKwh, builder: (column) => column);

  GeneratedColumn<double> get eurToNokRate => $composableBuilder(
      column: $table.eurToNokRate, builder: (column) => column);

  GeneratedColumn<String> get area =>
      $composableBuilder(column: $table.area, builder: (column) => column);
}

class $ElectricityPriceTableTableManager extends RootTableManager<
    _$ElectricityPriceDatabase,
    ElectricityPriceTable,
    ElectricityPriceTableData,
    $ElectricityPriceTableFilterComposer,
    $ElectricityPriceTableOrderingComposer,
    $ElectricityPriceTableAnnotationComposer,
    $ElectricityPriceTableCreateCompanionBuilder,
    $ElectricityPriceTableUpdateCompanionBuilder,
    (
      ElectricityPriceTableData,
      BaseReferences<_$ElectricityPriceDatabase, ElectricityPriceTable,
          ElectricityPriceTableData>
    ),
    ElectricityPriceTableData,
    PrefetchHooks Function()> {
  $ElectricityPriceTableTableManager(
      _$ElectricityPriceDatabase db, ElectricityPriceTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $ElectricityPriceTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $ElectricityPriceTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $ElectricityPriceTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> ts0 = const Value.absent(),
            Value<DateTime> ts1 = const Value.absent(),
            Value<double> nokPerKwh = const Value.absent(),
            Value<double> eurPerKwh = const Value.absent(),
            Value<double> eurToNokRate = const Value.absent(),
            Value<String> area = const Value.absent(),
          }) =>
              ElectricityPriceTableCompanion(
            id: id,
            ts0: ts0,
            ts1: ts1,
            nokPerKwh: nokPerKwh,
            eurPerKwh: eurPerKwh,
            eurToNokRate: eurToNokRate,
            area: area,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime ts0,
            required DateTime ts1,
            required double nokPerKwh,
            required double eurPerKwh,
            required double eurToNokRate,
            required String area,
          }) =>
              ElectricityPriceTableCompanion.insert(
            id: id,
            ts0: ts0,
            ts1: ts1,
            nokPerKwh: nokPerKwh,
            eurPerKwh: eurPerKwh,
            eurToNokRate: eurToNokRate,
            area: area,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $ElectricityPriceTableProcessedTableManager = ProcessedTableManager<
    _$ElectricityPriceDatabase,
    ElectricityPriceTable,
    ElectricityPriceTableData,
    $ElectricityPriceTableFilterComposer,
    $ElectricityPriceTableOrderingComposer,
    $ElectricityPriceTableAnnotationComposer,
    $ElectricityPriceTableCreateCompanionBuilder,
    $ElectricityPriceTableUpdateCompanionBuilder,
    (
      ElectricityPriceTableData,
      BaseReferences<_$ElectricityPriceDatabase, ElectricityPriceTable,
          ElectricityPriceTableData>
    ),
    ElectricityPriceTableData,
    PrefetchHooks Function()>;

class $ElectricityPriceDatabaseManager {
  final _$ElectricityPriceDatabase _db;
  $ElectricityPriceDatabaseManager(this._db);
  $ElectricityPriceTableTableManager get electricityPriceTable =>
      $ElectricityPriceTableTableManager(_db, _db.electricityPriceTable);
}
