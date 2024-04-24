// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_series_database.dart';

// ignore_for_file: type=lint
class TimeSeriesTable extends Table
    with TableInfo<TimeSeriesTable, TimeSeriesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  TimeSeriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _tsMeta = const VerificationMeta('ts');
  late final GeneratedColumn<DateTime> ts = GeneratedColumn<DateTime>(
      'ts', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _spanMeta = const VerificationMeta('span');
  late final GeneratedColumn<int> span = GeneratedColumn<int>(
      'span', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [name, ts, span];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'TimeSeriesTable';
  @override
  VerificationContext validateIntegrity(
      Insertable<TimeSeriesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('ts')) {
      context.handle(_tsMeta, ts.isAcceptableOrUnknown(data['ts']!, _tsMeta));
    } else if (isInserting) {
      context.missing(_tsMeta);
    }
    if (data.containsKey('span')) {
      context.handle(
          _spanMeta, span.isAcceptableOrUnknown(data['span']!, _spanMeta));
    } else if (isInserting) {
      context.missing(_spanMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {name, ts};
  @override
  TimeSeriesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TimeSeriesTableData(
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      ts: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}ts'])!,
      span: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}span'])!,
    );
  }

  @override
  TimeSeriesTable createAlias(String alias) {
    return TimeSeriesTable(attachedDatabase, alias);
  }

  @override
  bool get withoutRowId => true;
  @override
  List<String> get customConstraints => const ['PRIMARY KEY(name, ts)'];
  @override
  bool get dontWriteConstraints => true;
}

class TimeSeriesTableData extends DataClass
    implements Insertable<TimeSeriesTableData> {
  final String name;
  final DateTime ts;
  final int span;
  const TimeSeriesTableData(
      {required this.name, required this.ts, required this.span});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    map['ts'] = Variable<DateTime>(ts);
    map['span'] = Variable<int>(span);
    return map;
  }

  factory TimeSeriesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TimeSeriesTableData(
      name: serializer.fromJson<String>(json['name']),
      ts: serializer.fromJson<DateTime>(json['ts']),
      span: serializer.fromJson<int>(json['span']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'ts': serializer.toJson<DateTime>(ts),
      'span': serializer.toJson<int>(span),
    };
  }

  TimeSeriesTableData copyWith({String? name, DateTime? ts, int? span}) =>
      TimeSeriesTableData(
        name: name ?? this.name,
        ts: ts ?? this.ts,
        span: span ?? this.span,
      );
  TimeSeriesTableData copyWithCompanion(TimeSeriesTableCompanion data) {
    return TimeSeriesTableData(
      name: data.name.present ? data.name.value : this.name,
      ts: data.ts.present ? data.ts.value : this.ts,
      span: data.span.present ? data.span.value : this.span,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TimeSeriesTableData(')
          ..write('name: $name, ')
          ..write('ts: $ts, ')
          ..write('span: $span')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(name, ts, span);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TimeSeriesTableData &&
          other.name == this.name &&
          other.ts == this.ts &&
          other.span == this.span);
}

class TimeSeriesTableCompanion extends UpdateCompanion<TimeSeriesTableData> {
  final Value<String> name;
  final Value<DateTime> ts;
  final Value<int> span;
  const TimeSeriesTableCompanion({
    this.name = const Value.absent(),
    this.ts = const Value.absent(),
    this.span = const Value.absent(),
  });
  TimeSeriesTableCompanion.insert({
    required String name,
    required DateTime ts,
    required int span,
  })  : name = Value(name),
        ts = Value(ts),
        span = Value(span);
  static Insertable<TimeSeriesTableData> custom({
    Expression<String>? name,
    Expression<DateTime>? ts,
    Expression<int>? span,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (ts != null) 'ts': ts,
      if (span != null) 'span': span,
    });
  }

  TimeSeriesTableCompanion copyWith(
      {Value<String>? name, Value<DateTime>? ts, Value<int>? span}) {
    return TimeSeriesTableCompanion(
      name: name ?? this.name,
      ts: ts ?? this.ts,
      span: span ?? this.span,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (ts.present) {
      map['ts'] = Variable<DateTime>(ts.value);
    }
    if (span.present) {
      map['span'] = Variable<int>(span.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TimeSeriesTableCompanion(')
          ..write('name: $name, ')
          ..write('ts: $ts, ')
          ..write('span: $span')
          ..write(')'))
        .toString();
  }
}

class DataVectorTable extends Table
    with TableInfo<DataVectorTable, DataVectorTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  DataVectorTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _idxMeta = const VerificationMeta('idx');
  late final GeneratedColumn<int> idx = GeneratedColumn<int>(
      'idx', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _tsMeta = const VerificationMeta('ts');
  late final GeneratedColumn<DateTime> ts = GeneratedColumn<DateTime>(
      'ts', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  late final GeneratedColumnWithTypeConverter<DataVectorType, String> type =
      GeneratedColumn<String>('type', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: true,
              $customConstraints: 'NOT NULL')
          .withConverter<DataVectorType>(DataVectorTable.$convertertype);
  @override
  List<GeneratedColumn> get $columns => [id, idx, name, ts, data, type];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'DataVectorTable';
  @override
  VerificationContext validateIntegrity(
      Insertable<DataVectorTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('idx')) {
      context.handle(
          _idxMeta, idx.isAcceptableOrUnknown(data['idx']!, _idxMeta));
    } else if (isInserting) {
      context.missing(_idxMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('ts')) {
      context.handle(_tsMeta, ts.isAcceptableOrUnknown(data['ts']!, _tsMeta));
    } else if (isInserting) {
      context.missing(_tsMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
          _dataMeta, this.data.isAcceptableOrUnknown(data['data']!, _dataMeta));
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    context.handle(_typeMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {name, ts, idx},
      ];
  @override
  DataVectorTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DataVectorTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      idx: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}idx'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      ts: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}ts'])!,
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!,
      type: DataVectorTable.$convertertype.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!),
    );
  }

  @override
  DataVectorTable createAlias(String alias) {
    return DataVectorTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<DataVectorType, String, String> $convertertype =
      const EnumNameConverter<DataVectorType>(DataVectorType.values);
  @override
  List<String> get customConstraints => const [
        'UNIQUE(name, ts, idx)',
        'FOREIGN KEY(name, ts)REFERENCES TimeSeriesTable(name, ts)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class DataVectorTableData extends DataClass
    implements Insertable<DataVectorTableData> {
  final int id;
  final int idx;
  final String name;
  final DateTime ts;
  final String data;
  final DataVectorType type;
  const DataVectorTableData(
      {required this.id,
      required this.idx,
      required this.name,
      required this.ts,
      required this.data,
      required this.type});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['idx'] = Variable<int>(idx);
    map['name'] = Variable<String>(name);
    map['ts'] = Variable<DateTime>(ts);
    map['data'] = Variable<String>(data);
    {
      map['type'] =
          Variable<String>(DataVectorTable.$convertertype.toSql(type));
    }
    return map;
  }

  factory DataVectorTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DataVectorTableData(
      id: serializer.fromJson<int>(json['id']),
      idx: serializer.fromJson<int>(json['idx']),
      name: serializer.fromJson<String>(json['name']),
      ts: serializer.fromJson<DateTime>(json['ts']),
      data: serializer.fromJson<String>(json['data']),
      type: DataVectorTable.$convertertype
          .fromJson(serializer.fromJson<String>(json['type'])),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idx': serializer.toJson<int>(idx),
      'name': serializer.toJson<String>(name),
      'ts': serializer.toJson<DateTime>(ts),
      'data': serializer.toJson<String>(data),
      'type': serializer
          .toJson<String>(DataVectorTable.$convertertype.toJson(type)),
    };
  }

  DataVectorTableData copyWith(
          {int? id,
          int? idx,
          String? name,
          DateTime? ts,
          String? data,
          DataVectorType? type}) =>
      DataVectorTableData(
        id: id ?? this.id,
        idx: idx ?? this.idx,
        name: name ?? this.name,
        ts: ts ?? this.ts,
        data: data ?? this.data,
        type: type ?? this.type,
      );
  DataVectorTableData copyWithCompanion(DataVectorTableCompanion data) {
    return DataVectorTableData(
      id: data.id.present ? data.id.value : this.id,
      idx: data.idx.present ? data.idx.value : this.idx,
      name: data.name.present ? data.name.value : this.name,
      ts: data.ts.present ? data.ts.value : this.ts,
      data: data.data.present ? data.data.value : this.data,
      type: data.type.present ? data.type.value : this.type,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DataVectorTableData(')
          ..write('id: $id, ')
          ..write('idx: $idx, ')
          ..write('name: $name, ')
          ..write('ts: $ts, ')
          ..write('data: $data, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, idx, name, ts, data, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DataVectorTableData &&
          other.id == this.id &&
          other.idx == this.idx &&
          other.name == this.name &&
          other.ts == this.ts &&
          other.data == this.data &&
          other.type == this.type);
}

class DataVectorTableCompanion extends UpdateCompanion<DataVectorTableData> {
  final Value<int> id;
  final Value<int> idx;
  final Value<String> name;
  final Value<DateTime> ts;
  final Value<String> data;
  final Value<DataVectorType> type;
  const DataVectorTableCompanion({
    this.id = const Value.absent(),
    this.idx = const Value.absent(),
    this.name = const Value.absent(),
    this.ts = const Value.absent(),
    this.data = const Value.absent(),
    this.type = const Value.absent(),
  });
  DataVectorTableCompanion.insert({
    this.id = const Value.absent(),
    required int idx,
    required String name,
    required DateTime ts,
    required String data,
    required DataVectorType type,
  })  : idx = Value(idx),
        name = Value(name),
        ts = Value(ts),
        data = Value(data),
        type = Value(type);
  static Insertable<DataVectorTableData> custom({
    Expression<int>? id,
    Expression<int>? idx,
    Expression<String>? name,
    Expression<DateTime>? ts,
    Expression<String>? data,
    Expression<String>? type,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idx != null) 'idx': idx,
      if (name != null) 'name': name,
      if (ts != null) 'ts': ts,
      if (data != null) 'data': data,
      if (type != null) 'type': type,
    });
  }

  DataVectorTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? idx,
      Value<String>? name,
      Value<DateTime>? ts,
      Value<String>? data,
      Value<DataVectorType>? type}) {
    return DataVectorTableCompanion(
      id: id ?? this.id,
      idx: idx ?? this.idx,
      name: name ?? this.name,
      ts: ts ?? this.ts,
      data: data ?? this.data,
      type: type ?? this.type,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idx.present) {
      map['idx'] = Variable<int>(idx.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (ts.present) {
      map['ts'] = Variable<DateTime>(ts.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (type.present) {
      map['type'] =
          Variable<String>(DataVectorTable.$convertertype.toSql(type.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DataVectorTableCompanion(')
          ..write('id: $id, ')
          ..write('idx: $idx, ')
          ..write('name: $name, ')
          ..write('ts: $ts, ')
          ..write('data: $data, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }
}

class DataCoordsTable extends Table
    with TableInfo<DataCoordsTable, DataCoordsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  DataCoordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _tsMeta = const VerificationMeta('ts');
  late final GeneratedColumn<DateTime> ts = GeneratedColumn<DateTime>(
      'ts', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [id, name, ts, data];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'DataCoordsTable';
  @override
  VerificationContext validateIntegrity(
      Insertable<DataCoordsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('ts')) {
      context.handle(_tsMeta, ts.isAcceptableOrUnknown(data['ts']!, _tsMeta));
    } else if (isInserting) {
      context.missing(_tsMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
          _dataMeta, this.data.isAcceptableOrUnknown(data['data']!, _dataMeta));
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {name, ts},
      ];
  @override
  DataCoordsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DataCoordsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      ts: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}ts'])!,
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!,
    );
  }

  @override
  DataCoordsTable createAlias(String alias) {
    return DataCoordsTable(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
        'UNIQUE(name, ts)',
        'FOREIGN KEY(name, ts)REFERENCES TimeSeriesTable(name, ts)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class DataCoordsTableData extends DataClass
    implements Insertable<DataCoordsTableData> {
  final int id;
  final String name;
  final DateTime ts;
  final String data;
  const DataCoordsTableData(
      {required this.id,
      required this.name,
      required this.ts,
      required this.data});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['ts'] = Variable<DateTime>(ts);
    map['data'] = Variable<String>(data);
    return map;
  }

  factory DataCoordsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DataCoordsTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      ts: serializer.fromJson<DateTime>(json['ts']),
      data: serializer.fromJson<String>(json['data']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'ts': serializer.toJson<DateTime>(ts),
      'data': serializer.toJson<String>(data),
    };
  }

  DataCoordsTableData copyWith(
          {int? id, String? name, DateTime? ts, String? data}) =>
      DataCoordsTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        ts: ts ?? this.ts,
        data: data ?? this.data,
      );
  DataCoordsTableData copyWithCompanion(DataCoordsTableCompanion data) {
    return DataCoordsTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      ts: data.ts.present ? data.ts.value : this.ts,
      data: data.data.present ? data.data.value : this.data,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DataCoordsTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('ts: $ts, ')
          ..write('data: $data')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, ts, data);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DataCoordsTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.ts == this.ts &&
          other.data == this.data);
}

class DataCoordsTableCompanion extends UpdateCompanion<DataCoordsTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> ts;
  final Value<String> data;
  const DataCoordsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.ts = const Value.absent(),
    this.data = const Value.absent(),
  });
  DataCoordsTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required DateTime ts,
    required String data,
  })  : name = Value(name),
        ts = Value(ts),
        data = Value(data);
  static Insertable<DataCoordsTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? ts,
    Expression<String>? data,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (ts != null) 'ts': ts,
      if (data != null) 'data': data,
    });
  }

  DataCoordsTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<DateTime>? ts,
      Value<String>? data}) {
    return DataCoordsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      ts: ts ?? this.ts,
      data: data ?? this.data,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (ts.present) {
      map['ts'] = Variable<DateTime>(ts.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DataCoordsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('ts: $ts, ')
          ..write('data: $data')
          ..write(')'))
        .toString();
  }
}

class DataDimsTable extends Table
    with TableInfo<DataDimsTable, DataDimsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  DataDimsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _tsMeta = const VerificationMeta('ts');
  late final GeneratedColumn<DateTime> ts = GeneratedColumn<DateTime>(
      'ts', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [id, name, ts, data];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'DataDimsTable';
  @override
  VerificationContext validateIntegrity(Insertable<DataDimsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('ts')) {
      context.handle(_tsMeta, ts.isAcceptableOrUnknown(data['ts']!, _tsMeta));
    } else if (isInserting) {
      context.missing(_tsMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
          _dataMeta, this.data.isAcceptableOrUnknown(data['data']!, _dataMeta));
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {name, ts},
      ];
  @override
  DataDimsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DataDimsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      ts: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}ts'])!,
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!,
    );
  }

  @override
  DataDimsTable createAlias(String alias) {
    return DataDimsTable(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
        'UNIQUE(name, ts)',
        'FOREIGN KEY(name, ts)REFERENCES TimeSeriesTable(name, ts)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class DataDimsTableData extends DataClass
    implements Insertable<DataDimsTableData> {
  final int id;
  final String name;
  final DateTime ts;
  final String data;
  const DataDimsTableData(
      {required this.id,
      required this.name,
      required this.ts,
      required this.data});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['ts'] = Variable<DateTime>(ts);
    map['data'] = Variable<String>(data);
    return map;
  }

  factory DataDimsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DataDimsTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      ts: serializer.fromJson<DateTime>(json['ts']),
      data: serializer.fromJson<String>(json['data']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'ts': serializer.toJson<DateTime>(ts),
      'data': serializer.toJson<String>(data),
    };
  }

  DataDimsTableData copyWith(
          {int? id, String? name, DateTime? ts, String? data}) =>
      DataDimsTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        ts: ts ?? this.ts,
        data: data ?? this.data,
      );
  DataDimsTableData copyWithCompanion(DataDimsTableCompanion data) {
    return DataDimsTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      ts: data.ts.present ? data.ts.value : this.ts,
      data: data.data.present ? data.data.value : this.data,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DataDimsTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('ts: $ts, ')
          ..write('data: $data')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, ts, data);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DataDimsTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.ts == this.ts &&
          other.data == this.data);
}

class DataDimsTableCompanion extends UpdateCompanion<DataDimsTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> ts;
  final Value<String> data;
  const DataDimsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.ts = const Value.absent(),
    this.data = const Value.absent(),
  });
  DataDimsTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required DateTime ts,
    required String data,
  })  : name = Value(name),
        ts = Value(ts),
        data = Value(data);
  static Insertable<DataDimsTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? ts,
    Expression<String>? data,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (ts != null) 'ts': ts,
      if (data != null) 'data': data,
    });
  }

  DataDimsTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<DateTime>? ts,
      Value<String>? data}) {
    return DataDimsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      ts: ts ?? this.ts,
      data: data ?? this.data,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (ts.present) {
      map['ts'] = Variable<DateTime>(ts.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DataDimsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('ts: $ts, ')
          ..write('data: $data')
          ..write(')'))
        .toString();
  }
}

abstract class _$TimeSeriesDatabase extends GeneratedDatabase {
  _$TimeSeriesDatabase(QueryExecutor e) : super(e);
  $TimeSeriesDatabaseManager get managers => $TimeSeriesDatabaseManager(this);
  late final TimeSeriesTable timeSeriesTable = TimeSeriesTable(this);
  late final DataVectorTable dataVectorTable = DataVectorTable(this);
  late final DataCoordsTable dataCoordsTable = DataCoordsTable(this);
  late final DataDimsTable dataDimsTable = DataDimsTable(this);
  Selectable<TimeSeriesTableData> getFromExactName(String name, DateTime ts) {
    return customSelect(
        'SELECT * FROM TimeSeriesTable WHERE name = ?1 AND ts = ?2',
        variables: [
          Variable<String>(name),
          Variable<DateTime>(ts)
        ],
        readsFrom: {
          timeSeriesTable,
        }).asyncMap(timeSeriesTable.mapFromRow);
  }

  Selectable<DataVectorTableData> getVectorsFromName(String name, DateTime ts) {
    return customSelect(
        'SELECT * FROM DataVectorTable WHERE name = ?1 AND ts = ?2',
        variables: [
          Variable<String>(name),
          Variable<DateTime>(ts)
        ],
        readsFrom: {
          dataVectorTable,
        }).asyncMap(dataVectorTable.mapFromRow);
  }

  Selectable<DataCoordsTableData> getCoordsFromName(String name, DateTime ts) {
    return customSelect(
        'SELECT * FROM DataCoordsTable WHERE name = ?1 AND ts = ?2',
        variables: [
          Variable<String>(name),
          Variable<DateTime>(ts)
        ],
        readsFrom: {
          dataCoordsTable,
        }).asyncMap(dataCoordsTable.mapFromRow);
  }

  Selectable<DataDimsTableData> getDimsFromName(String name, DateTime ts) {
    return customSelect(
        'SELECT * FROM DataDimsTable WHERE name = ?1 AND ts = ?2',
        variables: [
          Variable<String>(name),
          Variable<DateTime>(ts)
        ],
        readsFrom: {
          dataDimsTable,
        }).asyncMap(dataDimsTable.mapFromRow);
  }

  Future<int> insertTimeSeries(String name, DateTime ts, int span) {
    return customInsert(
      'INSERT INTO TimeSeriesTable (name, ts, span) VALUES (?1, ?2, ?3)',
      variables: [
        Variable<String>(name),
        Variable<DateTime>(ts),
        Variable<int>(span)
      ],
      updates: {timeSeriesTable},
    );
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [timeSeriesTable, dataVectorTable, dataCoordsTable, dataDimsTable];
}

typedef $TimeSeriesTableCreateCompanionBuilder = TimeSeriesTableCompanion
    Function({
  required String name,
  required DateTime ts,
  required int span,
});
typedef $TimeSeriesTableUpdateCompanionBuilder = TimeSeriesTableCompanion
    Function({
  Value<String> name,
  Value<DateTime> ts,
  Value<int> span,
});

class $TimeSeriesTableFilterComposer
    extends Composer<_$TimeSeriesDatabase, TimeSeriesTable> {
  $TimeSeriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get ts => $composableBuilder(
      column: $table.ts, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get span => $composableBuilder(
      column: $table.span, builder: (column) => ColumnFilters(column));
}

class $TimeSeriesTableOrderingComposer
    extends Composer<_$TimeSeriesDatabase, TimeSeriesTable> {
  $TimeSeriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get ts => $composableBuilder(
      column: $table.ts, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get span => $composableBuilder(
      column: $table.span, builder: (column) => ColumnOrderings(column));
}

class $TimeSeriesTableAnnotationComposer
    extends Composer<_$TimeSeriesDatabase, TimeSeriesTable> {
  $TimeSeriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get ts =>
      $composableBuilder(column: $table.ts, builder: (column) => column);

  GeneratedColumn<int> get span =>
      $composableBuilder(column: $table.span, builder: (column) => column);
}

class $TimeSeriesTableTableManager extends RootTableManager<
    _$TimeSeriesDatabase,
    TimeSeriesTable,
    TimeSeriesTableData,
    $TimeSeriesTableFilterComposer,
    $TimeSeriesTableOrderingComposer,
    $TimeSeriesTableAnnotationComposer,
    $TimeSeriesTableCreateCompanionBuilder,
    $TimeSeriesTableUpdateCompanionBuilder,
    (
      TimeSeriesTableData,
      BaseReferences<_$TimeSeriesDatabase, TimeSeriesTable, TimeSeriesTableData>
    ),
    TimeSeriesTableData,
    PrefetchHooks Function()> {
  $TimeSeriesTableTableManager(_$TimeSeriesDatabase db, TimeSeriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $TimeSeriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $TimeSeriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $TimeSeriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> name = const Value.absent(),
            Value<DateTime> ts = const Value.absent(),
            Value<int> span = const Value.absent(),
          }) =>
              TimeSeriesTableCompanion(
            name: name,
            ts: ts,
            span: span,
          ),
          createCompanionCallback: ({
            required String name,
            required DateTime ts,
            required int span,
          }) =>
              TimeSeriesTableCompanion.insert(
            name: name,
            ts: ts,
            span: span,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $TimeSeriesTableProcessedTableManager = ProcessedTableManager<
    _$TimeSeriesDatabase,
    TimeSeriesTable,
    TimeSeriesTableData,
    $TimeSeriesTableFilterComposer,
    $TimeSeriesTableOrderingComposer,
    $TimeSeriesTableAnnotationComposer,
    $TimeSeriesTableCreateCompanionBuilder,
    $TimeSeriesTableUpdateCompanionBuilder,
    (
      TimeSeriesTableData,
      BaseReferences<_$TimeSeriesDatabase, TimeSeriesTable, TimeSeriesTableData>
    ),
    TimeSeriesTableData,
    PrefetchHooks Function()>;
typedef $DataVectorTableCreateCompanionBuilder = DataVectorTableCompanion
    Function({
  Value<int> id,
  required int idx,
  required String name,
  required DateTime ts,
  required String data,
  required DataVectorType type,
});
typedef $DataVectorTableUpdateCompanionBuilder = DataVectorTableCompanion
    Function({
  Value<int> id,
  Value<int> idx,
  Value<String> name,
  Value<DateTime> ts,
  Value<String> data,
  Value<DataVectorType> type,
});

class $DataVectorTableFilterComposer
    extends Composer<_$TimeSeriesDatabase, DataVectorTable> {
  $DataVectorTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get idx => $composableBuilder(
      column: $table.idx, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get ts => $composableBuilder(
      column: $table.ts, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get data => $composableBuilder(
      column: $table.data, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<DataVectorType, DataVectorType, String>
      get type => $composableBuilder(
          column: $table.type,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $DataVectorTableOrderingComposer
    extends Composer<_$TimeSeriesDatabase, DataVectorTable> {
  $DataVectorTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get idx => $composableBuilder(
      column: $table.idx, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get ts => $composableBuilder(
      column: $table.ts, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get data => $composableBuilder(
      column: $table.data, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));
}

class $DataVectorTableAnnotationComposer
    extends Composer<_$TimeSeriesDatabase, DataVectorTable> {
  $DataVectorTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get idx =>
      $composableBuilder(column: $table.idx, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get ts =>
      $composableBuilder(column: $table.ts, builder: (column) => column);

  GeneratedColumn<String> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DataVectorType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);
}

class $DataVectorTableTableManager extends RootTableManager<
    _$TimeSeriesDatabase,
    DataVectorTable,
    DataVectorTableData,
    $DataVectorTableFilterComposer,
    $DataVectorTableOrderingComposer,
    $DataVectorTableAnnotationComposer,
    $DataVectorTableCreateCompanionBuilder,
    $DataVectorTableUpdateCompanionBuilder,
    (
      DataVectorTableData,
      BaseReferences<_$TimeSeriesDatabase, DataVectorTable, DataVectorTableData>
    ),
    DataVectorTableData,
    PrefetchHooks Function()> {
  $DataVectorTableTableManager(_$TimeSeriesDatabase db, DataVectorTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $DataVectorTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $DataVectorTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $DataVectorTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> idx = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<DateTime> ts = const Value.absent(),
            Value<String> data = const Value.absent(),
            Value<DataVectorType> type = const Value.absent(),
          }) =>
              DataVectorTableCompanion(
            id: id,
            idx: idx,
            name: name,
            ts: ts,
            data: data,
            type: type,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int idx,
            required String name,
            required DateTime ts,
            required String data,
            required DataVectorType type,
          }) =>
              DataVectorTableCompanion.insert(
            id: id,
            idx: idx,
            name: name,
            ts: ts,
            data: data,
            type: type,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $DataVectorTableProcessedTableManager = ProcessedTableManager<
    _$TimeSeriesDatabase,
    DataVectorTable,
    DataVectorTableData,
    $DataVectorTableFilterComposer,
    $DataVectorTableOrderingComposer,
    $DataVectorTableAnnotationComposer,
    $DataVectorTableCreateCompanionBuilder,
    $DataVectorTableUpdateCompanionBuilder,
    (
      DataVectorTableData,
      BaseReferences<_$TimeSeriesDatabase, DataVectorTable, DataVectorTableData>
    ),
    DataVectorTableData,
    PrefetchHooks Function()>;
typedef $DataCoordsTableCreateCompanionBuilder = DataCoordsTableCompanion
    Function({
  Value<int> id,
  required String name,
  required DateTime ts,
  required String data,
});
typedef $DataCoordsTableUpdateCompanionBuilder = DataCoordsTableCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<DateTime> ts,
  Value<String> data,
});

class $DataCoordsTableFilterComposer
    extends Composer<_$TimeSeriesDatabase, DataCoordsTable> {
  $DataCoordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get ts => $composableBuilder(
      column: $table.ts, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get data => $composableBuilder(
      column: $table.data, builder: (column) => ColumnFilters(column));
}

class $DataCoordsTableOrderingComposer
    extends Composer<_$TimeSeriesDatabase, DataCoordsTable> {
  $DataCoordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get ts => $composableBuilder(
      column: $table.ts, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get data => $composableBuilder(
      column: $table.data, builder: (column) => ColumnOrderings(column));
}

class $DataCoordsTableAnnotationComposer
    extends Composer<_$TimeSeriesDatabase, DataCoordsTable> {
  $DataCoordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get ts =>
      $composableBuilder(column: $table.ts, builder: (column) => column);

  GeneratedColumn<String> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);
}

class $DataCoordsTableTableManager extends RootTableManager<
    _$TimeSeriesDatabase,
    DataCoordsTable,
    DataCoordsTableData,
    $DataCoordsTableFilterComposer,
    $DataCoordsTableOrderingComposer,
    $DataCoordsTableAnnotationComposer,
    $DataCoordsTableCreateCompanionBuilder,
    $DataCoordsTableUpdateCompanionBuilder,
    (
      DataCoordsTableData,
      BaseReferences<_$TimeSeriesDatabase, DataCoordsTable, DataCoordsTableData>
    ),
    DataCoordsTableData,
    PrefetchHooks Function()> {
  $DataCoordsTableTableManager(_$TimeSeriesDatabase db, DataCoordsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $DataCoordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $DataCoordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $DataCoordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<DateTime> ts = const Value.absent(),
            Value<String> data = const Value.absent(),
          }) =>
              DataCoordsTableCompanion(
            id: id,
            name: name,
            ts: ts,
            data: data,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required DateTime ts,
            required String data,
          }) =>
              DataCoordsTableCompanion.insert(
            id: id,
            name: name,
            ts: ts,
            data: data,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $DataCoordsTableProcessedTableManager = ProcessedTableManager<
    _$TimeSeriesDatabase,
    DataCoordsTable,
    DataCoordsTableData,
    $DataCoordsTableFilterComposer,
    $DataCoordsTableOrderingComposer,
    $DataCoordsTableAnnotationComposer,
    $DataCoordsTableCreateCompanionBuilder,
    $DataCoordsTableUpdateCompanionBuilder,
    (
      DataCoordsTableData,
      BaseReferences<_$TimeSeriesDatabase, DataCoordsTable, DataCoordsTableData>
    ),
    DataCoordsTableData,
    PrefetchHooks Function()>;
typedef $DataDimsTableCreateCompanionBuilder = DataDimsTableCompanion Function({
  Value<int> id,
  required String name,
  required DateTime ts,
  required String data,
});
typedef $DataDimsTableUpdateCompanionBuilder = DataDimsTableCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<DateTime> ts,
  Value<String> data,
});

class $DataDimsTableFilterComposer
    extends Composer<_$TimeSeriesDatabase, DataDimsTable> {
  $DataDimsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get ts => $composableBuilder(
      column: $table.ts, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get data => $composableBuilder(
      column: $table.data, builder: (column) => ColumnFilters(column));
}

class $DataDimsTableOrderingComposer
    extends Composer<_$TimeSeriesDatabase, DataDimsTable> {
  $DataDimsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get ts => $composableBuilder(
      column: $table.ts, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get data => $composableBuilder(
      column: $table.data, builder: (column) => ColumnOrderings(column));
}

class $DataDimsTableAnnotationComposer
    extends Composer<_$TimeSeriesDatabase, DataDimsTable> {
  $DataDimsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get ts =>
      $composableBuilder(column: $table.ts, builder: (column) => column);

  GeneratedColumn<String> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);
}

class $DataDimsTableTableManager extends RootTableManager<
    _$TimeSeriesDatabase,
    DataDimsTable,
    DataDimsTableData,
    $DataDimsTableFilterComposer,
    $DataDimsTableOrderingComposer,
    $DataDimsTableAnnotationComposer,
    $DataDimsTableCreateCompanionBuilder,
    $DataDimsTableUpdateCompanionBuilder,
    (
      DataDimsTableData,
      BaseReferences<_$TimeSeriesDatabase, DataDimsTable, DataDimsTableData>
    ),
    DataDimsTableData,
    PrefetchHooks Function()> {
  $DataDimsTableTableManager(_$TimeSeriesDatabase db, DataDimsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $DataDimsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $DataDimsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $DataDimsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<DateTime> ts = const Value.absent(),
            Value<String> data = const Value.absent(),
          }) =>
              DataDimsTableCompanion(
            id: id,
            name: name,
            ts: ts,
            data: data,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required DateTime ts,
            required String data,
          }) =>
              DataDimsTableCompanion.insert(
            id: id,
            name: name,
            ts: ts,
            data: data,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $DataDimsTableProcessedTableManager = ProcessedTableManager<
    _$TimeSeriesDatabase,
    DataDimsTable,
    DataDimsTableData,
    $DataDimsTableFilterComposer,
    $DataDimsTableOrderingComposer,
    $DataDimsTableAnnotationComposer,
    $DataDimsTableCreateCompanionBuilder,
    $DataDimsTableUpdateCompanionBuilder,
    (
      DataDimsTableData,
      BaseReferences<_$TimeSeriesDatabase, DataDimsTable, DataDimsTableData>
    ),
    DataDimsTableData,
    PrefetchHooks Function()>;

class $TimeSeriesDatabaseManager {
  final _$TimeSeriesDatabase _db;
  $TimeSeriesDatabaseManager(this._db);
  $TimeSeriesTableTableManager get timeSeriesTable =>
      $TimeSeriesTableTableManager(_db, _db.timeSeriesTable);
  $DataVectorTableTableManager get dataVectorTable =>
      $DataVectorTableTableManager(_db, _db.dataVectorTable);
  $DataCoordsTableTableManager get dataCoordsTable =>
      $DataCoordsTableTableManager(_db, _db.dataCoordsTable);
  $DataDimsTableTableManager get dataDimsTable =>
      $DataDimsTableTableManager(_db, _db.dataDimsTable);
}
