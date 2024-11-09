import 'dart:convert';

import 'package:logging/logging.dart';
import 'package:nanoid/nanoid.dart';
import 'package:optional/optional.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:smart_dash_account/smart_dash_account.dart';
import 'package:smart_dash_account/src/account/data/account_repository.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

class AccountController {
  AccountController(this._repo);

  final AccountRepositoryMixin _repo;
  final Logger _logger = Logger('$AccountController');

  Router get router {
    final router = Router();

    router.get(
      '/account',
      (Request request) async {
        try {
          final account = await _repo.getAll();
          return Response.ok(
            account.map((e) => e.toJson()),
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
            instance: '/account',
            detail: 'Internal server error: $error',
          );
        }
      },
    );

    router.get(
      '/account/<userId>',
      (Request request, String userId) async {
        try {
          final account = await _repo.get(userId);
          if (!account.isPresent) {
            return Problems.notFound(
              type: 'account-not-found',
              title: 'Account not found',
              instance: '/account/$userId',
              detail: 'You need to create an account with POST /account',
            );
          }
          return Response.ok(
            account.value.toJson(),
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
            instance: '/account/$userId',
            detail: 'Internal server error: $error',
          );
        }
      },
    );

    router.post('/account', (Request request) async {
      try {
        final payload = await request.readAsString();
        final json = jsonDecode(payload);
        final userId = json['userId'] = nanoid();
        final account = Account.fromJson(json);
        final result = await _repo.addOrUpdate(account);
        return Response(
          201,
          body: {
            'message': 'Account created for userid: $userId',
            'account': result.toJson(),
          },
          headers: {
            'Content-Type': 'application/json',
          },
        );
      } catch (error, stackTrace) {
        _logger.shout(
          'POST /account [$request] failed',
          error,
          stackTrace,
        );
        return Problems.internalServerError(
          type: 'account-not-created',
          title: 'Account was not created',
          instance: '/account',
          detail: 'Failed to create new account: $error',
        );
      }
    });

    router.put('/account/<userId>', (Request request, String userId) async {
      try {
        final payload = await request.readAsString();
        final json = jsonDecode(payload);
        final userId = Optional.ofNullable(json['userId'] as String?);
        if (userId.isPresent) {
          final account = Account.fromJson(json);
          final existing = await _repo.get(userId.value);
          if (!existing.isPresent) {
            return Problems.notFound(
              type: 'account-not-found',
              title: 'Account not found',
              instance: '/account/$userId',
              detail: 'You need to create an account with POST /account',
            );
          }
          final result = await _repo.addOrUpdate(account);
          return Response.ok(result.toJson(), headers: {
            'Content-Type': 'application/json',
          });
        }
        return Problems.notFound(
          type: 'account-not-found',
          title: 'Account not found',
          instance: '/account/$userId',
          detail: 'You need to create an account with POST /account',
        );
      } catch (error, stackTrace) {
        _logger.shout(
          'PUT /account [$request] failed',
          error,
          stackTrace,
        );
        return Problems.internalServerError(
          type: 'account-not-updated',
          title: 'Account was not updated',
          instance: '/account/$userId',
          detail: 'Failed to update account: $error',
        );
      }
    });

    return router;
  }
}
