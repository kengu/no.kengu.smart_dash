import 'package:optional/optional.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_datasource/smart_dash_datasource.dart';
import 'package:smart_dash_integration/src/backend/crud_controller_mixin.dart';

abstract class RepositoryController<I, T, R extends Repository<I, T>>
    with CRUDControllerMixin<I, T> {
  RepositoryController(
    this.ref,
  ) : type = typeOf<T>().toString();

  final ProviderContainer ref;

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
    extends RepositoryController<I, T, R> with BulkCRUDControllerMixin<I, T> {
  BulkRepositoryController(super.ref);

  @override
  Future<BulkRepositoryResult<I, T>> updateAll(List<T> items) {
    return repo.updateAll(items);
  }

  @override
  Future<BulkRepositoryResult<I, T>> removeAll(List<T> items) {
    return repo.removeAll(items);
  }
}
