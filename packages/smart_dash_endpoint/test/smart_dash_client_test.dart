import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smart_dash_endpoint/smart_dash_endpoint.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';
import 'package:test/test.dart';

import 'smart_dash_client_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  group('ServiceConfigClient', () {
    late MockDio mockDio;
    late ServiceConfigClient apiClient;
    final Integration foo = _define('Foo');
    final Integration bar = _define('Bar');

    setUp(() {
      mockDio = MockDio();
      apiClient = ServiceConfigClient(mockDio);
    });

    test('query all items', () async {
      // Arrange
      final item1 = ServiceConfig.fromDefinition(foo);
      final item2 = ServiceConfig.fromDefinition(bar)
          .copyWith(data: {IntegrationField.id: '1'});
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
      final item = ServiceConfig.fromDefinition(foo);
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
      final item1 = ServiceConfig.fromDefinition(foo);
      final item2 = ServiceConfig.fromDefinition(foo)
          .copyWith(data: {IntegrationField.id: '1'});
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
      final item1 = ServiceConfig.fromDefinition(foo);
      final item2 = ServiceConfig.fromDefinition(bar)
          .copyWith(data: {IntegrationField.id: '1'});
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
      final item = ServiceConfig.fromDefinition(foo)
          .copyWith(data: {IntegrationField.id: '1'});
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
      final item1 = ServiceConfig.fromDefinition(foo);
      final item2 = ServiceConfig.fromDefinition(foo)
          .copyWith(data: {IntegrationField.id: '1'});
      final item3 = ServiceConfig.fromDefinition(foo)
          .copyWith(data: {IntegrationField.id: '2'});
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
      final item = ServiceConfig.fromDefinition(foo);
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
      final item = ServiceConfig.fromDefinition(foo)
          .copyWith(data: {IntegrationField.id: '1'});
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
      final item1 = ServiceConfig.fromDefinition(foo);
      final item2 = ServiceConfig.fromDefinition(foo)
          .copyWith(data: {IntegrationField.id: '1'});
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
      final item1 = ServiceConfig.fromDefinition(foo);
      final item2 = ServiceConfig.fromDefinition(bar)
          .copyWith(data: {IntegrationField.id: '1'});
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
      final item = ServiceConfig.fromDefinition(foo);
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
      final item = ServiceConfig.fromDefinition(foo)
          .copyWith(data: {IntegrationField.id: '1'});
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
      final item1 = ServiceConfig.fromDefinition(foo);
      final item2 = ServiceConfig.fromDefinition(foo)
          .copyWith(data: {IntegrationField.id: '1'});
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
      final item1 = ServiceConfig.fromDefinition(foo);
      final item2 = ServiceConfig.fromDefinition(bar)
          .copyWith(data: {IntegrationField.id: '1'});
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
      final item = ServiceConfig.fromDefinition(foo);
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
      final item = ServiceConfig.fromDefinition(foo)
          .copyWith(data: {IntegrationField.id: '1'});
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
      final item1 = ServiceConfig.fromDefinition(foo);
      final item2 = ServiceConfig.fromDefinition(foo)
          .copyWith(data: {IntegrationField.id: '1'});
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
      final item1 = ServiceConfig.fromDefinition(foo);
      final item2 = ServiceConfig.fromDefinition(bar)
          .copyWith(data: {IntegrationField.id: '1'});
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
}

Integration _define(String name) {
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
    instances: 4,
    system: false,
    enabled: true,
  );
}
