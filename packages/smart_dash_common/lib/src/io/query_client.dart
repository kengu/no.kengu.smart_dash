import 'package:dio/dio.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

abstract class QueryClient<I, T> extends JsonClient<I, T>
    with ActionClientMixin<I, T>, QueryClientMixin<I, T> {
  QueryClient(
    super.api,
    this.type, {
    this.prefix = '',
    this.query = 'ids',
  });

  @override
  final String type;

  @override
  final String query;

  @override
  final String prefix;
}

mixin QueryClientMixin<I, T> on ActionClientMixin<I, T> {
  Future<bool> exists(I id) async {
    final result = await get(id);
    return result.isPresent;
  }

  @override
  String buildQuery(Iterable<I> ids) {
    return '$query=${ids.join(',')}';
  }

  Future<Optional<T>> get(I id) {
    return guard(
      () {
        return executeQuery<T>(
          buildPath(ClientAction.query, [id]),
        );
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
    return guard(
      () async {
        final path = buildPath(ClientAction.query, ids);
        final result = await executeQuery<List<T>>(path);
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

  Future<Optional<D>> executeQuery<D>(String path) async {
    final response = await api.get<D>(
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
