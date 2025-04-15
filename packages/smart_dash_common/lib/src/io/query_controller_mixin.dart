import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:optional/optional.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

mixin QueryControllerMixin<I, T> {
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
  Future<List<T>> where(Map<String, List<String>> query);

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
}
