import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

part 'service_config.freezed.dart';
part 'service_config.g.dart';

@freezed
sealed class ServiceConfig with _$ServiceConfig {
  const ServiceConfig._();
  const factory ServiceConfig({
    required String key,
    required String name,
    required Map<IntegrationField, String> data,
  }) = _ServiceConfig;

  factory ServiceConfig.fromJson(Map<String, Object?> json) =>
      _$ServiceConfigFromJson(json);

  factory ServiceConfig.fromDefinition(Integration service) => ServiceConfig(
        key: service.key,
        name: service.name,
        data: Map.fromEntries(
          service.fields.map(
            (e) => MapEntry(e, ''),
          ),
        ),
      );

  static String toKey(String id) {
    return toParts(id).first;
  }

  static String toId(String id) {
    final parts = toParts(id);
    return parts.length == 2 ? parts.last : '';
  }

  static bool endsWithId(String id) {
    return id.contains(':');
  }

  static List<String> toParts(String id) {
    return id.split(':');
  }

  static String toUniqueId(ServiceConfig config) {
    return toUniqueIdFromParts(config.key, config.id);
  }

  static String toUniqueIdFromParts(Object? key, Object? id) {
    return [key, id].nonNulls.join(':');
  }

  static String toBasicAuth(String username, String password) =>
      'Basic ${base64Encode(utf8.encode('$username:$password'))}';

  String? get id => get(IntegrationField.id);
  String? get host => get(IntegrationField.host);
  String? get port => get(IntegrationField.port);
  String? get topics => get(IntegrationField.topics);
  String? get username => get(IntegrationField.username);
  String? get password => get(IntegrationField.password);

  String? get(IntegrationField key) => data[key];
}

class ServiceConfigFields {
  static const String key = 'key';
  static const String name = 'name';
  static const String data = 'data';
}

class ServiceConfigDataFields {
  static const String id = 'id';
  static const String host = 'host';
  static const String port = 'port';
  static const String username = 'username';
  static const String password = 'password';
  static const String topics = 'topics';
}
