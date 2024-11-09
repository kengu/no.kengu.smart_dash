import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logging/logging.dart';
import 'package:optional/optional.dart';
import 'package:riverpod/riverpod.dart';
import 'package:smart_dash_account/smart_dash_account.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

class AccountClient {
  AccountClient(this.ref, this.api);
  final Dio api;
  final Ref ref;

  final _log = Logger('$AccountClient');

  Future<Optional<Account>> get(String userId) async {
    return guard(() async {
      final uri = '/Account/$userId';
      final response = await api.get(
        uri,
        options: _options('GET $uri'),
      );
      _log.fine(
        'GET $uri: '
        '[${response.statusCode}] ${response.realUri}',
      );
      if (response.statusCode == 404) {
        return Optional.empty();
      }
      return Optional.of(Account.fromJson(
        jsonDecode(response.data),
      ));
    }, error: check_client_error);
  }

  Future<List<Account>> getAll([List<String> userIds = const []]) async {
    return guard(() async {
      final uri =
          '/Account${userIds.isEmpty ? '' : 'ids=${userIds.join(',')}'}';
      final response = await api.get(
        uri,
        options: _options('GET $uri'),
      );
      _log.fine(
        'GET $uri: '
        '[${response.statusCode}] ${response.realUri}',
      );
      if (response.statusCode == 404) {
        return [];
      }
      return List<JsonObject>.from(
        jsonDecode(response.data),
      ).map(Account.fromJson).toList();
    }, error: check_client_error);
  }

  Options _options(String request) {
    return Options(
      /*
          headers: <String, String>{
            'authorization': toBasicAuth(credentials.value),
          },
           */
      validateStatus: (status) {
        final success = status != null && status < 400;
        if (!success) {
          _log.warning(
            'Account request failed: [$status] $request',
          );
        }
        return success;
      },
    );
  }
}

final accountClientProvider = Provider((ref) => AccountClient(
      ref,
      Dio(BaseOptions(headers: {}, baseUrl: 'http://localhost'))
        // Process json in the background
        ..transformer = BackgroundTransformer(),
    ));
