// GENERATED CODE, DO NOT EDIT BY HAND.
// ignore_for_file: type=lint
//@dart=2.12
import 'package:drift/drift.dart';

class TimeSeriesTable extends Table
    with TableInfo<TimeSeriesTable, TimeSeriesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  TimeSeriesTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<DateTime> ts = GeneratedColumn<DateTime>(
      'ts', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
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
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  late final GeneratedColumn<int> idx = GeneratedColumn<int>(
      'idx', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<DateTime> ts = GeneratedColumn<DateTime>(
      'ts', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [id, idx, name, ts, data, type];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'DataVectorTable';
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
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
    );
  }

  @override
  DataVectorTable createAlias(String alias) {
    return DataVectorTable(attachedDatabase, alias);
  }

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
  final String type;
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
    map['type'] = Variable<String>(type);
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
      type: serializer.fromJson<String>(json['type']),
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
      'type': serializer.toJson<String>(type),
    };
  }

  DataVectorTableData copyWith(
          {int? id,
          int? idx,
          String? name,
          DateTime? ts,
          String? data,
          String? type}) =>
      DataVectorTableData(
        id: id ?? this.id,
        idx: idx ?? this.idx,
        name: name ?? this.name,
        ts: ts ?? this.ts,
        data: data ?? this.data,
        type: type ?? this.type,
      );
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
  final Value<String> type;
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
    required String type,
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
      Value<String>? type}) {
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
      map['type'] = Variable<String>(type.value);
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
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<DateTime> ts = GeneratedColumn<DateTime>(
      'ts', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
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
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  late final GeneratedColumn<DateTime> ts = GeneratedColumn<DateTime>(
      'ts', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
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

class DatabaseAtV2 extends GeneratedDatabase {
  DatabaseAtV2(QueryExecutor e) : super(e);
  late final TimeSeriesTable timeSeriesTable = TimeSeriesTable(this);
  late final DataVectorTable dataVectorTable = DataVectorTable(this);
  late final DataCoordsTable dataCoordsTable = DataCoordsTable(this);
  late final DataDimsTable dataDimsTable = DataDimsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [timeSeriesTable, dataVectorTable, dataCoordsTable, dataDimsTable];
  @override
  int get schemaVersion => 2;
}
