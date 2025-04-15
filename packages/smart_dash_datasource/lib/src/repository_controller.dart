import 'package:optional/optional.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_datasource/smart_dash_datasource.dart';

abstract class RepositoryController<I, T, R extends Repository<I, T>>
    extends QueryController<I, T>
    with CommandControllerMixin<I, T, SingleRepositoryResult<I, T>> {
  RepositoryController() : super(typeOf<T>().toString());

  R get repo;

  @override
  Future<bool> exists(I id) {
    return repo.exists(id);
  }

  @override
  Future<Optional<T>> get(I id) {
    return repo.get(id);
  }

  @override
  Future<List<T>> getAll([List<I> ids = const []]) {
    return repo.getAll(ids);
  }

  @override
  Future<SingleRepositoryResult<I, T>> create(T item) {
    return repo.upsert(item);
  }

  @override
  Future<SingleRepositoryResult<I, T>> update(T item) {
    return repo.upsert(item);
  }

  @override
  Future<SingleRepositoryResult<I, T>> upsert(T item) {
    return repo.upsert(item);
  }

  @override
  Future<SingleRepositoryResult<I, T>> remove(T item) {
    return repo.remove(item);
  }

  @override
  JsonObject toSingleResult(SingleRepositoryResult<I, T> result) {
    return SingleRepositoryResponse<I, T>.fromResult(
      result,
    ).toJson((id) => id, toJson);
  }
}

abstract class BulkRepositoryController<I, T,
        R extends BulkWriteRepositoryMixin<I, T>>
    extends RepositoryController<I, T, R>
    with CommandControllerBulkMixin<I, T, BulkRepositoryResult<I, T>> {
  /// Default
  BulkRepositoryController();

  /// Only create items not found
  @override
  Future<BulkRepositoryResult<I, T>> createAll(List<T> items) async {
    final ids = items.map((e) => repo.toId(e)).toList();
    final insert = await repo.where((e) => !ids.contains(repo.toId(e)));
    return repo.updateAll(insert);
  }

  /// Create new and replace existing
  @override
  Future<BulkRepositoryResult<I, T>> upsertAll(List<T> items) {
    return repo.updateAll(items);
  }

  /// Only replace existing
  @override
  Future<BulkRepositoryResult<I, T>> updateAll(List<T> items) {
    return repo.updateAll(items);
  }

  /// Remove existing
  @override
  Future<BulkRepositoryResult<I, T>> removeAll(List<T> items) {
    return repo.removeAll(items);
  }

  @override
  JsonObject toBulkResult(BulkRepositoryResult<I, T> result) {
    return BulkRepositoryResponse<I, T>.fromResult(
      result,
    ).toJson((id) => id, toJson);
  }
}
