import 'package:shelf_router/shelf_router.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

class ServiceConfigController extends RepositoryController<String,
    ServiceConfig, ServiceConfigRepository> {
  ServiceConfigController(super.ref);

  @override
  ServiceConfigRepository get repo => ref.read(serviceConfigRepositoryProvider);

  @override
  ServiceConfig fromJson(JsonObject json) {
    return ServiceConfig.fromJson(json);
  }

  @override
  String toId(String value) {
    return value;
  }

  @override
  JsonObject toJson(ServiceConfig item) {
    return item.toJson();
  }

  @override
  Router get router {
    const param = 'key';
    const prefix = 'config';
    const queryParam = 'keys';

    return Router()
      ..post('/$prefix', handlePost(prefix, param))
      ..get('/$prefix', handleGetAll(prefix, queryParam))
      ..get('/$prefix/<$param>', handleGet(prefix, param))
      ..put('/$prefix/<$param>', handlePut(prefix, param))
      ..delete('/$prefix/<$param>', handleDelete(prefix, param));
  }
}
