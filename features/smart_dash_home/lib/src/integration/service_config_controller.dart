import 'package:optional/optional.dart';
import 'package:problem_details/problem_details.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:smart_dash_endpoint/smart_dash_endpoint.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';
import 'package:smart_dash_websocket/smart_dash_websocket.dart';

class ServiceConfigController extends BulkRepositoryController<String,
        ServiceConfig, ServiceConfigRepository>
    with
        WebsocketCRUDControllerMixin<String, ServiceConfig>,
        WebsocketRepositoryControllerMixin<String, ServiceConfig,
            ServiceConfigRepository> {
  ServiceConfigController(this.integrations, this.repo);

  static const id = 'id';
  static const key = 'key';
  static const ids = 'ids';
  static const keys = 'keys';
  static const data = 'data';

  @override
  final ServiceConfigRepository repo;

  final IntegrationManager integrations;

  @override
  String toId(String key) {
    return key;
  }

  @override
  String toIdFromJson(
    JsonObject json,
    Map<String, String?> params,
  ) {
    return ServiceConfig.toUniqueIdFromParts(
      params[key] ?? json[key],
      params[id] ?? (json[data]! as Map)[id],
    );
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
  Future<Optional<ProblemDetails>> validate(Uri uri, ServiceConfig item) async {
    final integration = integrations.get(item.key);
    if (!integration.isPresent) {
      return Optional.of(
        ProblemDetails(
          status: 400,
          type: 'integration-not-found',
          title: 'Integration not found',
          detail: 'Integration[${item.key}] '
              'for $type[${item.key}] not found',
          instance: '$uri',
        ),
      );
    }

    if (integration.value.instances > 0) {
      final exists = await repo.exists(repo.toId(item));
      if (!exists) {
        final items = await repo.where((e) => e.key == item.key);
        if (items.length >= integration.value.instances) {
          return Optional.of(
            ProblemDetails(
              status: 400,
              type: 'integration-instances-exceeded',
              title: 'Integration instances exceeded',
              detail: 'Integration[${integration.value.type.name}] '
                  'instance limit is ${integration.value.instances}',
              instance: '$uri',
            ),
          );
        }
      }
    }

    return Optional.empty();
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
  Future<WebSocketMessage> onMessage(WebSocketMessage message) async {
    // TODO: Implement handling
    return WebSocketMessage.response(
      message: 'OK',
      channel: message.channel,
      action: WebSocketAction.cmd,
    );
  }

  @override
  Router get router {
    return Router()
      // Queries
      ..get('/integration/config', handleQuery(const [], [keys, ids]))
      ..get('/integration/<$key>/config', handleQuery([key], [ids]))
      ..get('/integration/<$key>/config/<$id>', handleGet([key, id]))
      // Batch commands
      ..post('/integration/config', handlePostAll([key, id], true))
      ..put('/integration/config', handlePutAll([key, id]))
      ..delete('/integration/config', handleDeleteAll([key, id]))
      // Batch commands on key
      ..post('/integration/<$key>/config', handlePostAll([key, id], true))
      ..put('/integration/<$key>/config', handlePutAll([key, id]))
      ..delete('/integration/<$key>/config', handleDeleteAll([key, id]))
      // Single commands on key and id
      ..put('/integration/<$key>/config/<$id>', handlePut([key, id]))
      ..delete('/integration/<$key>/config/<$id>', handleDelete([key, id]));
  }
}
