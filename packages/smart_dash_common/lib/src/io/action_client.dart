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

mixin ActionClientMixin<I, T> on DioClient {
  String get type;
  String get query;
  String get prefix;

  I toId(T item);

  String buildQuery(Iterable<I> ids) {
    return '$query=${ids.join(',')}';
  }

  String buildPath(ClientAction action, [List<I> ids = const []]) {
    if (action == ClientAction.create) {
      return '$prefix/$type';
    }
    return switch (ids.length) {
      0 => '$prefix/$type',
      1 => '$prefix/$type/${ids.first}',
      _ => '$prefix/$type?${buildQuery(ids)}'
    };
  }

  bool validateStatus(ClientAction action, int? status, String path) {
    final success = status != null && status < 400;
    if (!success) {
      log.warning(
        '${ClientAction.query.toMethod()} '
        'request failed: [$status] $path',
      );
    }
    return success;
  }
}
