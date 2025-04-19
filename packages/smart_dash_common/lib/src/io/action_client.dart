import 'dart:async';

import 'package:dio/dio.dart';
import 'package:sentry/sentry.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

enum ClientAction {
  /// Query for items. Mapped to HTTP GET method.
  query,

  /// Create unique item. Mapped to HTTP POST method.
  create,

  /// Insert unique, replace existing. Mapped to HTTP PUT method.
  upsert,

  /// Update existing item. Mapped to HTTP PATCH method.
  update,

  /// Remove existing item. Mapped to HTTP DELETE method.
  remove;

  static List<ClientAction> get commands => [
        create,
        update,
        upsert,
        remove,
      ];

  bool get isQuery => this == query;
  bool get isCreate => this == create;
  bool get isUpdate => this == update;
  bool get isUpsert => this == upsert;
  bool get isRemove => this == remove;
  bool get isCommand => commands.contains(this);

  String toMethod() {
    return switch (this) {
      ClientAction.query => 'GET',
      ClientAction.create => 'POST',
      ClientAction.upsert => 'PUT',
      ClientAction.update => 'PATCH',
      ClientAction.remove => 'DELETE',
    };
  }
}

abstract class ActionClient<I, T> extends DioClient
    with ActionClientMixin<I, T> {
  ActionClient(super.api);
}

mixin ActionClientMixin<I, T> on DioClient {
  String get suffix;
  String get query;
  String get prefix;

  I toId(T item);

  String buildQuery(Iterable<I> ids) {
    return '$query=${ids.join(',')}';
  }

  String buildPath(ClientAction action, [List<I> ids = const []]) {
    if (action == ClientAction.create) {
      return '$prefix/$suffix';
    }
    return switch (ids.length) {
      0 => '$prefix/$suffix',
      1 => '$prefix/$suffix/${ids.first}',
      _ => '$prefix/$suffix?${buildQuery(ids)}'
    };
  }

  bool validateStatus(ClientAction action, int? status, String path) {
    final success = status != null && status < 400;
    if (!success) {
      log.warning(
        '${action.toMethod()} '
        'request failed: [$status] $path',
      );
    }
    return success;
  }

  GuardError<R> handleError<R>(
    ClientAction action,
    String path,
    Object error, [
    StackTrace? stackTrace,
  ]) {
    final checked = checkDioError<R>(error, stackTrace, false);
    if (checked.fatal) {
      final status = error is DioException
          ? '[${error.response?.statusCode ?? 'Unknown'}]'
          : '[Unknown]';
      String message = '${action.toMethod()} '
          'request FAILED: '
          '$status $path';
      log.severe('$message: $error');
      unawaited(
        Sentry.captureMessage('$message: $error'),
      );
    }
    return checked;
  }
}
