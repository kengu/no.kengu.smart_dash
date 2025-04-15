import 'package:dio/dio.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

mixin ExecuteCommandMixin<I, T> on DioClient
    implements ActionClientMixin<I, T> {
  Future<Optional<R>> executeCommand<R>(
      ClientAction action, Object? data, List<I> ids) async {
    final request = switch (action) {
      ClientAction.query => throw AssertionError('Use executeQuery() instead'),
      ClientAction.create => super.api.post<R>,
      ClientAction.upsert => super.api.put<R>,
      ClientAction.update => super.api.patch<R>,
      ClientAction.remove => super.api.delete<R>,
    };

    final path = buildPath(action, ids);

    final response = await request(
      path,
      data: data,
      options: Options(
        headers: const {},
        validateStatus: (status) {
          return validateStatus(action, status, path);
        },
      ),
    );

    log.fine(
      '${action.toMethod()} request: '
      '[${response.statusCode}] ${response.realUri}',
    );
    return Optional.ofNullable(response.data);
  }
}

mixin CommandClientMixin<I, T, R, S> on DioClient
    implements ExecuteCommandMixin<I, T> {
  /// Implements [ClientAction.create]
  /// by insert unique only
  Future<S> create(T item) {
    return guard(
      () => _executeSingle(ClientAction.create, item),
      task: 'create',
      name: '$runtimeType',
      onError: check_client_error,
    );
  }

  /// Implements [ClientAction.upsert]
  /// by insert unique, replace existing
  Future<S> upsert(T item) {
    return guard(
      () => _executeSingle(ClientAction.upsert, item),
      task: 'upsert',
      name: '$runtimeType',
      onError: check_client_error,
    );
  }

  /// Implements [ClientAction.update]
  /// by updating existing only
  Future<S> update(T item) {
    return guard(
      () => _executeSingle(ClientAction.update, item),
      task: 'update',
      name: '$runtimeType',
      onError: check_client_error,
    );
  }

  /// Implements [ClientAction.remove]
  /// by removing existing only
  Future<S> remove(T item) {
    return guard(
      () => _executeSingle(ClientAction.remove, item),
      task: 'remove',
      name: '$runtimeType',
      onError: check_client_error,
    );
  }

  /// Transform [response] to single result of type [S]
  S toSingleResult(T item, Optional<R> response);

  Future<S> _executeSingle(ClientAction action, T item) async {
    final response = await executeCommand<R>(action, item, [toId(item)]);
    return toSingleResult(item, response);
  }
}

mixin BulkCommandClientMixin<I, T, R, B> on DioClient
    implements ExecuteCommandMixin<I, T> {
  /// Implements [ClientAction.create]
  /// on [items] by insert unique only
  Future<B> createAll(List<T> items) {
    return guard(
      () => _executeBulk(ClientAction.create, items),
      task: 'createAll',
      name: '$runtimeType',
      onError: check_client_error,
    );
  }

  /// Implements [ClientAction.upsert]
  /// on [items] by insert unique, replace existing
  Future<B> upsertAll(Iterable<T> items) {
    return guard(
      () => _executeBulk(ClientAction.upsert, items),
      task: 'upsertAll',
      name: '$runtimeType',
      onError: check_client_error,
    );
  }

  /// Implements [ClientAction.update]
  /// on [items] by updating existing only
  Future<B> updateAll(Iterable<T> items) {
    return guard(
      () => _executeBulk(ClientAction.update, items),
      task: 'updateAll',
      name: '$runtimeType',
      onError: check_client_error,
    );
  }

  /// Implements [ClientAction.remove]
  /// on [items] by removing existing only
  Future<B> removeAll(Iterable<T> items) {
    return guard(
      () => _executeBulk(ClientAction.remove, items),
      task: 'removeAll',
      name: '$runtimeType',
      onError: check_client_error,
    );
  }

  /// Transform [response] to bulk result of type [B]
  B toBulkResult(Iterable<T> items, Optional<R> response);

  Future<B> _executeBulk(ClientAction action, Iterable<T> items) async {
    final response =
        await executeCommand<R>(action, items, items.map(toId).toList());
    return toBulkResult(items, response);
  }
}
