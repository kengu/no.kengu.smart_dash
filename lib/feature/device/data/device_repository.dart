import 'dart:convert';

import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/util/guard.dart';
import 'package:smart_dash/util/data/json.dart';

part 'device_repository.g.dart';

class DeviceRepository {
  static const key = 'devices';

  Future<List<Device>> getAll() async {
    return await _load();
  }

  Future<Optional<Device>> get(Identity id) async {
    final devices = await _load();
    return devices.isEmpty
        ? const Optional.empty()
        : devices.firstWhereOptional(
            (device) => Identity.of(device) == id,
          );
  }

  Future<List<Device>> _load() => guard(() async {
        final prefs = await SharedPreferences.getInstance();
        final result = prefs.getStringList(DeviceRepository.key);
        return result
                ?.map(jsonDecode)
                .whereType<JsonObject>()
                .map(Device.fromJson)
                // Remove duplicates just in case (
                .toSet()
                .toList() ??
            [];
      });

  /// Attempt to sett all given devices to
  /// repository. Returns list of actual added devices.
  Future<List<Device>> updateAll(Iterable<Device> devices) async {
    final current = await _load();
    final unique = devices.toSet();
    final currentIds = current.map((e) => Identity.of(e));
    final removedIds = unique
        .where((e) => currentIds.contains(Identity.of(e)))
        .map((e) => Identity.of(e));
    current.removeWhere(
      (e) => removedIds.contains(Identity.of(e)),
    );
    final success = await _setAll([...unique, ...current]);
    return [if (success) ...unique];
  }

  /// Attempt to remove all given devices from
  /// repository. Returns list of actual removed devices.
  Future<List<Device>> removeAll(Iterable<Device> devices) async {
    final current = await _load();
    final unique = devices.toSet();
    final currentIds = current.map((e) => Identity.of(e));
    final removedIds = unique
        .where((e) => currentIds.contains(Identity.of(e)))
        .map((e) => Identity.of(e));
    current.removeWhere(
      (e) => removedIds.contains(Identity.of(e)),
    );
    final success = await _setAll(current);
    return [if (success) ...unique];
  }

  Future<bool> _setAll(List<Device> devices) => guard(() async {
        final prefs = await SharedPreferences.getInstance();
        return prefs.setStringList(
          DeviceRepository.key,
          devices.map(jsonEncode).toList(),
        );
      });
}

@Riverpod(keepAlive: true)
DeviceRepository deviceRepository(DeviceRepositoryRef ref) {
  return DeviceRepository();
}
