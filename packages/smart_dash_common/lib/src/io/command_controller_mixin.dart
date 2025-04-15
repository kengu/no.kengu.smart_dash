import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:optional/optional.dart';
import 'package:problem_details/problem_details.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

mixin CommandControllerMixin<I, T, R> implements QueryControllerMixin<I, T> {
  /// Transform [response] a single result to [JsonObject]
  JsonObject toSingleResult(R result);

  /// Override this method to implement schema validation
  Future<Optional<ProblemDetails>> validateSchema(
      ClientAction action, Uri uri, T item) async {
    return const Optional.empty();
  }

  /// Override to implement [ClientAction.create]
  /// by insert unique only
  Future<R> create(T item) {
    throw UnimplementedError('$runtimeType does not implement create()');
  }

  /// Override to implement [ClientAction.upsert]
  /// by insert unique, replace existing
  Future<R> upsert(T item) {
    throw UnimplementedError('$runtimeType does not implement upsert()');
  }

  /// Override to implement [ClientAction.update]
  /// by updating existing only
  Future<R> update(T item) {
    throw UnimplementedError('$runtimeType does not implement update()');
  }

  /// Override to implement [ClientAction.remove]
  /// by removing existing only
  Future<R> remove(T item) {
    throw UnimplementedError('$runtimeType does not implement remove()');
  }

  /// Handles [ClientAction.create]
  /// request with [JsonObject] body
  /// by inserting unique only
  @protected
  Function handleCreate(List<String> keys) {
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

        final problem = await validateSchema(ClientAction.create, uri, item);
        if (problem.isPresent) {
          return Response.badRequest(
            body: jsonEncode(problem.value.toJson()),
            headers: {'content-type': 'application/problem+json'},
          );
        }

        final result = await create(item);
        return Response(
          201,
          body: jsonEncode(
            toSingleResult(result),
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
  /// request with [JsonObject] body
  /// by insert unique, replace existing
  @protected
  Function handleUpsert(List<String> keys) {
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
        final item = fromJson(json);
        final problem = await validateSchema(ClientAction.upsert, uri, item);
        if (problem.isPresent) {
          return Response.badRequest(
            body: jsonEncode(problem.value.toJson()),
            headers: {'content-type': 'application/problem+json'},
          );
        }

        final id = toIdFromParams(request, keys);
        final existing = await get(id);

        // No change?
        if (existing.isPresent && item == existing.value) {
          return Response.notModified(
            headers: {'Content-Type': 'application/json'},
          );
        }

        // Insert if not found
        final result = await upsert(item);
        return Response.ok(
          jsonEncode(
            toSingleResult(result),
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
          type: '${type.toLowerCase()}-not-updated',
          title: '$type was not updated',
          detail: '$error',
          instance: '/$uri',
        );
      }
    };
  }

  /// Handles [ClientAction.update]
  /// request with [JsonObject] body
  /// by updating existing only
  @protected
  Function handleUpdate(List<String> keys) {
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

        final problem = await validateSchema(ClientAction.update, uri, item);
        if (problem.isPresent) {
          return Response.badRequest(
            body: jsonEncode(problem.value.toJson()),
            headers: {'content-type': 'application/problem+json'},
          );
        }

        final result = await update(item);
        return Response.ok(
          jsonEncode(
            toSingleResult(result),
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
          type: '${type.toLowerCase()}-not-updated',
          title: '$type was not updated',
          detail: '$error',
          instance: '/$uri',
        );
      }
    };
  }

  /// Handles [ClientAction.remove]
  /// request with [JsonObject] body
  /// by removing existing only
  @protected
  Function handleRemove(List<String> keys) {
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
          jsonEncode(
            toSingleResult(result),
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
}
