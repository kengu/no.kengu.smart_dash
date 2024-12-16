import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logging/logging.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:optional/optional.dart';
import 'package:shelf/shelf.dart' as s;
import 'package:smart_dash_datasource/smart_dash_datasource.dart';
import 'package:smart_dash_home/smart_dash_home.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

import 'smart_dash_home_test.mocks.dart';

@GenerateMocks([
  Dio,
  IntegrationManager,
  ServiceConfigRepository,
])
void main() {
  _initLogger(Level.FINE);
  group('ServiceConfigClient', () {
    late MockDio mockDio;
    late ServiceConfigClient apiClient;
    final Integration foo = _define('foo');
    final Integration bar = _define('bar');

    setUp(() {
      mockDio = MockDio();
      when(mockDio.interceptors).thenReturn(Interceptors());
      mockDio.interceptors.add(
        RepositoryClientInterceptor(ServiceConfig.fromJson),
      );
      apiClient = ServiceConfigClient(mockDio);
    });

    test('query all items', () async {
      // Arrange
      final item1 = _newConfig(foo);
      final item2 = _newConfig(bar, '1');
      final items = [item1, item2];
      final url = '/integration/config';
      when(mockDio.get(
        url,
        options: anyNamed('options'),
      )).thenAnswer((_) async {
        return Response<List<ServiceConfig>>(
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

    test('query item with key', () async {
      // Arrange
      final item = _newConfig(foo);
      final url = '/integration/foo/config';
      when(mockDio.get(
        url,
        options: anyNamed('options'),
      )).thenAnswer((_) async {
        return Response<ServiceConfig>(
          statusCode: 200,
          requestOptions: RequestOptions(path: url),
          data: item,
        );
      });

      // Apply
      final result = await apiClient.get(
        ServiceConfig.toUniqueId(item),
      );

      // Assert
      expect(result.orElseNull, item);
    });

    test('query items with same key', () async {
      // Arrange
      final item1 = _newConfig(foo);
      final item2 = _newConfig(foo, '1');
      final items = [item1, item2];
      final url = '/integration/foo/config?ids=foo,foo:1';
      when(mockDio.get(
        url,
        options: anyNamed('options'),
      )).thenAnswer((_) async {
        return Response<List<ServiceConfig>>(
          statusCode: 200,
          requestOptions: RequestOptions(path: url),
          data: items,
        );
      });

      // Apply
      final result = await apiClient.getAll([
        ServiceConfig.toUniqueId(item1),
        ServiceConfig.toUniqueId(item2),
      ]);

      // Assert
      expect(result, items);
    });

    test('query items with different keys', () async {
      // Arrange
      final item1 = _newConfig(foo);
      final item2 = _newConfig(bar, '1');
      final items = [item1, item2];
      final url = '/integration/config?ids=foo,bar:1';
      when(mockDio.get(
        url,
        options: anyNamed('options'),
      )).thenAnswer((_) async {
        return Response<List<ServiceConfig>>(
          statusCode: 200,
          requestOptions: RequestOptions(path: url),
          data: items,
        );
      });

      // Apply
      final result = await apiClient.getAll([
        ServiceConfig.toUniqueId(item1),
        ServiceConfig.toUniqueId(item2),
      ]);

      // Assert
      expect(result, items);
    });

    test('query items with key and id', () async {
      // Arrange
      final item = _newConfig(foo, '1');
      final items = [item];
      final url = '/integration/foo/config/foo:1';
      when(mockDio.get(
        url,
        options: anyNamed('options'),
      )).thenAnswer((_) async {
        return Response<List<ServiceConfig>>(
          statusCode: 200,
          requestOptions: RequestOptions(path: url),
          data: items,
        );
      });

      // Apply
      final result = await apiClient.getAll([
        ServiceConfig.toUniqueId(item),
      ]);

      // Assert
      expect(result, items);
    });

    test('query items with key and ids', () async {
      // Arrange
      final item1 = _newConfig(foo);
      final item2 = _newConfig(foo, '1');
      final item3 = _newConfig(foo, '2');
      final items = [item1, item2, item3];
      final url = '/integration/foo/config?ids=foo,foo:1,foo:2';
      when(mockDio.get(
        url,
        options: anyNamed('options'),
      )).thenAnswer((_) async {
        return Response<List<ServiceConfig>>(
          statusCode: 200,
          requestOptions: RequestOptions(path: url),
          data: items,
        );
      });

      // Apply
      final result = await apiClient.getAll([
        ServiceConfig.toUniqueId(item1),
        ServiceConfig.toUniqueId(item2),
        ServiceConfig.toUniqueId(item3),
      ]);

      // Assert
      expect(result, items);
    });

    test('creates an item for key', () async {
      // Arrange
      final item = _newConfig(foo);
      final url = '/integration/foo/config';
      when(mockDio.post(
        url, data: equals(item), // Compare specific data
        options: anyNamed('options'),
      )).thenAnswer((_) async {
        return Response<SingleRepositoryResponse<String, ServiceConfig>>(
          statusCode: 200,
          requestOptions: RequestOptions(path: url),
          data: SingleRepositoryResponse<String, ServiceConfig>(
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

    test('creates an item with key and id', () async {
      // Arrange
      final item = _newConfig(foo, '1');
      final url = '/integration/foo/config/1';
      when(mockDio.post(
        url, data: equals(item), // Compare specific data
        options: anyNamed('options'),
      )).thenAnswer((_) async {
        return Response<SingleRepositoryResponse<String, ServiceConfig>>(
          statusCode: 200,
          requestOptions: RequestOptions(path: url),
          data: SingleRepositoryResponse<String, ServiceConfig>(
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

    test('creates items for same key', () async {
      // Arrange
      final item1 = _newConfig(foo);
      final item2 = _newConfig(foo, '1');
      final items = [item1, item2];
      final url = '/integration/foo/config';
      when(mockDio.post(
        url, data: equals(items), // Compare specific data
        options: anyNamed('options'),
      )).thenAnswer((_) async {
        return Response<BulkRepositoryResponse<String, ServiceConfig>>(
          statusCode: 200,
          requestOptions: RequestOptions(path: url),
          data: BulkRepositoryResponse<String, ServiceConfig>(
            created: items,
            updated: [],
            removed: [],
          ),
        );
      });

      // Apply
      final result = await apiClient.createAll(items);

      // Assert
      expect(result.created, items);
      expect(result.updated, isEmpty);
      expect(result.removed, isEmpty);
    });

    test('creates items for different keys', () async {
      // Arrange
      final item1 = _newConfig(foo);
      final item2 = _newConfig(bar, '1');
      final items = [item1, item2];
      final url = '/integration/config';
      when(mockDio.post(
        url, data: equals(items), // Compare specific data
        options: anyNamed('options'),
      )).thenAnswer((_) async {
        return Response<BulkRepositoryResponse<String, ServiceConfig>>(
          statusCode: 200,
          requestOptions: RequestOptions(path: url),
          data: BulkRepositoryResponse<String, ServiceConfig>(
            created: items,
            updated: [],
            removed: [],
          ),
        );
      });

      // Apply
      final result = await apiClient.createAll(items);

      // Assert
      expect(result.created, items);
      expect(result.updated, isEmpty);
      expect(result.removed, isEmpty);
    });

    test('updates an item with key', () async {
      // Arrange
      final item = _newConfig(foo);
      final url = '/integration/foo/config';
      when(mockDio.put(
        url, data: equals(item), // Compare specific data
        options: anyNamed('options'),
      )).thenAnswer((_) async {
        return Response<SingleRepositoryResponse<String, ServiceConfig>>(
          statusCode: 200,
          requestOptions: RequestOptions(path: url),
          data: SingleRepositoryResponse<String, ServiceConfig>(
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

    test('updates an item with key and id', () async {
      // Arrange
      final item = _newConfig(foo, '1');
      final url = '/integration/foo/config/1';
      when(mockDio.put(
        url, data: equals(item), // Compare specific data
        options: anyNamed('options'),
      )).thenAnswer((_) async {
        return Response<SingleRepositoryResponse<String, ServiceConfig>>(
          statusCode: 200,
          requestOptions: RequestOptions(path: url),
          data: SingleRepositoryResponse<String, ServiceConfig>(
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

    test('updates all items for same key', () async {
      // Arrange
      final item1 = _newConfig(foo);
      final item2 = _newConfig(foo, '1');
      final items = [item1, item2];
      final url = '/integration/foo/config';
      when(mockDio.put(
        url, data: equals(items), // Compare specific data
        options: anyNamed('options'),
      )).thenAnswer((_) async {
        return Response<BulkRepositoryResponse<String, ServiceConfig>>(
          statusCode: 200,
          requestOptions: RequestOptions(path: url),
          data: BulkRepositoryResponse<String, ServiceConfig>(
            created: [],
            updated: items,
            removed: [],
          ),
        );
      });

      // Apply
      final result = await apiClient.updateAll(items);

      // Assert
      expect(result.created, isEmpty);
      expect(result.updated, items);
      expect(result.removed, isEmpty);
    });

    test('updates all items for different keys', () async {
      // Arrange
      final item1 = _newConfig(foo);
      final item2 = _newConfig(bar, '1');
      final items = [item1, item2];
      final url = '/integration/config';
      when(mockDio.put(
        url, data: equals(items), // Compare specific data
        options: anyNamed('options'),
      )).thenAnswer((_) async {
        return Response<BulkRepositoryResponse<String, ServiceConfig>>(
          statusCode: 200,
          requestOptions: RequestOptions(path: url),
          data: BulkRepositoryResponse<String, ServiceConfig>(
            created: [],
            updated: items,
            removed: [],
          ),
        );
      });

      // Apply
      final result = await apiClient.updateAll(items);

      // Assert
      expect(result.created, isEmpty);
      expect(result.updated, items);
      expect(result.removed, isEmpty);
    });

    test('removes an item with key', () async {
      // Arrange
      final item = _newConfig(foo);
      final url = '/integration/foo/config';
      when(mockDio.delete(
        url, data: equals(item), // Compare specific data
        options: anyNamed('options'),
      )).thenAnswer((_) async {
        return Response<SingleRepositoryResponse<String, ServiceConfig>>(
          statusCode: 200,
          requestOptions: RequestOptions(path: url),
          data: SingleRepositoryResponse<String, ServiceConfig>(
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

    test('removes an item with key and id', () async {
      // Arrange
      final item = _newConfig(foo, '1');
      final url = '/integration/foo/config/1';
      when(mockDio.delete(
        url, data: equals(item), // Compare specific data
        options: anyNamed('options'),
      )).thenAnswer((_) async {
        return Response<SingleRepositoryResponse<String, ServiceConfig>>(
          statusCode: 200,
          requestOptions: RequestOptions(path: url),
          data: SingleRepositoryResponse<String, ServiceConfig>(
            item: item,
            created: false,
            updated: true,
            removed: false,
          ),
        );
      });

      // Apply
      final result = await apiClient.remove(item);

      // Assert
      expect(result.item, item);
      expect(result.created, false);
      expect(result.updated, true);
      expect(result.removed, false);
    });

    test('removes all items for same key', () async {
      // Arrange
      final item1 = _newConfig(foo);
      final item2 = _newConfig(foo, '1');
      final items = [item1, item2];
      final url = '/integration/foo/config';
      when(mockDio.put(
        url, data: equals(items), // Compare specific data
        options: anyNamed('options'),
      )).thenAnswer((_) async {
        return Response<BulkRepositoryResponse<String, ServiceConfig>>(
          statusCode: 200,
          requestOptions: RequestOptions(path: url),
          data: BulkRepositoryResponse<String, ServiceConfig>(
            created: [],
            updated: [],
            removed: items,
          ),
        );
      });

      // Apply
      final result = await apiClient.updateAll(items);

      // Assert
      expect(result.created, isEmpty);
      expect(result.updated, isEmpty);
      expect(result.removed, items);
    });

    test('removes all items for different keys', () async {
      // Arrange
      final item1 = _newConfig(foo);
      final item2 = _newConfig(bar, '1');
      final items = [item1, item2];
      final url = '/integration/config';
      when(mockDio.put(
        url, data: equals(items), // Compare specific data
        options: anyNamed('options'),
      )).thenAnswer((_) async {
        return Response<BulkRepositoryResponse<String, ServiceConfig>>(
          statusCode: 200,
          requestOptions: RequestOptions(path: url),
          data: BulkRepositoryResponse<String, ServiceConfig>(
            created: [],
            updated: [],
            removed: items,
          ),
        );
      });

      // Apply
      final result = await apiClient.updateAll(items);

      // Assert
      expect(result.created, isEmpty);
      expect(result.updated, isEmpty);
      expect(result.removed, items);
    });
  });

  group('ServiceConfigController', () {
    late MockIntegrationManager mockManager;
    late MockServiceConfigRepository mockRepo;
    late ServiceConfigController controller;
    late s.Handler app;

    final foo = _define('foo');
    const String host = 'http://example.com';

    setUp(() {
      mockManager = MockIntegrationManager();
      mockRepo = MockServiceConfigRepository();
      when(mockRepo.toId(any)).thenAnswer(
        (args) => ServiceConfig.toUniqueId(
          args.positionalArguments.first as ServiceConfig,
        ),
      );
      controller = ServiceConfigController(mockManager, mockRepo);
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
        final testUri = Uri.parse(host);
        final item = _newConfig(foo);

        when(mockManager.get(any)).thenReturn(Optional.empty());

        final result = await controller.validate(
          RepositoryAction.create,
          testUri,
          item,
        );

        expect(result.isPresent, isTrue);
        expect(result.value.status, equals(400));
        expect(result.value.type, equals('integration-not-found'));
      },
    );

    test(
      'validate should return empty optional for valid configuration',
      () async {
        final testUri = Uri.parse(host);
        final item = _newConfig(foo);

        _mockIntegrationGet(mockManager, foo);
        when(mockRepo.where(any)).thenAnswer((_) async => []);
        _mockServiceConfigExistsNone(mockRepo);

        final result = await controller.validate(
          RepositoryAction.create,
          testUri,
          item,
        );

        expect(result.isPresent, isFalse);
      },
    );

    test(
      'validate should return integration-instances-exceeded problem if limit exceeded',
      () async {
        final testUri = Uri.parse(host);
        final bar = _define('bar', 1);
        final item1 = _newConfig(bar, '1');
        final item2 = _newConfig(bar, '2');

        _mockIntegrationGet(mockManager, bar);
        _mockServiceConfigExistsNone(mockRepo);
        _mockServiceConfigWhere(mockRepo, [item2]);

        final result = await controller.validate(
          RepositoryAction.create,
          testUri,
          item1,
        );

        expect(result.isPresent, isTrue);
        expect(result.value.status, equals(400));
        expect(result.value.type, equals('integration-instances-exceeded'));
      },
    );

    test('where should filter results based on query parameters', () async {
      final query = {
        'keys': [foo.key],
        'ids': ['1']
      };
      final item = _newConfig(foo, '1');

      _mockServiceConfigWhere(mockRepo, [item]);

      final results = await controller.where(query);

      expect(results, isNotEmpty);
      expect(results.first.key, equals(foo.key));
    });

    test('GET /integration/config should be configured', () async {
      // Arrange
      final item1 = _newConfig(foo, '1');
      final item2 = _newConfig(foo, '2');
      final expected = [item1, item2];

      _mockIntegrationGet(mockManager, foo);
      _mockServiceConfigGetAll(mockRepo, expected);
      _mockServiceConfigExistsNone(mockRepo);

      // Act
      final request = s.Request(
        'GET',
        Uri.parse('$host/integration/config'),
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
      final actual = _toServiceConfigList(json);
      expect(
        actual,
        equals(expected),
        reason: 'Result does not match',
      );
    });

    test('GET /integration/<key>/config should be configured', () async {
      // Arrange
      final item = _newConfig(foo);
      final expected = [item];

      _mockIntegrationGet(mockManager, foo);
      _mockServiceConfigWhere(mockRepo, expected);
      _mockServiceConfigGetAll(mockRepo, expected);
      _mockServiceConfigExistsNone(mockRepo);

      // Act
      final request = s.Request(
        'GET',
        Uri.parse('$host/integration/foo/config'),
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
      final actual = _toServiceConfigList(json);
      expect(
        actual,
        equals(expected),
        reason: reason,
      );
    });

    test('GET /integration/<key>/config/<id> should be configured', () async {
      // Arrange
      final item = _newConfig(foo, '123');

      _mockIntegrationGet(mockManager, foo);
      _mockServiceConfigWhere(mockRepo, [item]);
      when(mockRepo.get(any)).thenAnswer((_) async => Optional.of(item));
      _mockServiceConfigExistsNone(mockRepo);

      // Act
      final request = s.Request(
        'GET',
        Uri.parse('$host/integration/foo/config/123'),
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
      final actual = ServiceConfig.fromJson(json);
      expect(
        actual,
        equals(item),
        reason: reason,
      );
    });

    test('POST /integration/config should be configured', () async {
      // Arrange
      final item1 = _newConfig(foo, '1');
      final item2 = _newConfig(foo, '2');
      final result = BulkRepositoryResponse<String, ServiceConfig>(
        created: [item1],
        updated: [item2],
        removed: [],
      ).toResult();

      _mockIntegrationGet(mockManager, foo);
      _mockServiceConfigWhere(mockRepo, [item1]);
      _mockServiceConfigGetNone(mockRepo);
      _mockServiceConfigUpdateAll(mockRepo, result);
      _mockServiceConfigExistsNone(mockRepo);

      // Act
      final request = s.Request(
        'POST',
        Uri.parse('$host/integration/config'),
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
      final result = BulkRepositoryResponse<String, ServiceConfig>(
        created: [],
        updated: [item2v2],
        removed: [],
      ).toResult();

      _mockIntegrationGet(mockManager, foo);
      _mockServiceConfigGet(mockRepo, items);
      _mockServiceConfigExists(mockRepo, items);
      _mockServiceConfigUpdateAll(mockRepo, result);

      // Act
      final request = s.Request(
        'PUT',
        Uri.parse('$host/integration/config'),
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
      final result = BulkRepositoryResponse<String, ServiceConfig>(
        created: [],
        updated: [],
        removed: items,
      ).toResult();

      _mockIntegrationGet(mockManager, foo);
      _mockServiceConfigGet(mockRepo, items);
      _mockServiceConfigExistsAll(mockRepo);
      _mockServiceConfigRemoveAll(mockRepo, result);

      // Act
      final request = s.Request(
        'DELETE',
        Uri.parse('$host/integration/config'),
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
      final result = BulkRepositoryResponse<String, ServiceConfig>(
        created: created,
        updated: [],
        removed: [],
      ).toResult();

      _mockIntegrationGet(mockManager, foo);
      _mockServiceConfigGet(mockRepo, exists);
      _mockServiceConfigWhere(mockRepo, exists);
      _mockServiceConfigExists(mockRepo, exists);
      _mockServiceConfigUpdateAll(mockRepo, result);

      // Act
      final request = s.Request(
        'POST',
        Uri.parse('$host/integration/foo/config'),
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
      final result = BulkRepositoryResponse<String, ServiceConfig>(
        created: [],
        updated: [item2v2],
        removed: [],
      ).toResult();

      _mockIntegrationGet(mockManager, foo);
      _mockServiceConfigGet(mockRepo, items);
      _mockServiceConfigExists(mockRepo, items);
      _mockServiceConfigUpdateAll(mockRepo, result);

      // Act
      final request = s.Request(
        'PUT',
        Uri.parse('$host/integration/config'),
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
      final result = BulkRepositoryResponse<String, ServiceConfig>(
        created: [],
        updated: [],
        removed: items,
      ).toResult();

      _mockIntegrationGet(mockManager, foo);
      _mockServiceConfigGet(mockRepo, items);
      _mockServiceConfigExistsAll(mockRepo);
      _mockServiceConfigRemoveAll(mockRepo, result);

      // Act
      final request = s.Request(
        'DELETE',
        Uri.parse('$host/integration/foo/config'),
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
      final result = SingleRepositoryResponse<String, ServiceConfig>(
        item: item1v2,
        created: false,
        updated: true,
        removed: false,
      ).toResult();

      _mockIntegrationGet(mockManager, foo);
      _mockServiceConfigGet(mockRepo, items);
      _mockServiceConfigExists(mockRepo, items);
      _mockServiceConfigAddOrUpdate(mockRepo, result);

      // Act
      final request = s.Request(
        'PUT',
        Uri.parse('$host/integration/foo/config/123'),
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
      final result = SingleRepositoryResponse<String, ServiceConfig>(
        item: item,
        created: false,
        updated: true,
        removed: false,
      ).toResult();

      _mockIntegrationGet(mockManager, foo);
      _mockServiceConfigGet(mockRepo, items);
      _mockServiceConfigExists(mockRepo, items);
      _mockServiceConfigRemove(mockRepo, result);

      // Act
      final request = s.Request(
        'DELETE',
        Uri.parse('$host/integration/foo/config/123'),
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
}

void _mockServiceConfigExistsAll(MockServiceConfigRepository mockRepo) {
  when(mockRepo.exists(any)).thenAnswer((_) async => true);
}

void _mockServiceConfigExistsNone(MockServiceConfigRepository mockRepo) {
  when(mockRepo.exists(any)).thenAnswer((_) async => false);
}

void _mockServiceConfigGetNone(MockServiceConfigRepository mockRepo) {
  when(mockRepo.get(any)).thenAnswer((_) async => Optional.empty());
}

void _mockServiceConfigGetAll(
    MockServiceConfigRepository mockRepo, List<ServiceConfig> items) {
  when(mockRepo.getAll(any)).thenAnswer((_) async => items);
}

void _mockServiceConfigWhere(
    MockServiceConfigRepository mockRepo, List<ServiceConfig> items) {
  when(mockRepo.where(any)).thenAnswer((_) async => items);
}

void _mockIntegrationGet(
    MockIntegrationManager mockIntegrationManager, Integration foo) {
  when(mockIntegrationManager.get(any)).thenReturn(Optional.of(foo));
}

void _mockServiceConfigAddOrUpdate(
  MockServiceConfigRepository mockRepo,
  SingleRepositoryResult<String, ServiceConfig> result,
) {
  provideDummy(result);
  when(mockRepo.addOrUpdate(any)).thenAnswer(
    (_) async => result,
  );
}

void _mockServiceConfigRemove(
  MockServiceConfigRepository mockRepo,
  SingleRepositoryResult<String, ServiceConfig> result,
) {
  provideDummy(result);
  when(mockRepo.remove(any)).thenAnswer(
    (_) async => result,
  );
}

void _mockServiceConfigUpdateAll(
  MockServiceConfigRepository mockRepo,
  BulkRepositoryResult<String, ServiceConfig> result,
) {
  provideDummy(result);
  when(mockRepo.updateAll(any)).thenAnswer(
    (_) async => result,
  );
}

void _mockServiceConfigRemoveAll(
  MockServiceConfigRepository mockRepo,
  BulkRepositoryResult<String, ServiceConfig> result,
) {
  provideDummy(result);
  when(mockRepo.removeAll(any)).thenAnswer(
    (_) async => result,
  );
}

void _mockServiceConfigExists(
    MockServiceConfigRepository mockRepo, List<ServiceConfig> items) {
  when(mockRepo.exists(any)).thenAnswer((args) async {
    final id = args.positionalArguments.first as String;
    return items.any(
      (e) => ServiceConfig.toUniqueId(e) == id,
    );
  });
}

void _mockServiceConfigGet(
    MockServiceConfigRepository mockRepo, List<ServiceConfig> items) {
  when(mockRepo.get(any)).thenAnswer((args) async {
    final id = args.positionalArguments.first as String;
    return items.firstWhereOptional(
      (e) => ServiceConfig.toUniqueId(e) == id,
    );
  });
}

List<ServiceConfig> _toServiceConfigList(dynamic json) {
  return (json as List)
      .whereType<JsonObject>()
      .map(ServiceConfig.fromJson)
      .toList();
}

SingleRepositoryResponse<String, ServiceConfig> _toSingleRepositoryResponse(
    json) {
  return SingleRepositoryResponse<String, ServiceConfig>.fromJson(
    json,
    (value) {
      return value.toString();
    },
    (data) {
      return ServiceConfig.fromJson(data as JsonObject);
    },
  );
}

BulkRepositoryResponse<String, ServiceConfig> _toBulkRepositoryResponse(json) {
  return BulkRepositoryResponse<String, ServiceConfig>.fromJson(
    json,
    (value) {
      return value.toString();
    },
    (data) {
      return ServiceConfig.fromJson(data as JsonObject);
    },
  );
}

ServiceConfig _newConfig(Integration definition, [String? id]) {
  final item = ServiceConfig.fromDefinition(definition);
  if (id != null) {
    return item.copyWith(
      data: {IntegrationField.id: id},
    );
  }
  return item;
}

Integration _define(String name, [int max = 4]) {
  return Integration(
    key: name.toLowerCase(),
    type: IntegrationType.device,
    name: "$name API",
    image: "$name.png",
    category: name,
    description: "Enter $name information",
    fields: [
      IntegrationField.host,
      IntegrationField.port,
      IntegrationField.username,
      IntegrationField.password,
    ],
    dependsOn: [],
    instances: max,
    system: false,
    enabled: true,
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
