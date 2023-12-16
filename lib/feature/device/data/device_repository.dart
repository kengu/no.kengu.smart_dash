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

  Future<Optional<List<Device>>> getAll() async {
    return Optional.of(await _load());
  }

  Future<Optional<Device>> get(String id) async {
    final devices = await _load();
    return devices.isEmpty
        ? const Optional.empty()
        : devices.firstWhereOptional(
            (device) => device.id == id,
          );
  }

  Future<List<Device>> _load() => guard(() async {
        final prefs = await SharedPreferences.getInstance();
        final result = prefs.getStringList(DeviceRepository.key);
        return result
                ?.map(jsonDecode)
                .whereType<JsonObject>()
                .map(Device.fromJson)
                .toList() ??
            [];
      });

  /// Attempt to add all given devices to
  /// repository. Returns list of actual added devices.
  Future<List<Device>> addAll(Iterable<Device> devices) async {
    final current = await _load();
    final unique = devices.toSet().toList();
    unique.removeWhere(
      (device) => current.contains(device),
    );
    final success = await _setAll(unique);
    return success ? unique : [];
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
