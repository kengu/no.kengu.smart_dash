import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_datasource/smart_dash_datasource.dart';
import 'package:smart_dash_notification/smart_dash_notification.dart';

part 'notification_repository.g.dart';

class NotificationRepository
    extends BulkHiveRepository<int, NotificationModel> {
  NotificationRepository()
      : super(
          key: 'notifications',
          box: 'registered',
          adapter: NotificationAdapter(),
        );

  @override
  String toKey(int id) => id.toString();

  @override
  int toId(NotificationModel item) => item.id;

  /// Attempt to acknowledge all given notifications from
  /// repository. Returns list of actual acked notifications.
  Future<List<NotificationModel>> ackAll(Iterable<int> ids) async {
    final current = await getAll(ids.toList());
    final acked = current.where((e) => ids.contains(e.id)).map(
          (e) => e.copyWith(isAcked: true, when: DateTime.now()),
        );
    final result = await updateAll(acked);
    return result.all;
  }
}

@Riverpod(keepAlive: true)
NotificationRepository notificationRepository(NotificationRepositoryRef ref) {
  return NotificationRepository();
}

class NotificationAdapter extends TypedAdapter<NotificationModel> {
  NotificationAdapter() : super(HiveTypeId.notification);

  @override
  NotificationModel read(BinaryReader reader) {
    return NotificationModel.fromJson(jsonDecode(
      reader.read(),
    ));
  }

  @override
  void write(BinaryWriter writer, NotificationModel obj) {
    writer.write(jsonEncode(
      obj.toJson(),
    ));
  }
}
