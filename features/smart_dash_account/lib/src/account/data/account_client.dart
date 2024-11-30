import 'package:dio/dio.dart';
import 'package:logging/logging.dart';
import 'package:optional/optional.dart';
import 'package:riverpod/riverpod.dart';
import 'package:smart_dash_account/smart_dash_account.dart';

class AccountClient {
  AccountClient(this.ref, this.api);
  final Dio api;
  final Ref ref;

  final _log = Logger('$AccountClient');

  Future<bool> exists(String userId) async {
    final result = await get(userId);
    return result.isPresent;
  }

  Future<Optional<Account>> get(String userId) async {
    return guard(() async {
      final uri = '/account/$userId';
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
        response.data,
      ));
    }, error: check_client_error);
  }

  Future<List<Account>> getAll([List<String> userIds = const []]) async {
    return guard(() async {
      final uri = '/account${_toIdsQueryParams(userIds)}';
      final response = await api.get(
        uri,
        options: _options('GET $uri'),
      );
      _log.fine(
        'GET $uri: '
        '[${response.statusCode}] ${response.realUri}',
      );
      return List<JsonObject>.from(
        response.data,
      ).map(Account.fromJson).toList();
    }, error: check_client_error);
  }

  Future<Account> create(Account account) {
    return guard(() async {
      final uri = '/account';
      final response = await api.post(
        uri,
        data: account.toJson(),
        options: _options('POST $uri'),
      );
      _log.fine(
        'POST $uri: '
        '[${response.statusCode}] ${response.realUri}',
      );
      return Account.fromJson(
        response.data,
      );
    }, error: check_client_error);
  }

  Future<Optional<Account>> update(Account account) {
    return guard(() async {
      final uri = '/account/${account.userId}';
      final response = await api.put(
        uri,
        data: account.toJson(),
        options: _options('PUT $uri'),
      );
      _log.fine(
        'PUT $uri: '
        '[${response.statusCode}] ${response.realUri}',
      );
      if (response.statusCode == 404) {
        return Optional.empty();
      }
      return Optional.of(Account.fromJson(
        response.data,
      ));
    }, error: check_client_error);
  }

  Future<Account> delete(Account account) {
    return guard(() async {
      final uri = '/account/${account.userId}';
      final response = await api.delete(
        uri,
        options: _options('DELETE $uri'),
      );
      _log.fine(
        'DELETE $uri: '
        '[${response.statusCode}] ${response.realUri}',
      );
      return Account.fromJson(
        response.data,
      );
    }, error: check_client_error);
  }

  String _toIdsQueryParams(List<String> userIds) =>
      userIds.isEmpty ? '' : 'ids=${userIds.join(',')}';

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
      Dio(BaseOptions(headers: {}, baseUrl: 'http://localhost:8080'))
        // Process json in the background
        ..transformer = BackgroundTransformer(),
    ));
