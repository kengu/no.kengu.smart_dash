import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_app/feature/setting/application/setting_service.dart';
import 'package:smart_dash_app/feature/setting/domain/setting.dart';
import 'package:smart_dash_app/feature/system/domain/system_health.dart';
import 'package:smart_dash_device/smart_dash_device.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

part 'system_health_service.g.dart';

class SystemHealthService {
  SystemHealthService(this.ref) {
    ref.onDispose(() {
      _controller.close();
    });
  }

  final Ref ref;

  final _states = <String, SystemHealthState>{};

  final _log = Logger('$SystemHealthService');

  final _controller = StreamController<SystemHealthState>.broadcast();

  Stream<SystemHealthState> get events => _controller.stream;

  bool get isOK => _states.values.every((state) => state.isOK);

  int get failCount => _states.values.where((state) => state.isFailed).length;

  List<SystemHealthState> getStates() => _states.values.toList();

  void setOK(String key) {
    return set(key, true);
  }

  void setFailed(String key, Object reason) {
    return set(
      key,
      false,
      reason,
    );
  }

  void set(String key, bool isOK, [Object? reason]) {
    final prev = _states[key];
    final integrations = ref.read(integrationManagerProvider);
    final service = integrations.get(key);
    assert(service.isPresent, 'Service [$key] not found');

    final state = SystemHealthState(
      key: key,
      isOK: isOK,
      reason: reason,
      when: DateTime.now(),
      service: service.value,
      connectionMode: connectionMode,
      counter: (prev?.counter ?? 0) + 1,
    );
    _states[key] = state;
    _controller.add(state);
    // TODO: Store history to file
    _log.log(
      isOK ? Level.FINEST : Level.WARNING,
      'Connection for [$key] ${isOK ? 'is OK' : 'has FAILED'}',
    );
  }

  String get connectionMode {
    return ref.read(settingServiceProvider).getOrDefault(
          SettingType.connectionMode,
          ConnectionMode.auto,
        );
  }

  void onDriverEvents(Stream<DriverEvent> events) async {
    await for (final e in events) {
      switch (e) {
        case DriverFailureEvent _:
          setFailed(e.key, e.error);
          break;
        case ThrottledDriverUpdatedEvent _:
          if (!e.wasThrottled) {
            setOK(e.key);
          }
          break;
        case DevicesUpdatedEvent _:
          setOK(e.key);
          break;
        case _:
          break;
      }
    }
  }
}

@Riverpod(keepAlive: true)
SystemHealthService systemHealthService(SystemHealthServiceRef ref) =>
    SystemHealthService(ref);
