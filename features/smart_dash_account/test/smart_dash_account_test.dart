import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logging/logging.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:optional/optional.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shelf/shelf.dart' as s;
import 'package:smart_dash_account/smart_dash_account_backend.dart';
import 'package:smart_dash_account/src/account/data/account_app_client.dart';
import 'package:smart_dash_datasource/smart_dash_datasource.dart';

import 'smart_dash_account_test.mocks.dart';

@GenerateMocks([
  Dio,
  AccountBackendRepository,
])
void main() {
  _initLogger(Level.FINE);
  group('AccountClient', () {
    late MockDio mockDio;
    late AccountAppClient apiClient;
    const String userId1 = 'u:1';
    const String userId2 = 'u:2';

    setUp(() {
      mockDio = MockDio();
      when(mockDio.interceptors).thenReturn(Interceptors());
      mockDio.interceptors.add(
        JsonClientInterceptor(
          Account.fromJson,
          (e) => e.toJson(),
        ),
      );
      apiClient = AccountAppClient(mockDio);
    });

    tearDown(() {
      reset(mockDio);
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
      when(mockDio.patch(
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

  group('AccountController', () {
    late s.Handler app;
    late AccountBackendController controller;
    late MockAccountBackendRepository mockRepo;

    const String userId1 = 'u:1';
    const String userId2 = 'u:2';
    const String dbPath = 'some/path';
    const String host = 'http://example.com';

    setUp(() {
      mockRepo = MockAccountBackendRepository();
      when(mockRepo.toId(any)).thenAnswer(
        (args) => (args.positionalArguments.first as Account).userId,
      );
      final ref = ProviderContainer(overrides: [
        backendAccountRepositoryProvider(dbPath).overrideWith(
          (_) => mockRepo,
        ),
      ]);
      controller = AccountBackendController(ref, dbPath);
      app = const s.Pipeline()
          .addMiddleware(s.logRequests())
          .addHandler(controller.router.call);
      addTearDown(ref.dispose);
    });

    tearDown(() {
      reset(mockRepo);
    });

    test('should inject dependencies correctly', () {
      expect(controller.repo, equals(mockRepo));
    });

    test(
      'validate should return account-home-duplicate problem',
      () async {
        // Arrange
        final testUri = Uri.parse(host);
        final home1 = _newHome(userId1);
        final home2 = _newHome(userId1);
        final item = _newAccount(userId1, [home1, home2]);

        _mockGetAccount(mockRepo, item);

        // Act
        final result = await controller.validateSchema(
          ClientAction.create,
          testUri,
          item,
        );

        // Assert
        expect(result.isPresent, isTrue);
        expect(result.value.status, equals(400));
        expect(result.value.type, equals('account-duplicate-home'));
      },
    );

    test(
      'validate should return empty optional',
      () async {
        // Arrange
        final testUri = Uri.parse(host);
        final home1 = _newHome(userId1);
        final home2 = _newHome(userId2);
        final item = _newAccount(userId1, [home1, home2]);

        _mockGetAccount(mockRepo, item);

        // Act
        final result = await controller.validateSchema(
          ClientAction.create,
          testUri,
          item,
        );

        // Assert
        expect(result.isPresent, isFalse);
      },
    );

    test('where should filter results based on query parameters', () async {
      // Arrange
      final query = {
        'ids': [userId1]
      };
      final item = _newAccount(userId1);

      _mockAccountWhere(mockRepo, [item]);

      // Act
      final results = await controller.where(query);

      // Assert
      expect(results, isNotEmpty);
      expect(results.first.userId, equals(item.userId));
    });

    test('GET /account should be configured', () async {
      // Arrange
      final testUri = Uri.parse('$host/account');
      final item1 = _newAccount(userId1);
      final item2 = _newAccount(userId2);
      final expected = [item1, item2];
      _mockAccountGetAll(mockRepo, expected);
      _mockAccountExistsNone(mockRepo);

      // Act
      final request = s.Request('GET', testUri);
      final response = await app(request);
      final reason = await response.readAsString();

      // Assert
      expect(
        response.statusCode,
        equals(200),
        reason: reason,
      );
      final json = jsonDecode(reason);
      final actual = _toAccountList(json);
      expect(
        actual,
        equals(expected),
        reason: 'Result does not match',
      );
    });

    test('GET /account/<userId> should be configured', () async {
      // Arrange
      final testUri = Uri.parse('$host/account/$userId1');
      final item1 = _newAccount(userId1);
      final item2 = _newAccount(userId2);
      final items = [item1, item2];
      _mockAccountWhere(mockRepo, items);
      _mockAccountGet(mockRepo, items);
      _mockAccountExistsNone(mockRepo);

      // Act
      final request = s.Request('GET', testUri);
      final response = await app(request);
      final reason = await response.readAsString();

      // Assert
      expect(
        response.statusCode,
        equals(200),
        reason: reason,
      );
      final json = jsonDecode(reason);
      final actual = Account.fromJson(json);
      expect(
        actual,
        equals(item1),
        reason: 'Result does not match',
      );
    });

    test('POST /account should be configured', () async {
      // Arrange
      final testUri = Uri.parse('$host/account');
      final item1 = _newAccount(userId1);
      final item2 = _newAccount(userId2);
      final result = SingleRepositoryResponse<String, Account>(
        item: item2,
        created: true,
        updated: false,
        removed: false,
      ).toResult();

      _mockAccountWhere(mockRepo, [item1]);
      _mockAccountGetNone(mockRepo);
      _mockAccountUpsert(mockRepo, result);
      _mockAccountExistsNone(mockRepo);

      // Act
      final request = s.Request(
        'POST',
        testUri,
        body: jsonEncode(item2.toJson()),
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
      final bulk = _toSingleRepositoryResponse(json);
      final actual = bulk.toResult();
      expect(
        actual,
        equals(result),
        reason: 'Result does not match',
      );
      expect(
        bulk.created,
        isTrue,
        reason: 'Only [created] should be true',
      );
      expect(
        bulk.updated,
        isFalse,
        reason: 'Only [created] should be true',
      );
      expect(
        bulk.removed,
        isFalse,
        reason: 'Only [created] should be true',
      );
    });

    test('PUT /account/<userId> should be configured', () async {
      // Arrange
      final testUri = Uri.parse('$host/account/$userId2');
      final item1 = _newAccount(userId1);
      final item2v1 = _newAccount(userId2);
      final item2v2 = _newAccount(userId2, [_newHome(userId1)]);
      final items = [item1, item2v1];
      final result = SingleRepositoryResponse<String, Account>(
        item: item2v2,
        created: false,
        updated: true,
        removed: false,
      ).toResult();

      _mockAccountGet(mockRepo, items);
      _mockAccountExists(mockRepo, items);
      _mockAccountUpsert(mockRepo, result);

      // Act
      final request = s.Request(
        'PUT',
        testUri,
        body: jsonEncode(item2v2.toJson()),
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
      final bulk = _toSingleRepositoryResponse(json);
      final actual = bulk.toResult();
      expect(
        actual,
        equals(result),
        reason: 'Result does not match',
      );
      expect(
        bulk.created,
        isFalse,
        reason: 'Only [updated] should be true',
      );
      expect(
        bulk.updated,
        isTrue,
        reason: 'Only [updated] should be true',
      );
      expect(
        bulk.removed,
        isFalse,
        reason: 'Only [updated] should be true',
      );
    });

    test('DELETE /account/<userId> should be configured', () async {
      // Arrange
      final testUri = Uri.parse('$host/account/$userId2');
      final item1 = _newAccount(userId1);
      final item2 = _newAccount(userId2);
      final items = [item1, item2];
      final result = SingleRepositoryResponse<String, Account>(
        item: item2,
        created: false,
        updated: false,
        removed: true,
      ).toResult();

      _mockAccountGet(mockRepo, items);
      _mockAccountExists(mockRepo, items);
      _mockAccountRemove(mockRepo, result);

      // Act
      final request = s.Request(
        'DELETE',
        testUri,
        body: jsonEncode(item2.toJson()),
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
      final bulk = _toSingleRepositoryResponse(json);
      final actual = bulk.toResult();
      expect(
        actual,
        equals(result),
        reason: 'Result does not match',
      );
      expect(
        bulk.created,
        isFalse,
        reason: 'Only [removed] should be true',
      );
      expect(
        bulk.updated,
        isFalse,
        reason: 'Only [removed] should be true',
      );
      expect(
        bulk.removed,
        isTrue,
        reason: 'Only [removed] should be true',
      );
    });
  });
}

void _mockGetAccount(MockAccountBackendRepository mockRepo, Account item) {
  when(mockRepo.get(any)).thenAnswer((_) async => Optional.of(item));
}

void _mockAccountExistsNone(MockAccountBackendRepository mockRepo) {
  when(mockRepo.exists(any)).thenAnswer((_) async => false);
}

void _mockAccountGetNone(MockAccountBackendRepository mockRepo) {
  when(mockRepo.get(any)).thenAnswer((_) async => Optional.empty());
}

void _mockAccountGetAll(
    MockAccountBackendRepository mockRepo, List<Account> items) {
  when(mockRepo.getAll(any)).thenAnswer((_) async => items);
}

void _mockAccountWhere(
    MockAccountBackendRepository mockRepo, List<Account> items) {
  when(mockRepo.where(any)).thenAnswer((_) async => items);
}

void _mockAccountUpsert(
  MockAccountBackendRepository mockRepo,
  SingleRepositoryResult<String, Account> result,
) {
  provideDummy(result);
  when(mockRepo.upsert(any)).thenAnswer(
    (_) async => result,
  );
}

void _mockAccountRemove(
  MockAccountBackendRepository mockRepo,
  SingleRepositoryResult<String, Account> result,
) {
  provideDummy(result);
  when(mockRepo.remove(any)).thenAnswer(
    (_) async => result,
  );
}

void _mockAccountExists(
    MockAccountBackendRepository mockRepo, List<Account> items) {
  when(mockRepo.exists(any)).thenAnswer((args) async {
    final id = args.positionalArguments.first as String;
    return items.any(
      (e) => e.userId == id,
    );
  });
}

void _mockAccountGet(
    MockAccountBackendRepository mockRepo, List<Account> items) {
  when(mockRepo.get(any)).thenAnswer((args) async {
    final id = args.positionalArguments.first as String;
    return items.firstWhereOptional(
      (e) => e.userId == id,
    );
  });
}

List<Account> _toAccountList(dynamic json) {
  return (json as List).whereType<JsonObject>().map(Account.fromJson).toList();
}

SingleRepositoryResponse<String, Account> _toSingleRepositoryResponse(
    dynamic json) {
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

Account _newAccount(String userId, [List<Home> homes = const []]) {
  return Account(userId: userId, homes: homes);
}

Home _newHome(String id) {
  return Home(
    id: id,
    name: id,
    members: [],
    services: [],
    location: Location.empty(),
  );
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
