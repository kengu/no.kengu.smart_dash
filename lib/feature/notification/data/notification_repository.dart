import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/notification/domain/notification.dart';
import 'package:smart_dash/core/data/hive.dart';

part 'notification_repository.g.dart';

class NotificationRepository extends HiveRepository<int, NotificationModel> {
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
    return updateAll(acked);
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
