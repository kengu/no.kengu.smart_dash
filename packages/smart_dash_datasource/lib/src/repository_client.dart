import 'package:optional/optional.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_datasource/smart_dash_datasource.dart';

abstract class RepositoryClient<I, T> extends RepositoryDataClient<I, T, T> {
  RepositoryClient(
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

abstract class RepositoryDataClient<I, T, R> extends QueryDataClient<I, T, R>
    with
        ExecuteCommandMixin<I, T>,
        RepositoryClientMixin<I, T>,
        BulkRepositoryClientMixin<I, T> {
  RepositoryDataClient(
    super.api, {
    required super.suffix,
    super.prefix = '',
    super.query = 'ids',
  });

  @override
  SingleRepositoryResult<I, T> toSingleResult(
      T item, Optional<SingleRepositoryResponse<I, T>> response) {
    return response.isPresent
        ? response.value.toResult()
        : SingleRepositoryResult<I, T>.empty(item);
  }

  @override
  BulkRepositoryResult<I, T> toBulkResult(
      Iterable<T> items, Optional<BulkRepositoryResponse<I, T>> response) {
    return response.isPresent
        ? response.value.toResult()
        : BulkRepositoryResult<I, T>.empty();
  }
}

typedef RepositoryClientMixin<I, T> = CommandClientMixin<I, T,
    SingleRepositoryResponse<I, T>, SingleRepositoryResult<I, T>>;

typedef BulkRepositoryClientMixin<I, T> = BulkCommandClientMixin<I, T,
    BulkRepositoryResponse<I, T>, BulkRepositoryResult<I, T>>;
