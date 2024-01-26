import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/device/data/device_repository.dart';
import 'package:smart_dash/feature/system/application/timing_service.dart';
import 'package:smart_dash/integration/domain/integration.dart';
import 'package:smart_dash/util/guard.dart';

import 'device_driver.dart';

part 'device_driver_manager.g.dart';

class DeviceDriverManager {
  DeviceDriverManager(this.ref);

  final Ref ref;
  final Map<String, DeviceDriver> _drivers = {};
  final StreamController<DriverUpdatedEvent> _updatedController =
      StreamController.broadcast();

  StreamSubscription<DateTime>? _timing;

  /// Get stream of [DriverUpdatedEvent]s.
  Stream<DriverUpdatedEvent> get updated => _updatedController.stream;

  /// Check if [DeviceDriver] for given [definition] exists
  bool exists(String key) => _drivers.containsKey(key);

  /// [DeviceDriver] should call this to register
  void register(DeviceDriver driver) {
    _drivers[driver.key] = driver;
    debugPrint('DeviceDriverManager: '
        '${driver.runtimeType}[key:${driver.key}] registered');
  }

  /// Initialize manager
  void init() async {
    assert(
      _drivers.isNotEmpty,
      'Remember to register drivers before starting DeviceDriverManager',
    );
    assert(
      _ready(false).where((e) => e.isInitializing).isEmpty,
      'Concurrent init detected, you need to wait for the first to complete',
    );

    await Future.wait(_ready(false).map(
      // ignore: invalid_use_of_protected_member
      (e) => e.onInit(Completer()),
    ));
  }

  /// Start pumping update events to registered
  /// device drivers by binding it to the global timing event pump.
  void bind() {
    assert(
      _drivers.isNotEmpty,
      'Remember to register drivers before starting the manager',
    );
    assert(_timing == null, 'DeviceDriverManager is started already');

    _timing = ref.read(timingServiceProvider).events.listen((event) {
      // TODO: Add error handling.
      guard<void>(
        () => Future.wait(_ready(true).map(
          _onUpdate,
        )),
      );
    });
  }

  /// Stop pumping update events by unbinding from global
  /// event pump. Any ongoing operations will continue
  /// until it completes. No new operations will
  /// be performed until [bind] is called again.
  void unbind() {
    _timing?.cancel();
    _timing = null;
  }

  /// Get [DeviceDriver] for given [IntegrationFields.key]
  DeviceDriver getDriver(String key) {
    assert(
      exists(key),
      'DeviceDriver $key not found. '
      'Have you remembered to register it with the DeviceDriverManager?',
    );
    return _drivers[key] as DeviceDriver;
  }

  Future<void> _onUpdate(DeviceDriver driver) async {
    // ignore: invalid_use_of_protected_member
    final event = await driver.onUpdate();
    if (_shouldProcess(event)) {
      debugPrint(
        'DeviceDriverManager: fetched [${event.devices.length}] devices from ${driver.key} '
        'after ${event.duration.inSeconds} sec.',
      );
      _updatedController.add(event);
      // Update devices
      await ref.read(deviceRepositoryProvider).updateAll(event.devices);
    }
  }

  bool _shouldProcess(DriverUpdatedEvent event) =>
      event is! ThrottledDriverUpdatedEvent || !event.wasThrottled;

  Iterable<DeviceDriver> _ready(bool isReady) =>
      _drivers.values.where((e) => e.isReady == isReady);
}

@Riverpod(keepAlive: true)
DeviceDriverManager deviceDriverManager(DeviceDriverManagerRef ref) =>
    DeviceDriverManager(ref);

@riverpod
Stream<DriverUpdatedEvent> driverUpdated(DriverUpdatedRef ref) =>
    ref.watch(deviceDriverManagerProvider).updated;
