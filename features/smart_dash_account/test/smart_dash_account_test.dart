import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logging/logging.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash_account/smart_dash_account_app.dart';
import 'package:smart_dash_datasource/smart_dash_datasource.dart';

import 'smart_dash_account_test.mocks.dart';

@GenerateMocks([
  Dio,
  AccountRepository,
])
void main() {
  _initLogger(Level.FINE);
  group('AccountClient', () {
    late MockDio mockDio;
    late AccountClient apiClient;
    final String userId1 = 'u:1';
    final String userId2 = 'u:2';

    setUp(() {
      mockDio = MockDio();
      when(mockDio.interceptors).thenReturn(Interceptors());
      mockDio.interceptors.add(
        RepositoryClientInterceptor(Account.fromJson),
      );
      apiClient = AccountClient(mockDio);
    });

    test('query all items', () async {
      // Arrange
      final item1 = _newAccount(userId1);
      final item2 = _newAccount(userId2);
      final items = [item1, item2];
      final url = '/account';
      when(mockDio.get(
        url,
        options: anyNamed('options'),
      )).thenAnswer((_) async {
        return Response<List<Account>>(
          statusCode: 200,
          requestOptions: RequestOptions(path: url),
          data: items,
        );
      });

      // Apply
      final result = await apiClient.getAll();

      // Assert
      expect(result, items);
    });

    test('query item with id', () async {
      // Arrange
      final item = _newAccount(userId1);
      final url = '/account/$userId1';
      when(mockDio.get(
        url,
        options: anyNamed('options'),
      )).thenAnswer((_) async {
        return Response<Account>(
          statusCode: 200,
          requestOptions: RequestOptions(path: url),
          data: item,
        );
      });

      // Apply
      final result = await apiClient.get(item.userId);

      // Assert
      expect(result.orElseNull, item);
    });

    test('query items with ids', () async {
      // Arrange
      final item1 = _newAccount(userId1);
      final item2 = _newAccount(userId2);
      final items = [item1, item2];
      final url = '/account?ids=$userId1,$userId2';
      when(mockDio.get(
        url,
        options: anyNamed('options'),
      )).thenAnswer((_) async {
        return Response<List<Account>>(
          statusCode: 200,
          requestOptions: RequestOptions(path: url),
          data: items,
        );
      });

      // Apply
      final result = await apiClient.getAll(
        [userId1, userId2],
      );

      // Assert
      expect(result, items);
    });

    test('creates an item for id', () async {
      // Arrange
      final item = _newAccount(userId1);
      final url = '/account';
      when(mockDio.post(
        url, data: equals(item), // Compare specific data
        options: anyNamed('options'),
      )).thenAnswer((_) async {
        return Response<SingleRepositoryResponse<String, Account>>(
          statusCode: 200,
          requestOptions: RequestOptions(path: url),
          data: SingleRepositoryResponse<String, Account>(
            item: item,
            created: true,
            updated: false,
            removed: false,
          ),
        );
      });

      // Apply
      final result = await apiClient.create(item);

      // Assert
      expect(result.item, item);
      expect(result.created, true);
      expect(result.updated, false);
      expect(result.removed, false);
    });

    test('updates an item with id', () async {
      // Arrange
      final item = _newAccount(userId1);
      final url = '/account/$userId1';
      when(mockDio.put(
        url, data: equals(item), // Compare specific data
        options: anyNamed('options'),
      )).thenAnswer((_) async {
        return Response<SingleRepositoryResponse<String, Account>>(
          statusCode: 200,
          requestOptions: RequestOptions(path: url),
          data: SingleRepositoryResponse<String, Account>(
            item: item,
            created: false,
            updated: true,
            removed: false,
          ),
        );
      });

      // Apply
      final result = await apiClient.update(item);

      // Assert
      expect(result.item, item);
      expect(result.created, false);
      expect(result.updated, true);
      expect(result.removed, false);
    });

    test('removes an item with id', () async {
      // Arrange
      final item = _newAccount(userId1);
      final url = '/account/$userId1';
      when(mockDio.delete(
        url, data: equals(item), // Compare specific data
        options: anyNamed('options'),
      )).thenAnswer((_) async {
        return Response<SingleRepositoryResponse<String, Account>>(
          statusCode: 200,
          requestOptions: RequestOptions(path: url),
          data: SingleRepositoryResponse<String, Account>(
            item: item,
            created: false,
            updated: false,
            removed: true,
          ),
        );
      });

      // Apply
      final result = await apiClient.remove(item);

      // Assert
      expect(result.item, item);
      expect(result.created, false);
      expect(result.updated, false);
      expect(result.removed, true);
    });
  });
  /*
  group('AccountController', () {
    late MockIntegrationManager mockManager;
    late MockAccountRepository mockRepo;
    late AccountController controller;
    late s.Handler app;
    final foo = _define('foo');

    setUp(() {
      mockManager = MockIntegrationManager();
      mockRepo = MockAccountRepository();
      when(mockRepo.toId(any)).thenAnswer(
        (args) => Account.toUniqueId(
          args.positionalArguments.first as Account,
        ),
      );
      controller = AccountController(mockManager, mockRepo);
      app = const s.Pipeline()
          .addMiddleware(s.logRequests())
          .addHandler(controller.router.call);
    });

    test('should inject dependencies correctly', () {
      expect(controller.repo, equals(mockRepo));
      expect(controller.integrations, equals(mockManager));
    });

    test(
        'validate should return integration-not-found problem if integration is missing',
        () async {
      final testUri = Uri.parse('http://example.com');
      final item = _newConfig(foo);

      when(mockManager.get(any)).thenReturn(Optional.empty());

      final result = await controller.validate(testUri, item);

      expect(result.isPresent, isTrue);
      expect(result.value.status, equals(400));
      expect(result.value.type, equals('integration-not-found'));
    });

    test('validate should return empty optional for valid configuration',
        () async {
      final testUri = Uri.parse('http://example.com');
      final item = _newConfig(foo);

      _mockIntegrationGet(mockManager, foo);
      when(mockRepo.where(any)).thenAnswer((_) async => []);
      _mockAccountExistsNone(mockRepo);

      final result = await controller.validate(testUri, item);

      expect(result.isPresent, isFalse);
    });

    test(
        'validate should return integration-instances-exceeded problem if limit exceeded',
        () async {
      final testUri = Uri.parse('http://example.com');
      final bar = _define('bar', 1);
      final item1 = _newConfig(bar, '1');
      final item2 = _newConfig(bar, '2');

      _mockIntegrationGet(mockManager, bar);
      _mockAccountExistsNone(mockRepo);
      _mockAccountWhere(mockRepo, [item2]);

      final result = await controller.validate(testUri, item1);

      expect(result.isPresent, isTrue);
      expect(result.value.status, equals(400));
      expect(result.value.type, equals('integration-instances-exceeded'));
    });

    test('where should filter results based on query parameters', () async {
      final query = {
        'keys': [foo.key],
        'ids': ['1']
      };
      final item = _newConfig(foo, '1');

      _mockAccountWhere(mockRepo, [item]);

      final results = await controller.where(query);

      expect(results, isNotEmpty);
      expect(results.first.key, equals(foo.key));
    });

    test('GET /integration/config should be configured', () async {
      // Arrange
      final item = _newConfig(foo);

      _mockIntegrationGet(mockManager, foo);
      _mockAccountGetAll(mockRepo, [item]);
      _mockAccountExistsNone(mockRepo);

      // Act
      final request = s.Request(
        'GET',
        Uri.parse('http://localhost/integration/config'),
      );
      final response = await app(request);

      // Assert
      expect(
        response.statusCode,
        equals(200),
        reason: await response.readAsString(),
      );
    });

    test('GET /integration/<key>/config should be configured', () async {
      // Arrange
      final item = _newConfig(foo);

      _mockIntegrationGet(mockManager, foo);
      _mockAccountWhere(mockRepo, [item]);
      _mockAccountGetAll(mockRepo, [item]);
      _mockAccountExistsNone(mockRepo);

      // Act
      final request = s.Request(
        'GET',
        Uri.parse('http://localhost/integration/foo/config'),
      );
      final response = await app(request);

      // Assert
      expect(
        response.statusCode,
        equals(200),
        reason: await response.readAsString(),
      );
    });

    test('GET /integration/<key>/config/<id> should be configured', () async {
      // Arrange
      final item = _newConfig(foo, '123');

      _mockIntegrationGet(mockManager, foo);
      _mockAccountWhere(mockRepo, [item]);
      when(mockRepo.get(any)).thenAnswer((_) async => Optional.of(item));
      _mockAccountExistsNone(mockRepo);

      // Act
      final request = s.Request(
        'GET',
        Uri.parse('http://localhost/integration/foo/config/123'),
      );
      final response = await app(request);

      // Assert
      expect(
        response.statusCode,
        equals(200),
        reason: await response.readAsString(),
      );
    });

    test('POST /integration/config should be configured', () async {
      // Arrange
      final item1 = _newConfig(foo, '1');
      final item2 = _newConfig(foo, '2');
      final result = BulkRepositoryResponse<String, Account>(
        created: [item1],
        updated: [item2],
        removed: [],
      ).toResult();

      _mockIntegrationGet(mockManager, foo);
      _mockAccountWhere(mockRepo, [item1]);
      _mockAccountGetNone(mockRepo);
      _mockAccountUpdateAll(mockRepo, result);
      _mockAccountExistsNone(mockRepo);

      // Act
      final request = s.Request(
        'POST',
        Uri.parse('http://localhost/integration/config'),
        body: jsonEncode([item1.toJson()]),
      );
      final response = await app(request);
      final reason = await response.readAsString();

      // Assert
      expect(
        response.statusCode,
        equals(200),
        reason: reason,
      );
      final json = jsonDecode(reason);
      final bulk = _toBulkRepositoryResponse(json);
      final actual = bulk.toResult();
      expect(
        actual,
        equals(result),
        reason: 'Result does not match',
      );
    });

    test('PUT /integration/config should be configured', () async {
      // Arrange
      final item1 = _newConfig(foo, '1');
      final item2v1 = _newConfig(foo, '2');
      final item2v2 = item2v1.copyWith(data: {
        ...item2v1.data,
        IntegrationField.username: 'baz',
      });
      final items = [item1, item2v1];
      final result = BulkRepositoryResponse<String, Account>(
        created: [],
        updated: [item2v2],
        removed: [],
      ).toResult();

      _mockIntegrationGet(mockManager, foo);
      _mockAccountGet(mockRepo, items);
      _mockAccountExists(mockRepo, items);
      _mockAccountUpdateAll(mockRepo, result);

      // Act
      final request = s.Request(
        'PUT',
        Uri.parse('http://localhost/integration/config'),
        body: jsonEncode([item2v2.toJson()]),
      );
      final response = await app(request);
      final reason = await response.readAsString();

      // Assert
      expect(
        response.statusCode,
        equals(200),
        reason: reason,
      );
      final json = jsonDecode(reason);
      final bulk = _toBulkRepositoryResponse(json);
      final actual = bulk.toResult();
      expect(
        actual,
        equals(result),
        reason: 'Result does not match',
      );
    });

    test('DELETE /integration/config should be configured', () async {
      // Arrange
      final item1 = _newConfig(foo, '1');
      final item2 = _newConfig(foo, '2');
      final items = [item1, item2];
      final result = BulkRepositoryResponse<String, Account>(
        created: [],
        updated: [],
        removed: items,
      ).toResult();

      _mockIntegrationGet(mockManager, foo);
      _mockAccountGet(mockRepo, items);
      _mockAccountExistsAll(mockRepo);
      _mockAccountRemoveAll(mockRepo, result);

      // Act
      final request = s.Request(
        'DELETE',
        Uri.parse('http://localhost/integration/config'),
        body: jsonEncode([item1.toJson(), item2.toJson()]),
      );
      final response = await app(request);
      final reason = await response.readAsString();

      // Assert
      expect(
        response.statusCode,
        equals(200),
        reason: reason,
      );
      final json = jsonDecode(reason);
      final bulk = _toBulkRepositoryResponse(json);
      final actual = bulk.toResult();
      expect(
        actual,
        equals(result),
        reason: 'Result does not match',
      );
    });

    test('POST /integration/<key>/config should be configured', () async {
      // Arrange
      final item1 = _newConfig(foo, '1');
      final item2 = _newConfig(foo, '2');
      final item3 = _newConfig(foo, '3');
      final exists = [item1, item2];
      final created = [item3];
      final result = BulkRepositoryResponse<String, Account>(
        created: created,
        updated: [],
        removed: [],
      ).toResult();

      _mockIntegrationGet(mockManager, foo);
      _mockAccountGet(mockRepo, exists);
      _mockAccountWhere(mockRepo, exists);
      _mockAccountExists(mockRepo, exists);
      _mockAccountUpdateAll(mockRepo, result);

      // Act
      final request = s.Request(
        'POST',
        Uri.parse('http://localhost/integration/foo/config'),
        body: jsonEncode(
          created.map((e) => e.toJson()).toList(),
        ),
      );
      final response = await app(request);
      final reason = await response.readAsString();

      // Assert
      expect(
        response.statusCode,
        equals(201),
        reason: reason,
      );
      final json = jsonDecode(reason);
      final bulk = _toBulkRepositoryResponse(json);
      final actual = bulk.toResult();
      expect(
        actual,
        equals(result),
        reason: 'Result does not match',
      );
    });

    test('PUT /integration/<key>/config should be configured', () async {
      // Arrange
      final item1 = _newConfig(foo, '1');
      final item2v1 = _newConfig(foo, '2');
      final item2v2 = item2v1.copyWith(data: {
        ...item2v1.data,
        IntegrationField.username: 'baz',
      });
      final items = [item1, item2v1];
      final result = BulkRepositoryResponse<String, Account>(
        created: [],
        updated: [item2v2],
        removed: [],
      ).toResult();

      _mockIntegrationGet(mockManager, foo);
      _mockAccountGet(mockRepo, items);
      _mockAccountExists(mockRepo, items);
      _mockAccountUpdateAll(mockRepo, result);

      // Act
      final request = s.Request(
        'PUT',
        Uri.parse('http://localhost/integration/config'),
        body: jsonEncode([item2v2.toJson()]),
      );
      final response = await app(request);
      final reason = await response.readAsString();

      // Assert
      expect(
        response.statusCode,
        equals(200),
        reason: reason,
      );
      final json = jsonDecode(reason);
      final bulk = _toBulkRepositoryResponse(json);
      final actual = bulk.toResult();
      expect(
        actual,
        equals(result),
        reason: 'Result does not match',
      );
    });

    test('DELETE /integration/<key>/config should be configured', () async {
      // Arrange
      final item1 = _newConfig(foo, '1');
      final item2 = _newConfig(foo, '2');
      final items = [item1, item2];
      final result = BulkRepositoryResponse<String, Account>(
        created: [],
        updated: [],
        removed: items,
      ).toResult();

      _mockIntegrationGet(mockManager, foo);
      _mockAccountGet(mockRepo, items);
      _mockAccountExistsAll(mockRepo);
      _mockAccountRemoveAll(mockRepo, result);

      // Act
      final request = s.Request(
        'DELETE',
        Uri.parse('http://localhost/integration/foo/config'),
        body: jsonEncode([item1.toJson(), item2.toJson()]),
      );
      final response = await app(request);
      final reason = await response.readAsString();

      // Assert
      expect(
        response.statusCode,
        equals(200),
        reason: reason,
      );
      final json = jsonDecode(reason);
      final bulk = _toBulkRepositoryResponse(json);
      final actual = bulk.toResult();
      expect(
        actual,
        equals(result),
        reason: 'Result does not match',
      );
    });

    test('PUT /integration/<key>/config/<id> should be configured', () async {
      // Arrange
      final item1v1 = _newConfig(foo, '123');
      final item1v2 = item1v1.copyWith(data: {
        ...item1v1.data,
        IntegrationField.username: 'baz',
      });
      final items = [item1v1];
      final result = SingleRepositoryResponse<String, Account>(
        item: item1v2,
        created: false,
        updated: true,
        removed: false,
      ).toResult();

      _mockIntegrationGet(mockManager, foo);
      _mockAccountGet(mockRepo, items);
      _mockAccountExists(mockRepo, items);
      _mockAccountAddOrUpdate(mockRepo, result);

      // Act
      final request = s.Request(
        'PUT',
        Uri.parse('http://localhost/integration/foo/config/123'),
        body: jsonEncode(item1v2.toJson()),
      );
      final response = await app(request);
      final reason = await response.readAsString();

      // Assert
      expect(
        response.statusCode,
        equals(200),
        reason: reason,
      );
      final json = jsonDecode(reason);
      final single = _toSingleRepositoryResponse(json);
      final actual = single.toResult();
      expect(
        actual,
        equals(result),
        reason: 'Result does not match',
      );
    });

    test('DELETE /integration/<key>/config/<id> should be configured',
        () async {
      // Arrange
      final item = _newConfig(foo, '123');
      final items = [item];
      final result = SingleRepositoryResponse<String, Account>(
        item: item,
        created: false,
        updated: true,
        removed: false,
      ).toResult();

      _mockIntegrationGet(mockManager, foo);
      _mockAccountGet(mockRepo, items);
      _mockAccountExists(mockRepo, items);
      _mockAccountRemove(mockRepo, result);

      // Act
      final request = s.Request(
        'DELETE',
        Uri.parse('http://localhost/integration/foo/config/123'),
        body: jsonEncode(item.toJson()),
      );
      final response = await app(request);
      final reason = await response.readAsString();

      // Assert
      expect(
        response.statusCode,
        equals(200),
        reason: reason,
      );
      final json = jsonDecode(reason);
      final single = _toSingleRepositoryResponse(json);
      final actual = single.toResult();
      expect(
        actual,
        equals(result),
        reason: 'Result does not match',
      );
    });
  });
   */
}

void _mockAccountExistsAll(MockAccountRepository mockRepo) {
  when(mockRepo.exists(any)).thenAnswer((_) async => true);
}

void _mockAccountExistsNone(MockAccountRepository mockRepo) {
  when(mockRepo.exists(any)).thenAnswer((_) async => false);
}

void _mockAccountGetNone(MockAccountRepository mockRepo) {
  when(mockRepo.get(any)).thenAnswer((_) async => Optional.empty());
}

void _mockAccountGetAll(MockAccountRepository mockRepo, List<Account> items) {
  when(mockRepo.getAll(any)).thenAnswer((_) async => items);
}

void _mockAccountWhere(MockAccountRepository mockRepo, List<Account> items) {
  when(mockRepo.where(any)).thenAnswer((_) async => items);
}

void _mockAccountAddOrUpdate(
  MockAccountRepository mockRepo,
  SingleRepositoryResult<String, Account> result,
) {
  provideDummy(result);
  when(mockRepo.addOrUpdate(any)).thenAnswer(
    (_) async => result,
  );
}

void _mockAccountRemove(
  MockAccountRepository mockRepo,
  SingleRepositoryResult<String, Account> result,
) {
  provideDummy(result);
  when(mockRepo.remove(any)).thenAnswer(
    (_) async => result,
  );
}

void _mockAccountExists(MockAccountRepository mockRepo, List<Account> items) {
  when(mockRepo.exists(any)).thenAnswer((args) async {
    final id = args.positionalArguments.first as String;
    return items.any(
      (e) => e.userId == id,
    );
  });
}

void _mockAccountGet(MockAccountRepository mockRepo, List<Account> items) {
  when(mockRepo.get(any)).thenAnswer((args) async {
    final id = args.positionalArguments.first as String;
    return items.firstWhereOptional(
      (e) => e.userId == id,
    );
  });
}

SingleRepositoryResponse<String, Account> _toSingleRepositoryResponse(json) {
  return SingleRepositoryResponse<String, Account>.fromJson(
    json,
    (value) {
      return value.toString();
    },
    (data) {
      return Account.fromJson(data as JsonObject);
    },
  );
}

BulkRepositoryResponse<String, Account> _toBulkRepositoryResponse(json) {
  return BulkRepositoryResponse<String, Account>.fromJson(
    json,
    (value) {
      return value.toString();
    },
    (data) {
      return Account.fromJson(data as JsonObject);
    },
  );
}

Account _newAccount(String userId) {
  return Account(userId: userId, homes: []);
}

void _initLogger(Level level) {
  Logger.root.level = level;

  Logger.root.onRecord.listen((record) {
    // TODO: Store logs locally with hive
    print([
      record.time,
      record.level.name,
      record.loggerName,
      record.message,
      [
        if (record.error != null) record.error,
        if (record.stackTrace != null) record.stackTrace,
      ].join('\n'),
    ].where((e) => e.toString().isNotEmpty == true).join(': '));
  });
}
