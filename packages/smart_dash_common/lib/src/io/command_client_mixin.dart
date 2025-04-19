import 'dart:async';

import 'package:dio/dio.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

mixin ExecuteCommandMixin<I, T> on DioClient
    implements ActionClientMixin<I, T> {
  Future<Optional<R>> executeCommand<R>(
      ClientAction action, Object? data, List<I> ids) async {
    final request = switch (action) {
      ClientAction.create => super.api.post<R>,
      ClientAction.upsert => super.api.put<R>,
      ClientAction.update => super.api.patch<R>,
      ClientAction.remove => super.api.delete<R>,
      ClientAction.query => throw AssertionError('Use executeQuery() instead'),
    };

    final path = buildPath(action, ids);

    final response = await guard<Response<R>>(
      () => request(
        path,
        data: data,
        options: Options(
          headers: const {},
          validateStatus: (status) {
            return validateStatus(action, status, path);
          },
        ),
      ),
      name: '$runtimeType',
      task: 'executeCommand:${action.name}',
      onError: (Object error, [StackTrace? stackTrace]) {
        return handleError(
          action,
          path,
          error,
          stackTrace,
        );
      },
    );

    log.fine(
      '${action.toMethod()} request: '
      '[${response.statusCode}] ${response.realUri}',
    );

    return Optional.ofNullable(
      response.data,
    );
  }
}

mixin CommandClientMixin<I, T, D, R> on DioClient
    implements ExecuteCommandMixin<I, T> {
  /// Implements [ClientAction.create]
  /// by insert unique only
  Future<R> create(T item) {
    return _executeSingle(ClientAction.create, item);
  }

  /// Implements [ClientAction.upsert]
  /// by insert unique, replace existing
  Future<R> upsert(T item) {
    return _executeSingle(ClientAction.upsert, item);
  }

  /// Implements [ClientAction.update]
  /// by updating existing only
  Future<R> update(T item) {
    return _executeSingle(ClientAction.update, item);
  }

  /// Implements [ClientAction.remove]
  /// by removing existing only
  Future<R> remove(T item) {
    return _executeSingle(ClientAction.remove, item);
  }

  /// Transform [response] to single result of type [R]
  R toSingleResult(T item, Optional<D> response);

  Future<R> _executeSingle(ClientAction action, T item) async {
    final response = await executeCommand<D>(action, item, [toId(item)]);
    return toSingleResult(item, response);
  }
}

mixin BulkCommandClientMixin<I, T, D, R> on DioClient
    implements ExecuteCommandMixin<I, T> {
  /// Implements [ClientAction.create]
  /// on [items] by insert unique only
  Future<R> createAll(List<T> items) {
    return _executeBulk(ClientAction.create, items);
  }

  /// Implements [ClientAction.upsert]
  /// on [items] by insert unique, replace existing
  Future<R> upsertAll(Iterable<T> items) {
    return _executeBulk(ClientAction.upsert, items);
  }

  /// Implements [ClientAction.update]
  /// on [items] by updating existing only
  Future<R> updateAll(Iterable<T> items) {
    return _executeBulk(ClientAction.update, items);
  }

  /// Implements [ClientAction.remove]
  /// on [items] by removing existing only
  Future<R> removeAll(Iterable<T> items) {
    return _executeBulk(ClientAction.remove, items);
  }

  /// Transform [response] to bulk result of type [R]
  R toBulkResult(Iterable<T> items, Optional<D> response);

  Future<R> _executeBulk(ClientAction action, Iterable<T> items) async {
    final response = await executeCommand<D>(
      action,
      items,
      items.map(toId).toList(),
    );
    return toBulkResult(items, response);
  }
}
