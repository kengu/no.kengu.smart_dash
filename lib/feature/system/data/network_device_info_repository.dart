import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_dash/feature/system/domain/network_info.dart';
import 'package:smart_dash/util/data/json.dart';
import 'package:smart_dash/util/guard.dart';

part 'network_device_info_repository.g.dart';

typedef NetworkDeviceInfoMap = Map<String, NetworkDeviceInfo>;

@Riverpod(keepAlive: true)
class NetworkDeviceInfoRepository extends _$NetworkDeviceInfoRepository {
  static const String key = 'network_devices';

  @override
  Future<NetworkDeviceInfoMap> build() => load();

  Optional<NetworkDeviceInfo> get(String hostId) =>
      Optional.ofNullable(state.valueOrNull?[hostId]);

  Future<Optional<NetworkDeviceInfo>> set(NetworkDeviceInfo device) async {
    if (!state.hasValue) {
      return const Optional.empty();
    }
    final current = state.value![device.hostId];
    final next = Map.of(state.value!);
    next[device.hostId] = device;
    await _setAll();
    state = AsyncValue.data(next);
    return Optional.ofNullable(current);
  }

  Future<NetworkDeviceInfoMap> load() async {
    final devices = await _load();
    state = AsyncValue.data(toMap(devices));
    return state.value!;
  }

  Future<List<NetworkDeviceInfo>> _load() => guard(() async {
        final prefs = await SharedPreferences.getInstance();
        final result = prefs.getStringList(NetworkDeviceInfoRepository.key);
        return result == null
            ? []
            : result
                .map(jsonDecode)
                .whereType<JsonObject>()
                .map(NetworkDeviceInfo.fromJson)
                .toList();
      });

  Future<bool> save([Iterable<NetworkDeviceInfo>? devices]) {
    state = AsyncValue.data(toMap(devices));
    return _setAll();
  }

  Future<bool> _setAll() => guard(
        () async {
          final prefs = await SharedPreferences.getInstance();
          return prefs.setStringList(
            NetworkDeviceInfoRepository.key,
            state.value!.values.map(jsonEncode).toList(),
          );
        },
      );

  @override
  bool updateShouldNotify(AsyncValue<NetworkDeviceInfoMap> previous,
      AsyncValue<NetworkDeviceInfoMap> next) {
    return !mapEquals(previous.value, next.value);
  }

  static NetworkDeviceInfoMap toMap(Iterable<NetworkDeviceInfo>? devices) {
    return {for (final e in devices ?? <NetworkDeviceInfo>[]) e.hostId: e};
  }
}
