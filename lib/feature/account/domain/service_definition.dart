import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dash/feature/device/domain/driver_definition.dart';

part 'service_definition.freezed.dart';
part 'service_definition.g.dart';

@freezed
class ServiceDefinition with _$ServiceDefinition {
  const factory ServiceDefinition({
    required String key,
    required String name,
    required String username,
    required String password,
    required List<String> fields,
    int? port,
    String? host,
    String? device,
  }) = _ServiceDefinition;

  factory ServiceDefinition.fromJson(Map<String, Object?> json) =>
      _$ServiceDefinitionFromJson(json);

  factory ServiceDefinition.fromDriver(DriverDefinition driver) =>
      ServiceDefinition(
        username: '',
        password: '',
        key: driver.key,
        name: driver.name,
        fields: driver.fields,
      );

  static String toBasicAuth(String username, String password) =>
      'Basic ${base64Encode(utf8.encode('$username:$password'))}';
}

class ServiceFields {
  static const String key = 'key';
  static const String name = 'name';
  static const String host = 'host';
  static const String port = 'port';
  static const String device = 'device';
  static const String fields = 'fields';
  static const String username = 'username';
  static const String password = 'password';
}
