import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/notification/domain/notification.dart';
import 'package:smart_dash/util/guard.dart';
import 'package:smart_dash/util/hive.dart';

part 'notification_repository.g.dart';

const _typeId = 4;

class NotificationRepository {
  NotificationRepository() {
    if (!Hive.isAdapterRegistered(_typeId)) {
      Hive.registerAdapter(NotificationAdapter());
    }
  }

  static const key = 'notifications';

  Future<List<NotificationModel>> getAll() {
    return _load();
  }

  Future<List<NotificationModel>> where(
      bool Function(NotificationModel element) test) async {
    return (await _load()).where(test).toList();
  }

  Future<Optional<NotificationModel>> get(int id) async {
    final notifications = await _load();
    return notifications.isEmpty
        ? const Optional.empty()
        : notifications.firstWhereOptional(
            (e) => e.id == id,
          );
  }

  /// Attempt to sett all given notifications to
  /// repository. Returns list of actual updated notifications.
  Future<List<NotificationModel>> updateAll(
      Iterable<NotificationModel> notifications) async {
    final unique = notifications.toSet();
    final success = await _putAll([...unique]);
    return [if (success) ...unique];
  }

  /// Attempt to acknowledge all given notifications from
  /// repository. Returns list of actual acked notifications.
  Future<List<NotificationModel>> ackAll(Iterable<int> ids) async {
    final current = await _load();
    final acked = current.where((e) => ids.contains(e.id)).map(
          (e) => e.copyWith(isAcked: true, when: DateTime.now()),
        );
    final success = await _putAll(acked);
    return [if (success) ...acked];
  }

  /// Attempt to remove all given notifications from
  /// repository. Returns list of actual removed notifications.
  Future<List<NotificationModel>> removeAll(Iterable<int> ids) async {
    final current = await _load();
    final unique = current.where((e) => ids.contains(e.id));
    final success = await _removeAll(ids.toSet());
    return [if (success) ...unique];
  }

  Future<CollectionBox<T>> _open<T>(String name) async {
    final db = await openCollection(
      key,
      {'registered'},
    );
    return db.openBox<T>(name);
  }

  Future<List<NotificationModel>> _load() => guard(
        () async {
          final box = await _open<NotificationModel>('registered');
          final result = await box.getAll(await box.getAllKeys());
          return result.whereType<NotificationModel>().toList();
        },
        task: '_load',
        name: '$NotificationRepository',
      );

  Future<bool> _removeAll(Iterable<int> ids) => guard(
        () async {
          final box = await _open<NotificationModel>('registered');
          await box.deleteAll(
            ids.map((e) => e.toString()).toList(),
          );
          return true;
        },
        task: '_removeAll',
        name: '$NotificationRepository',
      );

  Future<bool> _putAll(Iterable<NotificationModel> notifications) => guard(
        () async {
          final box = await _open<NotificationModel>('registered');
          for (final block in notifications) {
            await box.put(block.id.toString(), block);
          }
          return true;
        },
        task: '_putAll',
        name: '$NotificationRepository',
      );

  Future<void> clear() async {
    return guard(
      () => Hive.deleteBoxFromDisk(
        '${key}_registered',
      ),
      task: 'clear',
      name: '$NotificationRepository',
    );
  }
}

@Riverpod(keepAlive: true)
NotificationRepository notificationRepository(NotificationRepositoryRef ref) {
  return NotificationRepository();
}

class NotificationAdapter extends TypeAdapter<NotificationModel> {
  @override
  final typeId = _typeId;

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
