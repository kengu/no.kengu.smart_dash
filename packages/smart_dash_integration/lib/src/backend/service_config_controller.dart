import 'package:collection/collection.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

class ServiceConfigController extends BulkRepositoryController<String,
    ServiceConfig, ServiceConfigRepository> {
  ServiceConfigController(super.ref);

  static const id = 'id';
  static const key = 'key';
  static const ids = 'ids';
  static const keys = 'keys';
  static const data = 'data';

  @override
  ServiceConfigRepository get repo => ref.read(serviceConfigRepositoryProvider);

  @override
  String toId(String key) {
    return key;
  }

  @override
  String toIdFromJson(
    JsonObject json,
    Map<String, String?> params,
  ) {
    return [
      params[key] ?? json[key],
      params[id] ?? (json[data]! as Map)[id],
    ].whereNotNull().join(':');
  }

  @override
  JsonObject toJson(ServiceConfig item) {
    return item.toJson();
  }

  @override
  ServiceConfig fromJson(JsonObject json) {
    return ServiceConfig.fromJson(json);
  }

  @override
  Iterable<String> toMissingKeys(
    JsonObject json,
    Map<String, String?> params,
  ) {
    return <String>[
      if ((params[key] ?? json[key]) == null) key,
    ];
  }

  @override
  JsonObject ensure(JsonObject json, Map<String, String?> params) {
    for (final it in params.keys) {
      if (params[it] != null) {
        if (key == it) {
          json[key] = params[it];
        }
        if (id == it) {
          json.putIfAbsent(data, () => {});
          (json[data] as Map)[id] = params[it];
        }
      }
    }
    return json;
  }

  @override
  Future<List<ServiceConfig>> where(Map<String, List<String>> query) async {
    return repo.where((e) => _matches(e, query));
  }

  bool _matches(ServiceConfig it, Map<String, List<String>> query) {
    int matches = 0;
    for (final entry in query.entries) {
      if (keys.startsWith(entry.key) && entry.value.contains(it.key)) {
        matches++;
      }
      if (ids.startsWith(entry.key) && entry.value.contains(it.id)) {
        matches++;
      }
    }
    return query.length == matches;
  }

  @override
  Router get router {
    return Router()
      // Queries
      ..get('/integration/config', handleQuery(const [], [keys, ids]))
      ..get('/integration/<$key>/config', handleQuery([key], [ids]))
      ..get('/integration/<$key>/config/<$id>', handleGet([key, id]))
      // Batch commands
      ..post('/integration/config', handlePostAll([key], true))
      ..put('/integration/config', handlePutAll([key]))
      ..delete('/integration/config', handleDeleteAll([key]))
      // Single commands on key
      ..put('/integration/<$key>/config', handlePut([key]))
      ..post('/integration/<$key>/config', handlePost([key]))
      ..delete('/integration/<$key>/config', handleDelete([key]))
      // Single commands on key and id
      ..put('/integration/<$key>/config/<$id>', handlePut([key, id]))
      ..post('/integration/<$key>/config/<$id>', handlePost([key, id]))
      ..delete('/integration/<$key>/config/<$id>', handleDelete([key, id]));
  }
}
