import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:optional/optional.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_datasource/smart_dash_datasource.dart';
import 'package:strings/strings.dart';

abstract class RepositoryController<I, T, R extends Repository<I, T>> {
  RepositoryController(this.ref);

  final ProviderContainer ref;

  R get repo;
  Router get router;
  Logger get log => Logger('$runtimeType');

  I toId(String value);
  JsonObject toJson(T item);
  T fromJson(JsonObject json);

  @protected
  Function handleDelete(String prefix, String param) {
    return (Request request) async {
      final key = request.params[param]!;
      try {
        final integration = await repo.get(toId(key));
        if (!integration.isPresent) {
          return Problems.notFound(
            type: '$prefix-not-found',
            title: '${prefix.toCapitalised()} not found',
            detail: '${prefix.toCapitalised()} [$key] not found',
            instance: '/$prefix/$key',
          );
        }
        final result = await repo.remove(
          integration.value,
        );
        return Response.ok(
          jsonEncode(result.item),
          headers: {
            'Content-Type': 'application/json',
          },
        );
      } catch (error, stackTrace) {
        log.shout(
          'PUT /$prefix failed',
          error,
          stackTrace,
        );
        return Problems.internalServerError(
          type: '$prefix-not-updated',
          title: '${prefix.toCapitalised()} was not updated',
          detail: 'Failed to update $prefix: $error',
          instance: '/$prefix/$key',
        );
      }
    };
  }

  @protected
  Function handlePut(String prefix, String param) {
    return (Request request) async {
      final key = request.params[param]!;
      try {
        final payload = await request.readAsString();
        final json = jsonDecode(payload);
        json[param] = key; // Overwrite
        final item = fromJson(json);
        if (!await repo.exists(toId(key))) {
          return Problems.notFound(
            type: '$prefix-not-found',
            title: '${prefix.toCapitalised()} not found',
            detail: '${prefix.toCapitalised()} [$key] not found. '
                'Use POST /$prefix/$key to create an new $prefix',
            instance: '/$prefix/$key',
          );
        }
        final result = await repo.addOrUpdate(item);
        return Response.ok(
          jsonEncode(
            toJson(result.item),
          ),
          headers: {
            'Content-Type': 'application/json',
          },
        );
      } catch (error, stackTrace) {
        log.shout(
          'PUT /$prefix failed',
          error,
          stackTrace,
        );
        return Problems.internalServerError(
          type: '$prefix-not-updated',
          title: '${prefix.toCapitalised()} was not updated',
          detail: 'Failed to update $prefix: $error',
          instance: '/$prefix/$key',
        );
      }
    };
  }

  @protected
  Function handlePost(String prefix, String id) {
    return (Request request) async {
      try {
        final payload = await request.readAsString();
        final json = jsonDecode(payload);
        final key = Optional.ofNullable(json[id] as String?);
        if (!key.isPresent) {
          return Problems.badRequest(
            type: '$prefix-data-invalid',
            title: '${prefix.toCapitalised()} has invalid data',
            detail: '${prefix.toCapitalised()}.$id is missing (string)',
            instance: '/$prefix',
          );
        }
        final item = fromJson(json);
        if (await repo.exists(toId(key.value))) {
          return Problems.forbidden(
            type: '$prefix-exists',
            title: '${prefix.toCapitalised()} exists',
            detail: '$prefix [${key.value}] exists. '
                'Use PUT /$prefix/${key.value} to update',
            instance: '/$prefix',
          );
        }

        final result = await repo.addOrUpdate(item);
        return Response(
          201,
          body: jsonEncode(toJson(result.item)),
          headers: {
            'Content-Type': 'application/json',
          },
        );
      } catch (error, stackTrace) {
        log.shout(
          'POST /$prefix failed',
          error,
          stackTrace,
        );
        return Problems.internalServerError(
          type: '$prefix-not-created',
          title: '${prefix.toCapitalised()} was not created',
          detail: 'Failed to create new $prefix: $error',
          instance: '/$prefix',
        );
      }
    };
  }

  @protected
  Function handleGet(String prefix, String param) {
    return (Request request) async {
      final key = request.params[param]!;
      try {
        final result = await repo.get(toId(key));
        if (!result.isPresent) {
          return Problems.notFound(
            type: '$prefix-not-found',
            title: '${prefix.toCapitalised()} not found',
            instance: '/$prefix/$key',
            detail: '${prefix.toCapitalised()} [$key] not found.',
          );
        }
        return Response.ok(
          jsonEncode(
            toJson(result.value),
          ),
          headers: {
            'Content-Type': 'application/json',
          },
        );
      } catch (error, stackTrace) {
        log.shout(
          'GET /$prefix/$key failed',
          error,
          stackTrace,
        );
        return Problems.internalServerError(
          type: '$prefix-get-failed',
          title: 'Failed to get $prefix',
          detail: 'Internal server error: $error',
          instance: '/$prefix/$key',
        );
      }
    };
  }

  @protected
  Handler handleGetAll(String prefix, String queryParam) {
    return (Request request) async {
      try {
        final query = Optional.ofNullable(
          request.url.queryParameters[queryParam],
        );
        final ids = query.isPresent ? query.value.split(',').map(toId) : <I>[];
        final items = await repo.getAll(ids.toList());
        return Response.ok(
          jsonEncode(
            items.map(toJson).toList(),
          ),
          headers: {
            'Content-Type': 'application/json',
          },
        );
      } catch (error, stackTrace) {
        log.shout(
          'GET /$prefix failed',
          error,
          stackTrace,
        );
        return Problems.internalServerError(
          type: '${prefix}s-get-failed',
          title: 'Failed to get ${prefix}s',
          detail: 'Internal server error: $error',
          instance: '/$prefix',
        );
      }
    };
  }
}
