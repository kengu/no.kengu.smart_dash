import 'dart:convert';

import 'package:logging/logging.dart';
import 'package:optional/optional.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:smart_dash_account/smart_dash_account_backend.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

class AccountController {
  AccountController(this.repo);

  final AccountRepositoryMixin repo;
  final Logger _logger = Logger('$AccountController');

  Router get router {
    final router = Router();

    router.get(
      '/account',
      (Request request) async {
        try {
          final query = Optional.ofNullable(request.url.queryParameters['ids']);
          final ids = query.isPresent ? query.value.split(',') : <String>[];
          final account = await repo.getAll(ids);
          return Response.ok(
            jsonEncode(
              account.map((e) => e.toJson()).toList(),
            ),
            headers: {
              'Content-Type': 'application/json',
            },
          );
        } catch (error, stackTrace) {
          _logger.shout(
            'GET /account failed',
            error,
            stackTrace,
          );
          return Problems.internalServerError(
            type: 'account-get-failed',
            title: 'Failed to get accounts',
            detail: 'Internal server error: $error',
            instance: '/account',
          );
        }
      },
    );

    router.get(
      '/account/<userId>',
      (Request request, String userId) async {
        try {
          final account = await repo.get(userId);
          if (!account.isPresent) {
            return Problems.notFound(
              type: 'account-not-found',
              title: 'Account not found',
              instance: '/account/$userId',
              detail: 'Account [$userId] not found. Use POST /account instead',
            );
          }
          return Response.ok(
            jsonEncode(
              account.value.toJson(),
            ),
            headers: {
              'Content-Type': 'application/json',
            },
          );
        } catch (error, stackTrace) {
          _logger.shout(
            'GET /account/$userId failed',
            error,
            stackTrace,
          );
          return Problems.internalServerError(
            type: 'account-get-failed',
            title: 'Failed to get account',
            detail: 'Internal server error: $error',
            instance: '/account/$userId',
          );
        }
      },
    );

    router.post('/account', (Request request) async {
      try {
        final payload = await request.readAsString();
        final json = jsonDecode(payload);
        final userId = Optional.ofNullable(json['userId'] as String?);
        if (!userId.isPresent) {
          return Problems.badRequest(
            type: 'account-data-invalid',
            title: 'Account has invalid data',
            detail: 'Account.userId is missing (string)',
            instance: '/account',
          );
        }
        final account = Account.fromJson(json);
        if (await repo.exists(account.userId)) {
          return Problems.forbidden(
            type: 'account-exists',
            title: 'Account exists',
            detail: 'Account [${account.userId}] exists. '
                'Use PUT /account/${account.userId} to update',
            instance: '/account',
          );
        }

        final result = await repo.addOrUpdate(account);
        return Response(
          201,
          body: jsonEncode(result.item.toJson()),
          headers: {
            'Content-Type': 'application/json',
          },
        );
      } catch (error, stackTrace) {
        _logger.shout(
          'POST /account failed',
          error,
          stackTrace,
        );
        return Problems.internalServerError(
          type: 'account-not-created',
          title: 'Account was not created',
          detail: 'Failed to create new account: $error',
          instance: '/account',
        );
      }
    });

    router.put('/account/<userId>', (Request request, String userId) async {
      try {
        final payload = await request.readAsString();
        final json = jsonDecode(payload);
        json['userId'] = userId; // Overwrite
        final account = Account.fromJson(json);
        if (!await repo.exists(userId)) {
          return Problems.notFound(
            type: 'account-not-found',
            title: 'Account not found',
            detail: 'Account [${account.userId}] not found. '
                'Use POST /account/${account.userId} to create an new account',
            instance: '/account/$userId',
          );
        }
        final result = await repo.addOrUpdate(account);
        return Response.ok(
          jsonEncode(
            result.item.toJson(),
          ),
          headers: {
            'Content-Type': 'application/json',
          },
        );
      } catch (error, stackTrace) {
        _logger.shout(
          'PUT /account failed',
          error,
          stackTrace,
        );
        return Problems.internalServerError(
          type: 'account-not-updated',
          title: 'Account was not updated',
          detail: 'Failed to update account: $error',
          instance: '/account/$userId',
        );
      }
    });

    router.delete('/account/<userId>', (Request request, String userId) async {
      try {
        final account = await repo.get(userId);
        if (!account.isPresent) {
          return Problems.notFound(
            type: 'account-not-found',
            title: 'Account not found',
            detail: 'Account [$userId] not found',
            instance: '/account/$userId',
          );
        }
        final result = await repo.remove(
          account.value,
        );
        return Response.ok(
          jsonEncode(result.item),
          headers: {
            'Content-Type': 'application/json',
          },
        );
      } catch (error, stackTrace) {
        _logger.shout(
          'PUT /account failed',
          error,
          stackTrace,
        );
        return Problems.internalServerError(
          type: 'account-not-updated',
          title: 'Account was not updated',
          detail: 'Failed to update account: $error',
          instance: '/account/$userId',
        );
      }
    });

    return router;
  }
}
