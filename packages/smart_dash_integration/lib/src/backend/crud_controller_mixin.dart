import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:optional/optional.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_datasource/smart_dash_datasource.dart';

mixin CRUDControllerMixin<I, T> {
  String get type;
  Logger get log => Logger('$runtimeType');

  I toId(String key);
  JsonObject toJson(T item);
  T fromJson(JsonObject json);
  I toIdFromJson(JsonObject json, Map<String, String?> params);
  Iterable<String> toMissingKeys(JsonObject json, Map<String, String?> params);

  Future<bool> exists(I id);
  Future<Optional<T>> get(I id);
  Future<List<T>> getAll();
  Future<List<T>> where(Map<String, List<String>> query) {
    throw UnimplementedError('$runtimeType does not implement where()');
  }

  Future<SingleRepositoryResult<I, T>> remove(T item) {
    throw UnimplementedError('$runtimeType does not implement remove()');
  }

  Future<SingleRepositoryResult<I, T>> addOrUpdate(T item) {
    throw UnimplementedError('$runtimeType does not implement addOrUpdate()');
  }

  Future<BulkRepositoryResult<I, T>> updateAll(List<T> items) {
    throw UnimplementedError('$runtimeType does not implement updateAll()');
  }

  Future<BulkRepositoryResult<I, T>> removeAll(List<T> items) {
    throw UnimplementedError('$runtimeType does not implement updateAll()');
  }

  JsonObject ensure(JsonObject json, Map<String, String?> params) {
    return json;
  }

  Map<String, String?> toParams(Request request, List<String> keys) {
    return Map.fromEntries(
      keys.map((key) => MapEntry(key, request.params[key])),
    );
  }

  I toIdFromParams(
    Request request,
    List<String> keys, [
    String delimiter = ':',
  ]) {
    return toId(
      keys.map((key) => request.params[key]).join(delimiter),
    );
  }

  Map<String, List<String>> toQuery(
    Request request,
    List<String> paramKeys,
    List<String> queryKeys,
  ) {
    final query = <String, List<String>>{};
    for (final key in paramKeys) {
      final value = Optional.ofNullable(
        request.params[key],
      );
      if (value.isPresent) {
        query[key] = value.value.split(',').toList();
      }
    }
    for (final key in queryKeys) {
      final value = Optional.ofNullable(
        request.url.queryParameters[key],
      );
      if (value.isPresent) {
        query[key] = value.value.split(',').toList();
      }
    }
    return query;
  }

  @protected
  Handler handleQuery(
    List<String> paramKeys, [
    List<String> queryKeys = const [],
  ]) {
    return (Request request) async {
      final uri = request.url.normalizePath();
      try {
        final query = toQuery(request, paramKeys, queryKeys);
        final items = query.isEmpty ? await getAll() : await where(query);
        return Response.ok(jsonEncode(items.map(toJson).toList()),
            headers: {'Content-Type': 'application/json'});
      } catch (error, stackTrace) {
        log.shout(
          'GET /$uri failed',
          error,
          stackTrace,
        );
        return Problems.internalServerError(
          type: '${type.toLowerCase()}s-get-failed',
          title: 'Failed to get all ${type}s',
          detail: '$error',
          instance: '/$uri',
        );
      }
    };
  }

  @protected
  Function handleGet(List<String> keys) {
    return (Request request) async {
      final uri = request.url.normalizePath();
      final id = toIdFromParams(request, keys);
      try {
        final result = await get(id);
        if (!result.isPresent) {
          return Problems.notFound(
            type: '${type.toLowerCase()}-not-found',
            title: '$type not found',
            detail: '$type [$id] not found.',
            instance: '/$uri',
          );
        }
        return Response.ok(
          jsonEncode(toJson(result.value)),
          headers: {'Content-Type': 'application/json'},
        );
      } catch (error, stackTrace) {
        log.shout(
          'GET /$uri failed',
          error,
          stackTrace,
        );
        return Problems.internalServerError(
          type: '${type.toLowerCase()}-get-failed',
          title: 'Failed to get $type',
          detail: '$error',
          instance: '/$uri',
        );
      }
    };
  }

  @protected
  Function handlePost(List<String> keys) {
    return (Request request) async {
      final uri = request.url.normalizePath();
      try {
        final body = await request.readAsString();
        final raw = jsonDecode(body);
        if (raw is! JsonObject) {
          return Problems.badRequest(
            type: 'request-body-invalid',
            title: 'Expected JsonObject',
            detail: 'Received body of type ${raw.runtimeType}',
            instance: '/$uri',
          );
        }

        final params = toParams(request, keys);
        final json = ensure(raw, params);
        final missing = toMissingKeys(json, params);
        if (missing.isNotEmpty) {
          return Problems.badRequest(
            type: '${type.toLowerCase()}-body-invalid',
            title: '$type has invalid data',
            detail: '${missing.map((id) => '$type.$id')} '
                '${request.params.length == 1 ? 'is' : 'are'} missing',
            instance: '/$uri',
          );
        }
        final id = toIdFromJson(json, params);
        final item = fromJson(json);
        if (await exists(id)) {
          return Problems.forbidden(
            type: '${type.toLowerCase()}-exists',
            title: '$type exists',
            detail: '$type [$id] exists.',
            instance: '/$uri',
          );
        }

        final result = await addOrUpdate(item);
        return Response(
          201,
          body: jsonEncode(toJson(result.item)),
          headers: {'Content-Type': 'application/json'},
        );
      } catch (error, stackTrace) {
        log.shout(
          'POST /$uri failed',
          error,
          stackTrace,
        );
        return Problems.internalServerError(
          type: '${type.toLowerCase()}-not-created',
          title: '$type was not created',
          detail: '$error',
          instance: '/$uri',
        );
      }
    };
  }

  @protected
  Function handlePut(List<String> keys) {
    return (Request request) async {
      final uri = request.url.normalizePath();
      try {
        final body = await request.readAsString();
        final raw = jsonDecode(body);
        if (raw is! JsonObject) {
          return Problems.badRequest(
            type: 'request-body-invalid',
            title: 'Expected JsonObject',
            detail: 'Received body of type ${raw.runtimeType}',
            instance: '/$uri',
          );
        }

        final params = toParams(request, keys);
        final json = ensure(raw, params);
        final missing = toMissingKeys(json, params);
        if (missing.isNotEmpty) {
          return Problems.badRequest(
            type: '${type.toLowerCase()}-data-invalid',
            title: '$type has invalid data',
            detail: '${missing.map((id) => '$type.$id')} '
                '${request.params.length == 1 ? 'is' : 'are'} missing',
            instance: '/$uri',
          );
        }
        final id = toIdFromParams(request, keys);
        final existing = await get(id);
        if (!existing.isPresent) {
          return Problems.notFound(
            type: '${type.toLowerCase()}-not-found',
            title: '$type not found',
            detail: '$type [$id] not found',
            instance: '/$uri',
          );
        }

        final item = fromJson(json);
        if (item == existing.value) {
          return Response.notModified(
            headers: {'Content-Type': 'application/json'},
          );
        }

        final result = await addOrUpdate(item);
        return Response.ok(
          jsonEncode(toJson(result.item)),
          headers: {'Content-Type': 'application/json'},
        );
      } catch (error, stackTrace) {
        log.shout(
          'PUT /$uri failed',
          error,
          stackTrace,
        );
        return Problems.internalServerError(
          type: '${type.toLowerCase()}-not-updated',
          title: '$type was not updated',
          detail: '$error',
          instance: '/$uri',
        );
      }
    };
  }

  @protected
  Function handleDelete(List<String> keys) {
    return (Request request) async {
      final uri = request.url.normalizePath();
      try {
        final id = toIdFromParams(request, keys);
        final item = await get(id);
        if (!item.isPresent) {
          return Problems.notFound(
            type: '${type.toLowerCase()}-not-found',
            title: '$type not found',
            detail: '$type [$id] not found',
            instance: '/$uri',
          );
        }
        final result = await remove(
          item.value,
        );
        return Response.ok(
          jsonEncode(result.item),
          headers: {'Content-Type': 'application/json'},
        );
      } catch (error, stackTrace) {
        log.shout(
          'PUT /$uri failed',
          error,
          stackTrace,
        );
        return Problems.internalServerError(
          type: '${type.toLowerCase()}-not-deleted',
          title: '$type was not deleted',
          detail: '$error',
          instance: '/$uri',
        );
      }
    };
  }
}

mixin BulkCRUDControllerMixin<I, T> on CRUDControllerMixin<I, T> {
  @override
  Future<BulkRepositoryResult<I, T>> updateAll(List<T> items) {
    throw UnimplementedError('$runtimeType does not implement updateAll()');
  }

  @override
  Future<BulkRepositoryResult<I, T>> removeAll(List<T> items) {
    throw UnimplementedError('$runtimeType does not implement updateAll()');
  }

  @protected
  Function handlePostAll([List<String> keys = const [], bool upsert = false]) {
    return (Request request) async {
      final uri = request.url.normalizePath();
      try {
        final body = await request.readAsString();
        final raw = jsonDecode(body);
        if (raw is! List) {
          return Problems.badRequest(
            type: 'request-body-invalid',
            title: 'Expected List<JsonObject>',
            detail: 'Received body of type ${raw.runtimeType}',
            instance: '/$uri',
          );
        }

        final items = <T>[];
        final params = toParams(request, keys);
        for (final it in raw) {
          final json = ensure(it, params);
          final missing = toMissingKeys(json, params);
          if (missing.isNotEmpty) {
            return Problems.badRequest(
              type: '${type.toLowerCase()}-data-invalid',
              title: '$type has invalid data',
              detail: '${items.length}: ${missing.map((id) => '$type.$id')} '
                  '${request.params.length <= 1 ? 'is' : 'are'} missing',
              instance: '/$uri',
            );
          }

          final id = toIdFromJson(json, params);
          final existing = await get(id);
          if (!upsert && existing.isPresent) {
            return Problems.forbidden(
              type: '${type.toLowerCase()}-exists',
              title: '$type exists',
              detail: '${items.length}: $type [$id] exists.',
              instance: '/$uri',
            );
          }

          final item = fromJson(json);
          if (!existing.isPresent ||
              existing.isPresent && item != existing.value) {
            items.add(item);
          }
        }

        if (items.isEmpty) {
          return Response.notModified(
            headers: {'Content-Type': 'application/json'},
          );
        }

        final result = await updateAll(items);
        return Response(
          result.updated.isEmpty ? 201 : 200,
          body: jsonEncode({
            'created': result.created.map(toJson).toList(),
            'updated': result.updated.map(toJson).toList(),
          }),
          headers: {'Content-Type': 'application/json'},
        );
      } catch (error, stackTrace) {
        log.shout(
          'POST /$uri failed',
          error,
          stackTrace,
        );
        return Problems.internalServerError(
          type: '${type.toLowerCase()}-not-created',
          title: '$type was not created',
          detail: '$error',
          instance: '/$uri',
        );
      }
    };
  }

  @protected
  Function handlePutAll([List<String> keys = const []]) {
    return (Request request) async {
      final uri = request.url.normalizePath();
      try {
        final body = await request.readAsString();
        final raw = jsonDecode(body);
        if (raw is! List) {
          return Problems.badRequest(
            type: 'request-data-invalid',
            title: 'Expected List<JsonObject>',
            detail: 'Received data of type ${raw.runtimeType}',
            instance: '/$uri',
          );
        }

        final items = <T>[];
        final params = toParams(request, keys);
        for (final it in raw) {
          final json = ensure(it, params);
          final missing = toMissingKeys(json, params);
          if (missing.isNotEmpty) {
            return Problems.badRequest(
              type: '${type.toLowerCase()}-data-invalid',
              title: '$type has invalid data',
              detail: '${items.length}: ${missing.map((id) => '$type.$id')} '
                  '${request.params.length == 1 ? 'is' : 'are'} missing',
              instance: '/$uri',
            );
          }

          final id = toIdFromJson(json, params);
          final existing = await get(id);
          if (!existing.isPresent) {
            return Problems.notFound(
              type: '${type.toLowerCase()}-not-found',
              title: '$type not found',
              detail: '${items.length}: $type [$id] not found',
              instance: '/$uri',
            );
          }

          final item = fromJson(json);
          if (item != existing.value) {
            items.add(item);
          }
        }

        if (items.isEmpty) {
          return Response.notModified(
            headers: {'Content-Type': 'application/json'},
          );
        }

        final result = await updateAll(items);
        if (result.isEmpty) {
          return Response.notModified(
            headers: {'Content-Type': 'application/json'},
          );
        }

        return Response(
          200,
          body: jsonEncode({
            'updated': result.updated.map(toJson).toList(),
          }),
          headers: {'Content-Type': 'application/json'},
        );
      } catch (error, stackTrace) {
        log.shout(
          'PUT /$uri failed',
          error,
          stackTrace,
        );
        return Problems.internalServerError(
          type: '${type.toLowerCase()}-not-updated',
          title: '$type was not updated',
          detail: '$error',
          instance: '/$uri',
        );
      }
    };
  }

  @protected
  Function handleDeleteAll([List<String> keys = const []]) {
    return (Request request) async {
      final uri = request.url.normalizePath();
      try {
        final body = await request.readAsString();
        final raw = jsonDecode(body);
        if (raw is! List) {
          return Problems.badRequest(
            type: 'request-data-invalid',
            title: 'Expected List<JsonObject>',
            detail: 'Received data of type ${raw.runtimeType}',
            instance: '/$uri',
          );
        }

        final items = <T>[];
        final params = toParams(request, keys);
        for (final it in raw) {
          final id = toIdFromJson(it, params);
          final item = await get(id);
          if (!item.isPresent) {
            return Problems.notFound(
              type: '${type.toLowerCase()}-not-found',
              title: '$type not found',
              detail: '${items.length}: $type [$id] not found',
              instance: '/$uri',
            );
          }
          items.add(item.value);
        }

        final result = await removeAll(items);
        return Response(
          200,
          body: jsonEncode({
            'removed': result.removed
                .map(toJson)
                .map((e) => toIdFromJson(e, params))
                .toList(),
          }),
          headers: {'Content-Type': 'application/json'},
        );
      } catch (error, stackTrace) {
        log.shout(
          'PUT /$uri failed',
          error,
          stackTrace,
        );
        return Problems.internalServerError(
          type: '${type.toLowerCase()}-not-deleted',
          title: '$type was not deleted',
          detail: '$error',
          instance: '/$uri',
        );
      }
    };
  }
}
