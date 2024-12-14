import 'package:optional/optional.dart';
import 'package:smart_dash_datasource/smart_dash_datasource.dart';

abstract class RemoteRepository<I, T> extends Repository<I, T> {
  RemoteRepository(super.ref);

  RepositoryClient<I, T> get client;

  @override
  Future<bool> exists(I id) => client.exists(id);

  @override
  Future<Optional<T>> get(I id) => client.get(id);

  @override
  Future<List<T>> getAll([List<I> ids = const []]) => client.getAll(ids);

  @override
  Future<SingleRepositoryResult<I, T>> addOrUpdate(T item) async {
    return client.update(item);
  }

  @override
  Future<SingleRepositoryResult<I, T>> remove(T item) async {
    return client.remove(item);
  }
}

mixin BulkRemoteRepositoryMixin<I, T> on RemoteRepository<I, T>
    implements BulkWriteRepositoryMixin<I, T> {
  @override
  BulkRepositoryClientMixin<I, T> get client;

  @override
  Future<BulkRepositoryResult<I, T>> updateAll(Iterable<T> items) {
    return client.updateAll(items);
  }

  @override
  Future<BulkRepositoryResult<I, T>> removeAll(Iterable<T> items) {
    return client.removeAll(items);
  }
}
