import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

part 'service_config.freezed.dart';
part 'service_config.g.dart';

@freezed
class ServiceConfig with _$ServiceConfig {
  const factory ServiceConfig({
    required String key,
    required String name,
    required List<ServiceField> fields,
    int? port,
    String? host,
    String? device,
    String? username,
    String? password,
    String? topics,
  }) = _ServiceConfig;

  factory ServiceConfig.fromJson(Map<String, Object?> json) =>
      _$ServiceConfigFromJson(json);

  factory ServiceConfig.fromDriver(Integration service) => ServiceConfig(
        username: '',
        password: '',
        key: service.key,
        name: service.name,
        fields: service.fields.toList(),
      );

  static String toBasicAuth(String username, String password) =>
      'Basic ${base64Encode(utf8.encode('$username:$password'))}';
}

class ServiceConfigFields {
  static const String key = 'key';
  static const String name = 'name';
  static const String host = 'host';
  static const String port = 'port';
  static const String device = 'device';
  static const String fields = 'fields';
  static const String username = 'username';
  static const String password = 'password';
  static const String topics = 'topics';
}
