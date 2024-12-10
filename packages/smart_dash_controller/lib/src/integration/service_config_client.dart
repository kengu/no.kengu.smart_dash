import 'package:dio/dio.dart';
import 'package:smart_dash_datasource/smart_dash_datasource.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

class ServiceConfigClient extends RepositoryClient<String, ServiceConfig>
    with BulkRepositoryClientMixin<String, ServiceConfig> {
  ServiceConfigClient(Dio api) : super(api, 'config', prefix: '/integration');

  @override
  String toId(ServiceConfig item) {
    return ServiceConfig.toUniqueId(item);
  }

  @override
  String buildPath(RepositoryAction action, [List<String> ids = const []]) {
    final keys = ids.map(ServiceConfig.toKey).toSet();
    // MATCH
    //   Query integration/config?ids=key1,key2
    //   Create integration/config [items]
    //   Update integration/config [items]
    //   Remove integration/config [items]
    if (keys.length > 1 && action.isCommand) {
      return '$prefix/$type';
    }

    // MATCH
    //   Query integration/<key>/config
    //   Query integration/<key>/config?ids=...
    if (action.isQuery && keys.length == 1) {
      final keyIds = ids.map(ServiceConfig.toId).where((e) => e.isNotEmpty);
      if (keyIds.isEmpty) {
        return '$prefix/${keys.first}/$type';
      }
      return switch (ids.length) {
        0 => '$prefix/${keys.first}/$type',
        1 => '$prefix/${keys.first}/$type/${ids.first}',
        _ => '$prefix/${keys.first}/$type?${buildQuery(action, ids)}'
      };
    }

    // MATCH
    //   Query integration/config
    //   Query integration/<key>/config
    //   Query integration/<key>/config?ids=1,2...
    //   Query integration/<key>/config/<id>
    //   Create integration/<key>/config [items]
    //   Update integration/<key>/config [items]
    //   Remove integration/<key>/config [items]
    //   Create integration/<key>/config/<id> item
    //   Update integration/<key>/config/<id> item
    //   Remove integration/<key>/config/<id> item
    final id = ids.length == 1 ? ServiceConfig.toId(ids.first) : '';
    return switch (keys.length) {
      0 => '$prefix/$type',
      1 => '$prefix/${keys.first}/$type${id.isNotEmpty ? '/$id' : ''}',
      _ => '$prefix/$type?${buildQuery(action, ids)}'
    };
  }
}
