import 'package:optional/optional_internal.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';
import 'package:smart_dash_snow/smart_dash_snow.dart';

class SnowDriverController extends QueryController<String, SnowState> {
  SnowDriverController(this.ref) : super('snow');

  static const ids = 'ids';
  static const location = 'location';

  final ProviderContainer ref;
  SnowStateRepository get repo => ref.read(snowStateRepositoryProvider);

  @override
  SnowState fromJson(JsonObject json) {
    return SnowState.fromJson(json);
  }

  @override
  String toId(String key) {
    return key;
  }

  @override
  String toIdFromJson(JsonObject json, Map<String, String?> params) {
    return (json[location] ?? params[location] ?? '') as String;
  }

  @override
  JsonObject toJson(SnowState item) {
    return item.toJson();
  }

  @override
  Iterable<String> toMissingKeys(JsonObject json, Map<String, String?> params) {
    return <String>[
      if ((params[location] ?? json[location]) == null) location,
    ];
  }

  @override
  Future<bool> exists(String id) {
    return repo.exists(id);
  }

  @override
  Future<Optional<SnowState>> get(String id) {
    return repo.get(id);
  }

  @override
  Future<List<SnowState>> getAll() {
    return repo.getAll();
  }

  @override
  Future<List<SnowState>> where(Map<String, List<String>> query) async {
    return repo.where((e) => _matches(e, query));
  }

  bool _matches(SnowState it, Map<String, List<String>> query) {
    int matches = 0;
    for (final entry in query.entries) {
      if (ids.startsWith(entry.key) && entry.value.contains(it.location)) {
        matches++;
      }
    }
    return query.length == matches;
  }

  @override
  Router get router {
    return Router()
      // Queries
      ..get('/snow', handleQuery(const [], [ids]))
      ..get('/snow/<$location>', handleGet([location]));
  }
}
