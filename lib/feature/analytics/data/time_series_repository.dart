import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/analytics/data/drift/time_series_database.dart';
import 'package:smart_dash/feature/analytics/domain/data_array.dart';
import 'package:smart_dash/feature/analytics/domain/time_series.dart';
import 'package:smart_dash/feature/flow/domain/token.dart';
import 'package:smart_dash/feature/flow/tokens.dart';
import 'package:smart_dash/util/data/json.dart';
import 'package:smart_dash/util/guard.dart';

part 'time_series_repository.g.dart';

class TimeSeriesRepository {
  TimeSeriesRepository(this.ref, this.db);

  Ref ref;
  TimeSeriesDatabase db;

  Future<Optional<List<Token>>> getTokens() => guard(() async {
        final result = await db.select(db.timeSeriesTable).get();
        return Optional.of(result.map((t) => Tokens.from(t.name)).toList());
      });

  Future<Optional<List<TimeSeries>>> getAll(List<Token> tokens) async {
    return Optional.of(await _load(tokens));
  }

  Future<List<TimeSeries>> _load(List<Token> tokens) => guard(() async {
        final select = db.select(db.timeSeriesTable);
        for (var token in tokens) {
          select.where((t) => t.name.equals(token.name));
        }
        final result = await select.get();
        return await Future.wait(result.map(_fetch));
      }, task: 'TimeSeriesRepository::_load()');

  Future<Optional<TimeSeries>> get(Token token) => guard(() async {
        final found = await db.getFromExactName(token.name).getSingleOrNull();
        if (found == null) {
          return const Optional.empty();
        }
        return Optional.of(await _fetch(found));
      }, task: 'TimeSeriesRepository::get()');

  Future<TimeSeries> _fetch(TimeSeriesTableData found) async {
    final vectors = await db.getVectorsFromName(found.name).get();
    final data = vectors.map((v) {
      switch (v.type) {
        case DataVectorType.int:
          return List.from(jsonDecode(v.data)).cast<int>();
        case DataVectorType.double:
          return List.from(jsonDecode(v.data)).cast<double>();
      }
    }).toList();
    final coords = await db.getCoordsFromName(found.name).getSingleOrNull();
    final dims = await db.getDimsFromName(found.name).getSingleOrNull();
    return TimeSeries(
      name: found.name,
      offset: found.ts,
      span: Duration(microseconds: found.span),
      array: DataArray(
        data,
        dims: _toJsonList(dims?.data),
        coords: _toJsonList(coords?.data),
      ),
    );
  }

  List<JsonObject> _toJsonList(String? json) =>
      (json == null ? <JsonObject>[] : jsonDecode(json)).cast<JsonObject>();

  Future<bool> save(TimeSeries series) => guard(() {
        return db.transaction(() async {
          final row = await db.getFromExactName(series.name).getSingleOrNull();
          return row == null ? await _insert(series) : await _update(series);
        });
      }, task: 'TimeSeriesRepository::save()');

  Future<bool> _insert(TimeSeries series) async {
    final id = await db.insertTimeSeries(
      series.name,
      series.offset,
      series.span.inMicroseconds,
    );
    if (id > 0) {
      await db.batch((batch) {
        for (int idx = 0; idx < series.width; idx++) {
          final column = series[idx];
          batch.insert(
            db.dataVectorTable,
            DataVectorTableCompanion(
              idx: Value(idx),
              name: Value(series.name),
              data: Value(jsonEncode(column)),
              type: Value(DataVectorType.from(column)),
            ),
          );
        }
        batch.insert(
            db.dataCoordsTable,
            DataCoordsTableCompanion(
              name: Value(series.name),
              data: Value(jsonEncode(series.array.coords)),
            ));
        batch.insert(
            db.dataDimsTable,
            DataDimsTableCompanion(
              name: Value(series.name),
              data: Value(jsonEncode(series.array.dims)),
            ));
      });
    }
    return false;
  }

  Future<bool> _update(TimeSeries series) async {
    await db.batch((batch) {
      batch.update(
        db.timeSeriesTable,
        TimeSeriesTableCompanion(
          ts: Value(series.offset),
          span: Value(series.span.inMicroseconds),
        ),
        where: (t) => t.name.equals(series.name),
      );
      _updateVectors(series, batch);
      batch.update(
        db.dataCoordsTable,
        DataCoordsTableCompanion(
          data: Value(jsonEncode(series.array.coords)),
        ),
        where: (t) => t.name.equals(series.name),
      );
      batch.update(
        db.dataDimsTable,
        DataDimsTableCompanion(
          data: Value(jsonEncode(series.array.dims)),
        ),
        where: (t) => t.name.equals(series.name),
      );
    });
    return true;
  }

  void _updateVectors(TimeSeries series, Batch batch) {
    for (int idx = 0; idx < series.width; idx++) {
      final column = series[idx];
      batch.update(
        db.dataVectorTable,
        DataVectorTableCompanion(
          data: Value(jsonEncode(column)),
        ),
        where: (t) => t.name.equals(series.name) & t.idx.equals(idx),
      );
    }
  }

  Future<void> deleteAll() => guard(() async => await db.deleteAll());
}

@Riverpod(keepAlive: true)
TimeSeriesRepository timeSeriesRepository(TimeSeriesRepositoryRef ref) {
  return TimeSeriesRepository(ref, TimeSeriesDatabase(ref).autoDispose(ref));
}
