import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_datasource/smart_dash_datasource.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

part 'service_config_repository.g.dart';

class ServiceConfigRepository
    extends BulkHiveRepository<String, ServiceConfig> {
  ServiceConfigRepository(super.ref)
      : super(
          key: 'integration',
          box: 'configuration',
          adapter: ServiceConfigAdapter(),
        );

  @override
  String toKey(String id) {
    return id;
  }

  @override
  String toId(ServiceConfig item) {
    return [item.key, item.id].whereNotNull().join(':');
  }

  Future<List<ServiceConfig>> serviceWhere(String key) =>
      where((e) => e.key == key);
}

@Riverpod(keepAlive: true)
ServiceConfigRepository serviceConfigRepository(
    ServiceConfigRepositoryRef ref) {
  return ServiceConfigRepository(ref);
}

class ServiceConfigAdapter extends TypedAdapter<ServiceConfig> {
  ServiceConfigAdapter() : super(HiveTypeId.integration);

  @override
  ServiceConfig read(BinaryReader reader) {
    final json = jsonDecode(
      reader.read(),
    );
    try {
      return ServiceConfig.fromJson(json);
    } catch (e) {
      // Fix schema mutation
      json['token']['unit'] = ValueUnit.any.name;
      json['token']['capability'] = Capability.any.name;
      return ServiceConfig.fromJson(json);
    }
  }

  @override
  void write(BinaryWriter writer, ServiceConfig obj) {
    writer.write(jsonEncode(
      obj.toJson(),
    ));
  }
}
