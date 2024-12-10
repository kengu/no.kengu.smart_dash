import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_datasource/smart_dash_datasource.dart';

part 'repository_client.freezed.dart';
part 'repository_client.g.dart';

enum RepositoryAction {
  query,
  create,
  update,
  remove;

  static List<RepositoryAction> get commands => [
        create,
        update,
        remove,
      ];

  bool get isQuery => this == query;
  bool get isCreate => this == create;
  bool get isUpdate => this == update;
  bool get isRemove => this == remove;
  bool get isCommand => commands.contains(this);

  String toMethod() {
    return switch (this) {
      RepositoryAction.query => 'GET',
      RepositoryAction.create => 'POST',
      RepositoryAction.update => 'PUT',
      RepositoryAction.remove => 'DELETE',
    };
  }
}

abstract class RepositoryClient<I, T> {
  RepositoryClient(this.api, this.type, {this.prefix = ''});

  final Dio api;
  final String type;
  final String prefix;

  Logger get log => Logger('$runtimeType');

  I toId(T item);

  Future<bool> exists(I id) async {
    final result = await get(id);
    return result.isPresent;
  }

  String buildQuery(RepositoryAction action, Iterable<I> ids) {
    return 'ids=${ids.join(',')}';
  }

  String buildPath(RepositoryAction action, [List<I> ids = const []]) {
    if (action == RepositoryAction.create) {
      return '$prefix/$type';
    }
    return switch (ids.length) {
      0 => '$prefix/$type',
      1 => '$prefix/$type/${ids.first}',
      _ => '$prefix/$type?${buildQuery(action, ids)}'
    };
  }

  Future<Optional<T>> get(I id) {
    return guard(
      () {
        return _query<T>(
          buildPath(RepositoryAction.query, [id]),
        );
      },
      task: 'get',
      name: '$runtimeType',
      error: check_client_error,
    );
  }

  Future<List<T>> getAll([List<I> ids = const []]) {
    return guard(
      () async {
        final path = buildPath(RepositoryAction.query, ids);
        final result = await _query<List<T>>(path);
        return result.isPresent ? result.value : <T>[];
      },
      task: 'getAll',
      name: '$runtimeType',
      error: check_client_error,
    );
  }

  Future<Optional<D>> _query<D>(String path) async {
    final response = await api.get<D>(
      path,
      options: Options(
        headers: const {},
        validateStatus: (status) {
          return _validateStatus(
            RepositoryAction.query,
            status,
            path,
          );
        },
      ),
    );
    log.fine(
      'GET request: [${response.statusCode}] ${response.realUri}',
    );
    return Optional.ofNullable(response.data);
  }

  Future<SingleRepositoryResult<I, T>> create(T item) {
    return guard(
      () => _executeSingle(RepositoryAction.create, item),
      task: 'create',
      name: '$runtimeType',
      error: check_client_error,
    );
  }

  Future<SingleRepositoryResult<I, T>> update(T item) {
    return guard(
      () => _executeSingle(RepositoryAction.update, item),
      task: 'update',
      name: '$runtimeType',
      error: check_client_error,
    );
  }

  Future<SingleRepositoryResult<I, T>> remove(T item) {
    return guard(
      () => _executeSingle(RepositoryAction.remove, item),
      task: 'remove',
      name: '$runtimeType',
      error: check_client_error,
    );
  }

  Future<SingleRepositoryResult<I, T>> _executeSingle(
      RepositoryAction action, T item) async {
    final response = await _execute<SingleRepositoryResponse<I, T>>(
        action, item, [toId(item)]);
    return response.isPresent
        ? response.value.toResult()
        : SingleRepositoryResult<I, T>.empty(item);
  }

  Future<Optional<R>> _execute<R extends RepositoryResponse<I, T>>(
      RepositoryAction action, Object? data, List<I> ids) async {
    final request = switch (action) {
      RepositoryAction.query => throw AssertionError('Use _query() instead'),
      RepositoryAction.create => api.post<R>,
      RepositoryAction.update => api.put<R>,
      RepositoryAction.remove => api.delete<R>,
    };

    final path = buildPath(action, ids);

    final response = await request(
      path,
      data: data,
      options: Options(
        headers: const {},
        validateStatus: (status) {
          return _validateStatus(action, status, path);
        },
      ),
    );

    log.fine(
      '${action.toMethod()} request: '
      '[${response.statusCode}] ${response.realUri}',
    );
    return Optional.ofNullable(response.data);
  }

  void close() {
    api.close(force: true);
  }

  bool _validateStatus(RepositoryAction action, int? status, String path) {
    final success = status != null && status < 400;
    if (!success) {
      log.warning(
        '${action.toMethod()} request failed: [$status] $path',
      );
    }
    return success;
  }
}

mixin BulkRepositoryClientMixin<I, T> on RepositoryClient<I, T> {
  Future<BulkRepositoryResult<I, T>> createAll(List<T> items) {
    return guard(
      () => _executeBulk(RepositoryAction.create, items),
      task: 'createAll',
      name: '$runtimeType',
      error: check_client_error,
    );
  }

  Future<BulkRepositoryResult<I, T>> updateAll(List<T> items) {
    return guard(
      () => _executeBulk(RepositoryAction.update, items),
      task: 'updateAll',
      name: '$runtimeType',
      error: check_client_error,
    );
  }

  Future<BulkRepositoryResult<I, T>> removeAll(List<T> items) {
    return guard(
      () => _executeBulk(RepositoryAction.remove, items),
      task: 'removeAll',
      name: '$runtimeType',
      error: check_client_error,
    );
  }

  Future<BulkRepositoryResult<I, T>> _executeBulk(
      RepositoryAction action, List<T> items) async {
    final response = await _execute<BulkRepositoryResponse<I, T>>(
        action, items, items.map(toId).toList());
    return response.isPresent
        ? response.value.toResult()
        : BulkRepositoryResult<I, T>.empty();
  }
}

sealed class RepositoryResponse<I, T> {
  bool get isEmpty;
  bool get isNotEmpty;
}

@Freezed(genericArgumentFactories: true)
class SingleRepositoryResponse<I, T>
    with _$SingleRepositoryResponse<I, T>
    implements RepositoryResponse<I, T> {
  const SingleRepositoryResponse._();

  const factory SingleRepositoryResponse({
    required T item,
    required bool created,
    required bool updated,
    required bool removed,
  }) = _SingleRepositoryResponse;

  @override
  bool get isEmpty => !isNotEmpty;

  @override
  bool get isNotEmpty => created || updated || removed;

  SingleRepositoryResult<I, T> toResult() {
    return SingleRepositoryResult<I, T>(item, created, updated, removed);
  }

  factory SingleRepositoryResponse.fromResult(
          SingleRepositoryResult<I, T> result) =>
      SingleRepositoryResponse<I, T>(
        item: result.item,
        created: result.created,
        updated: result.updated,
        removed: result.removed,
      );

  factory SingleRepositoryResponse.fromJson(
    Map<String, Object?> json,
    I Function(Object? json) fromJsonI,
    T Function(Object? json) fromJsonT,
  ) =>
      _$SingleRepositoryResponseFromJson<I, T>(json, fromJsonI, fromJsonT);
}

@Freezed(genericArgumentFactories: true)
class BulkRepositoryResponse<I, T>
    with _$BulkRepositoryResponse<I, T>
    implements RepositoryResponse<I, T> {
  const BulkRepositoryResponse._();

  const factory BulkRepositoryResponse({
    required List<T> created,
    required List<T> updated,
    required List<T> removed,
  }) = _BulkRepositoryResponse;

  @override
  bool get isEmpty => !isNotEmpty;

  @override
  bool get isNotEmpty =>
      created.isNotEmpty || updated.isNotEmpty || removed.isNotEmpty;

  BulkRepositoryResult<I, T> toResult() {
    return BulkRepositoryResult<I, T>(created, updated, removed);
  }

  factory BulkRepositoryResponse.fromResult(
          BulkRepositoryResult<I, T> result) =>
      BulkRepositoryResponse<I, T>(
        created: result.created,
        updated: result.updated,
        removed: result.removed,
      );

  factory BulkRepositoryResponse.fromJson(
    Map<String, Object?> json,
    I Function(Object? json) fromJsonI,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BulkRepositoryResponseFromJson<I, T>(json, fromJsonI, fromJsonT);
}
