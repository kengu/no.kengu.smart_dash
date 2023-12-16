import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_credentials.freezed.dart';
part 'service_credentials.g.dart';

@freezed
class ServiceCredentials with _$ServiceCredentials {
  const factory ServiceCredentials({
    required String key,
    required String username,
    required String password,
  }) = _Service;

  factory ServiceCredentials.fromJson(Map<String, Object?> json) =>
      _$ServiceCredentialsFromJson(json);

  factory ServiceCredentials.fromService(String key) => ServiceCredentials(
        key: key,
        username: '',
        password: '',
      );

  static String toBasicAuth(String username, String password) =>
      'Basic ${base64Encode(utf8.encode('$username:$password'))}';
}

class ServiceFields {
  static const String key = 'key';
  static const String username = 'username';
  static const String password = 'password';
}
