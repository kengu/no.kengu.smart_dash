import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:optional/optional.dart';
import 'package:problem_details/problem_details.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

mixin CommandControllerBulkMixin<I, T, R>
    implements QueryControllerMixin<I, T> {
  /// Transform [response] a bulk result to [JsonObject]
  JsonObject toBulkResult(R result);

  /// Override this method to implement schema validation
  Future<Optional<ProblemDetails>> validateSchema(
      ClientAction action, Uri uri, T item) async {
    return const Optional.empty();
  }

  /// Implements [ClientAction.create]
  /// on [items] by insert unique only
  Future<R> createAll(List<T> items) {
    throw UnimplementedError('$runtimeType does not implement createAll()');
  }

  /// Implements [ClientAction.upsert]
  /// on [items] by insert unique, replace existing
  Future<R> upsertAll(List<T> items) {
    throw UnimplementedError('$runtimeType does not implement upsertAll()');
  }

  /// Implements [ClientAction.update]
  /// on [items] by updating existing only
  Future<R> updateAll(List<T> items) {
    throw UnimplementedError('$runtimeType does not implement updateAll()');
  }

  /// Implements [ClientAction.remove]
  /// on [items] by removing existing only
  Future<R> removeAll(List<T> items) {
    throw UnimplementedError('$runtimeType does not implement updateAll()');
  }

  /// Handles [ClientAction.create]
  /// request with [JsonObject] list in body
  /// by inserting unique only
  @protected
  Function handleCreateAll([List<String> keys = const []]) {
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
        final found = <I>[];
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
          final current = await get(id);
          if (current.isPresent) {
            found.add(id);
          } else {
            final item = fromJson(json);
            final problem = await validateSchema(
              ClientAction.create,
              uri,
              item,
            );
            if (problem.isPresent) {
              return Response.badRequest(
                body: jsonEncode(problem.value.toJson()),
                headers: {'content-type': 'application/problem+json'},
              );
            }
            items.add(item);
          }
        }

        if (found.isNotEmpty) {
          return _toExistingFound(found, uri);
        }

        if (items.isEmpty) {
          return Response.notModified(
            headers: {'Content-Type': 'application/json'},
          );
        }

        final result = await createAll(items);
        return Response(
          201,
          body: jsonEncode(
            toBulkResult(result),
          ),
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

  /// Handles [ClientAction.upsert]
  /// request with [JsonObject] list in body
  /// by insert unique, replace existing
  @protected
  Function handleUpsertAll([List<String> keys = const []]) {
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

          final item = fromJson(json);
          final problem = await validateSchema(
            ClientAction.upsert,
            uri,
            item,
          );
          if (problem.isPresent) {
            return Response.badRequest(
              body: jsonEncode(problem.value.toJson()),
              headers: {'content-type': 'application/problem+json'},
            );
          }

          final id = toIdFromJson(json, params);
          final existing = await get(id);
          if (!existing.isPresent || item != existing.value) {
            items.add(item);
          }
        }

        if (items.isEmpty) {
          return Response.notModified(
            headers: {'Content-Type': 'application/json'},
          );
        }

        final result = await upsertAll(items);
        return Response(
          200,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(
            toBulkResult(result),
          ),
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

  /// Handles [ClientAction.update]
  /// request with [JsonObject] list in body
  /// by updating existing only
  @protected
  Function handleUpdateAll([List<String> keys = const []]) {
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
        final notFound = <I>[];
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

          final item = fromJson(json);
          final id = toIdFromJson(json, params);
          final existing = await get(id);
          if (existing.isPresent) {
            final problem = await validateSchema(
              ClientAction.update,
              uri,
              item,
            );

            if (problem.isPresent) {
              return Response.badRequest(
                body: jsonEncode(problem.value.toJson()),
                headers: {'content-type': 'application/problem+json'},
              );
            }

            if (item != existing.value) {
              items.add(item);
            }
          } else {
            notFound.add(id);
          }
        }

        if (notFound.isNotEmpty) {
          return _toNotFound(notFound, uri);
        }

        if (items.isEmpty) {
          return Response.notModified(
            headers: {'Content-Type': 'application/json'},
          );
        }

        final result = await updateAll(items);

        return Response(
          200,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(
            toBulkResult(result),
          ),
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
  Function handleRemoveAll([List<String> keys = const []]) {
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
        final notFound = <I>[];
        final params = toParams(request, keys);
        for (final it in raw) {
          final json = ensure(it, params);
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
          final id = toIdFromJson(it, params);
          final item = await get(id);
          if (item.isPresent) {
            items.add(item.value);
          } else {
            notFound.add(id);
          }
        }

        if (notFound.isNotEmpty) {
          return _toNotFound(notFound, uri);
        }

        final result = await removeAll(items);
        return Response(
          200,
          body: jsonEncode(
            toBulkResult(result),
          ),
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

  Response _toExistingFound(List<I> notFound, Uri uri) {
    final details = <String>[];
    for (int i = 0; i < notFound.length - 1; i++) {
      details.add('$i: $type [${notFound[i]}] not found');
    }
    return Problems.forbidden(
      type: '${type.toLowerCase()}-exists',
      title: '$type exists',
      detail: '[${details.join(',')}]',
      instance: '/$uri',
    );
  }

  Response _toNotFound(List<I> notFound, Uri uri) {
    final details = <String>[];
    for (int i = 0; i < notFound.length - 1; i++) {
      details.add('$i: $type [${notFound[i]}] not found');
    }
    return Problems.notFound(
      type: '${type.toLowerCase()}-not-found',
      title: '$type not found',
      detail: '[${details.join(',')}]',
      instance: '/$uri',
    );
  }
}
