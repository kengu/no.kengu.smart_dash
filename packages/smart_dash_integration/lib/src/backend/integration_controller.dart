import 'dart:convert';

import 'package:logging/logging.dart';
import 'package:optional/optional.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

class IntegrationController {
  IntegrationController(this.ref);

  final ProviderContainer ref;
  final Logger _logger = Logger('$IntegrationController');

  IntegrationManager get manager => ref.read(integrationManagerProvider);

  Router get router => Router()
    ..get(
      '/integration',
      (Request request) async {
        try {
          final query = Optional.ofNullable(
            request.url.queryParameters['types'],
          );
          final types = query.isPresent
              ? query.value.split(',').map((e) => e.toLowerCase())
              : <String>[];
          final result = manager.where(
            (e) => types.contains(e.type.name.toLowerCase()),
          );
          return Response.ok(
            jsonEncode(
              result.values.map((e) => e.toJson()).toList(),
            ),
            headers: {
              'Content-Type': 'application/json',
            },
          );
        } catch (error, stackTrace) {
          _logger.shout(
            'GET /integration failed',
            error,
            stackTrace,
          );
          return Problems.internalServerError(
            type: 'integrations-get-failed',
            title: 'Failed to get integrations',
            detail: 'Internal server error: $error',
            instance: '/integration',
          );
        }
      },
    )
    ..get(
      '/integration/<type>',
      (Request request, String type) async {
        try {
          final result = manager.get(type);
          if (!result.isPresent) {
            return Problems.notFound(
              type: 'integration-not-found',
              title: 'Integration not found',
              instance: '/integration/$type',
              detail: 'Integration [$type] not found. '
                  'Use POST /integration instead',
            );
          }
          return Response.ok(
            jsonEncode(
              result.value.toJson(),
            ),
            headers: {
              'Content-Type': 'application/json',
            },
          );
        } catch (error, stackTrace) {
          _logger.shout(
            'GET /integration/$type failed',
            error,
            stackTrace,
          );
          return Problems.internalServerError(
            type: 'integration-get-failed',
            title: 'Failed to get integration',
            detail: 'Internal server error: $error',
            instance: '/integration/$type',
          );
        }
      },
    );
}
