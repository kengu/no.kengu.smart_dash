import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/util/guard.dart';
import 'package:smart_dash/util/security.dart';

part 'device_repository.g.dart';

const _typeId = 1;

class DeviceRepository {
  DeviceRepository() {
    if (!Hive.isAdapterRegistered(_typeId)) {
      Hive.registerAdapter(DeviceAdapter());
    }
  }

  static const key = 'devices';

  Future<List<Device>> getAll() async {
    return await _load();
  }

  Future<List<Device>> where(bool Function(Device element) test) async {
    return (await _load()).where(test).toList();
  }

  Future<Optional<Device>> get(Identity id) async {
    final devices = await _load();
    return devices.isEmpty
        ? const Optional.empty()
        : devices.firstWhereOptional(
            (device) => Identity.of(device) == id,
          );
  }

  /// Attempt to sett all given devices to
  /// repository. Returns list of actual added devices.
  Future<List<Device>> updateAll(Iterable<Device> devices) async {
    final current = await _load();
    final unique = devices.toSet();
    final currentIds = current.map(Identity.of);
    final removedIds = unique
        .where((e) => currentIds.contains(Identity.of(e)))
        .map(Identity.of);
    current.removeWhere(
      (e) => removedIds.contains(Identity.of(e)),
    );
    final success = await _putAll([...unique, ...current]);
    return [if (success) ...unique];
  }

  /// Attempt to remove all given devices from
  /// repository. Returns list of actual removed devices.
  Future<List<Device>> removeAll(Iterable<Device> devices) async {
    final current = await _load();
    final currentIds = current.map(Identity.of).toList();
    final unique = devices
      ..toSet().where((e) => currentIds.contains(Identity.of(e)));
    final success = await _removeAll(unique);
    return [if (success) ...unique];
  }

  Future<CollectionBox<T>> _open<T>(String name) async {
    final db = await BoxCollection.open(
      key,
      {'paired'},
      path: './',
      key: await getHiveCipher(key),
    );
    return db.openBox<T>(name);
  }

  Future<List<Device>> _load() => guard(
        () async {
          final box = await _open<Device>('paired');
          final result = await box.getAll(await box.getAllKeys());
          return result.whereType<Device>().toList();
        },
        task: '_load',
        name: '$DeviceRepository',
      );

  Future<bool> _removeAll(Iterable<Device> devices) => guard(
        () async {
          final box = await _open<Device>('paired');
          final ids = devices.map(Identity.of).map((e) => e.id).toList();
          await box.deleteAll(ids);
          return true;
        },
        task: '_removeAll',
        name: '$DeviceRepository',
      );

  Future<bool> _putAll(List<Device> devices) => guard(
        () async {
          final box = await _open<Device>('paired');
          for (final device in devices) {
            await box.put(
              Identity.of(device).id,
              device,
            );
          }
          return true;
        },
        task: '_putAll',
        name: '$DeviceRepository',
      );

  Future<void> clear() async {
    return guard(
      () => Hive.deleteBoxFromDisk(
        'devices_paired',
      ),
      task: 'clear',
      name: '$DeviceRepository',
    );
  }
}

@Riverpod(keepAlive: true)
DeviceRepository deviceRepository(DeviceRepositoryRef ref) {
  return DeviceRepository();
}

class DeviceAdapter extends TypeAdapter<Device> {
  @override
  final typeId = _typeId;

  @override
  Device read(BinaryReader reader) {
    return Device.fromJson(jsonDecode(
      reader.read(),
    ));
  }

  @override
  void write(BinaryWriter writer, Device obj) {
    writer.write(jsonEncode(
      obj.toJson(),
    ));
  }
}
