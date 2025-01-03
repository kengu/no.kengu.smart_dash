import 'package:optional/optional.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_datasource/smart_dash_datasource.dart';

abstract class RepositoryController<I, T, R extends Repository<I, T>>
    with RepositoryControllerMixin<I, T> {
  RepositoryController() : type = typeOf<T>().toString();

  @override
  final String type;

  R get repo;
  Router get router;

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
  Future<SingleRepositoryResult<I, T>> addOrUpdate(T item) {
    return repo.addOrUpdate(item);
  }

  @override
  Future<SingleRepositoryResult<I, T>> remove(T item) {
    return repo.remove(item);
  }
}

abstract class BulkRepositoryController<I, T,
        R extends BulkWriteRepositoryMixin<I, T>>
    extends RepositoryController<I, T, R>
    with BulkRepositoryControllerMixin<I, T> {
  BulkRepositoryController();

  @override
  Future<BulkRepositoryResult<I, T>> updateAll(List<T> items) {
    return repo.updateAll(items);
  }

  @override
  Future<BulkRepositoryResult<I, T>> removeAll(List<T> items) {
    return repo.removeAll(items);
  }
}
