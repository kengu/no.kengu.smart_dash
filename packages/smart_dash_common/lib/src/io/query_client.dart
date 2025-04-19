import 'dart:async';

import 'package:dio/dio.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

abstract class QueryClient<I, T> extends QueryDataClient<I, T, T> {
  QueryClient(
    super.api, {
    required super.suffix,
    super.prefix,
    super.query,
  });

  @override
  T fromData(T data) {
    return data;
  }
}

abstract class QueryDataClient<I, T, D> extends JsonClient<I, D>
    with ActionClientMixin<I, T>, QueryDataClientMixin<I, T, D> {
  QueryDataClient(
    super.api, {
    required this.suffix,
    this.prefix = '',
    this.query = 'ids',
  });

  @override
  final String query;

  @override
  final String suffix;

  @override
  final String prefix;
}

mixin QueryDataClientMixin<I, T, D> on ActionClientMixin<I, T> {
  T fromData(D data);

  Future<bool> exists(I id) async {
    final result = await get(id);
    return result.isPresent;
  }

  @override
  String buildQuery(Iterable<I> ids) {
    return '$query=${ids.join(',')}';
  }

  Future<Optional<T>> get(I id) {
    final path = buildPath(ClientAction.query, [id]);
    return guard(
      () {
        return executeQueryOne(path);
      },
      task: 'get',
      name: '$runtimeType',
      onError: (Object error, [StackTrace? stackTrace]) {
        return handleError(
          ClientAction.query,
          path,
          error,
          stackTrace,
        );
      },
    );
  }

  Future<List<T>> getAll([List<I> ids = const []]) {
    final path = buildPath(ClientAction.query, ids);
    return guard(
      () async {
        final result = await executeQueryMany(path);
        return result.isPresent ? result.value : <T>[];
      },
      task: 'getAll',
      name: '$runtimeType',
      onError: (Object error, [StackTrace? stackTrace]) {
        return handleError(
          ClientAction.query,
          path,
          error,
          stackTrace,
        );
      },
    );
  }

  Future<Optional<T>> executeQueryOne(String path) async {
    final data = await executeQuery<D>(path);
    if (data.isPresent) {
      return Optional.of(fromData(data.value));
    }
    return Optional.empty();
  }

  Future<Optional<List<T>>> executeQueryMany(String path) async {
    final data = await executeQuery<List<D>>(path);
    if (data.isPresent) {
      return Optional.of(
        data.value.map(fromData).toList(),
      );
    }
    return Optional.empty();
  }

  Future<Optional<V>> executeQuery<V>(String path) async {
    final response = await api.get<V>(
      path,
      options: Options(
        headers: const {},
        validateStatus: (status) {
          return validateStatus(
            ClientAction.query,
            status,
            path,
          );
        },
      ),
    );
    log.fine(
      '${ClientAction.query.toMethod()} '
      'request: [${response.statusCode}] ${response.realUri}',
    );
    return Optional.ofNullable(response.data);
  }
}
