import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logging/logging.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:optional/optional.dart';
import 'package:shelf/shelf.dart' as s;
import 'package:smart_dash_integration/smart_dash_integration.dart';
import 'package:test/test.dart';

import 'integration_test.mocks.dart';

@GenerateMocks([
  Dio,
  IntegrationRegistry,
])
void main() {
  _initLogger(Level.FINE);
  group('IntegrationTypeClient', () {
    late MockDio mockDio;
    late IntegrationTypeClient apiClient;

    setUp(() {
      mockDio = MockDio();
      when(mockDio.interceptors).thenReturn(Interceptors());
      mockDio.interceptors.add(
        JsonClientInterceptor(
          Integration.fromJson,
          (e) => e.toJson(),
        ),
      );
      apiClient = IntegrationTypeClient(mockDio);
    });

    tearDown(() {
      reset(mockDio);
    });

    test('query all items', () async {
      // Arrange
      final item1 = _define('foo');
      final item2 = _define('bar');
      final items = [item1, item2];
      final url = '/integration';
      when(mockDio.get(
        url,
        options: anyNamed('options'),
      )).thenAnswer((_) async {
        return Response<List<Integration>>(
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
      final item = _define('foo');
      final url = '/integration/foo';
      when(mockDio.get(
        url,
        options: anyNamed('options'),
      )).thenAnswer((_) async {
        return Response<Integration>(
          statusCode: 200,
          requestOptions: RequestOptions(path: url),
          data: item,
        );
      });

      // Apply
      final result = await apiClient.get(
        item.key,
      );

      // Assert
      expect(result.orElseNull, item);
    });

    test('query items with different keys', () async {
      // Arrange
      final item1 = _define('foo');
      final item2 = _define('bar');
      final query = [item1.key, item2.key];
      final items = [item1, item2];
      final url = '/integration?keys=foo,bar';
      when(mockDio.get(
        url,
        options: anyNamed('options'),
      )).thenAnswer((_) async {
        return Response<List<Integration>>(
          statusCode: 200,
          requestOptions: RequestOptions(path: url),
          data: items,
        );
      });

      // Apply
      final result = await apiClient.getAll(query);

      // Assert
      expect(result, items);
    });
  });

  group('IntegrationTypeController', () {
    late MockIntegrationRegistry mockRegistry;
    late IntegrationTypeController controller;
    late s.Handler app;

    const String host = 'http://example.com';

    setUp(() {
      mockRegistry = MockIntegrationRegistry();
      controller = IntegrationTypeController(mockRegistry);
      app = const s.Pipeline()
          .addMiddleware(s.logRequests())
          .addHandler(controller.router.call);
    });

    tearDown(() {
      reset(mockRegistry);
    });

    test('should inject dependencies correctly', () {
      expect(controller.registry, equals(isA<MockIntegrationRegistry>()));
    });

    test('GET /integration should be configured', () async {
      // Arrange
      final item1 = _define('foo');
      final item2 = _define('bar');
      final items = [item1, item2];
      final expected = [item1, item2];

      _mockIntegrationGetAll(mockRegistry, items);

      // Act
      final request = s.Request(
        'GET',
        Uri.parse('$host/integration'),
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
      final actual = _toIntegrationList(json);
      expect(
        actual,
        equals(expected),
        reason: 'Result does not match',
      );
    });

    test('GET /integration/<key> should be configured', () async {
      // Arrange
      final item1 = _define('foo');
      final item2 = _define('bar');
      final items = [item1, item2];

      _mockIntegrationGet(mockRegistry, item1);
      _mockIntegrationGetAll(mockRegistry, items);

      // Act
      final request = s.Request(
        'GET',
        Uri.parse('$host/integration/foo'),
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
      final actual = Integration.fromJson(json);
      expect(
        actual,
        equals(item1),
        reason: reason,
      );
    });

    test('GET /integration?keys=foo,baz should be configured', () async {
      // Arrange
      final item1 = _define('foo');
      final item2 = _define('bar');
      final item3 = _define('baz');
      final items = [item1, item2, item3];
      final expected = [item1, item3];
      final query = expected.map((e) => e.key).toList();

      _mockIntegrationGet(mockRegistry, item1);
      _mockIntegrationGetAll(mockRegistry, items);
      _mockIntegrationWhere(mockRegistry, expected);

      // Act
      final request = s.Request(
        'GET',
        Uri.parse('$host/integration?keys=${query.join(',')}'),
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
      final actual = _toIntegrationList(json);
      expect(
        actual,
        equals(expected),
        reason: reason,
      );
    });
  });
}

void _mockIntegrationGet(
    MockIntegrationRegistry MockIntegrationRegistry, Integration foo) {
  when(MockIntegrationRegistry.get(any)).thenReturn(Optional.of(foo));
}

void _mockIntegrationGetAll(
    MockIntegrationRegistry MockIntegrationRegistry, List<Integration> items) {
  when(MockIntegrationRegistry.getAll()).thenReturn(
    Map.fromEntries(items.map((e) => MapEntry(e.key, e))),
  );
}

void _mockIntegrationWhere(
    MockIntegrationRegistry MockIntegrationRegistry, List<Integration> items) {
  when(MockIntegrationRegistry.where(any)).thenReturn(
    Map.fromEntries(items.map((e) => MapEntry(e.key, e))),
  );
}

List<Integration> _toIntegrationList(dynamic json) {
  return (json as List)
      .whereType<JsonObject>()
      .map(Integration.fromJson)
      .toList();
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
