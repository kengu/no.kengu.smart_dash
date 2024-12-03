import 'package:collection/collection.dart';
import 'package:optional/optional.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';
import 'package:smart_dash_integration/src/backend/crud_controller_mixin.dart';

class IntegrationController with CRUDControllerMixin<String, Integration> {
  IntegrationController(this.ref);

  static const key = 'key';
  static const keys = 'keys';
  static const types = 'types';
  static const query = [keys, types];

  final ProviderContainer ref;

  IntegrationManager get manager => ref.read(integrationManagerProvider);

  @override
  final String type = typeOf<Integration>().toString();

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
    ].whereNotNull().join(':');
  }

  @override
  JsonObject toJson(Integration item) {
    return item.toJson();
  }

  @override
  Integration fromJson(JsonObject json) {
    return Integration.fromJson(json);
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
  Future<bool> exists(String id) async {
    return manager.exists(id);
  }

  @override
  Future<Optional<Integration>> get(String id) async {
    return manager.get(id);
  }

  @override
  Future<List<Integration>> getAll() async {
    return manager.getAll().values.toList();
  }

  @override
  Future<List<Integration>> where(Map<String, List<String>> query) async {
    return manager.where((e) => _matches(e, query)).values.toList();
  }

  bool _matches(Integration it, Map<String, List<String>> query) {
    int matches = 0;
    for (final entry in query.entries) {
      if (keys == entry.key && entry.value.contains(it.key)) {
        matches++;
      }
      if (types == entry.key && entry.value.contains(it.type.name)) {
        matches++;
      }
    }
    return query.length == matches;
  }

  Router get router {
    return Router()
      ..get('/integration', handleQuery(const [], query))
      ..get('/integration/<$key>', handleGet([key]));
  }
}
