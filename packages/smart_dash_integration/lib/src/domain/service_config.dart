import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

part 'service_config.freezed.dart';
part 'service_config.g.dart';

@freezed
class ServiceConfig with _$ServiceConfig {
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

  String? get id => get(IntegrationField.id);
  String? get host => get(IntegrationField.host);
  String? get port => get(IntegrationField.port);
  String? get topics => get(IntegrationField.topics);
  String? get username => get(IntegrationField.username);
  String? get password => get(IntegrationField.password);

  String? get(IntegrationField key) => data[key];

  static String toBasicAuth(String username, String password) =>
      'Basic ${base64Encode(utf8.encode('$username:$password'))}';
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
