import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/feature/device/data/device_repository.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/feature/device/domain/device_definition.dart';
import 'package:smart_dash/feature/flow/application/flow_manager.dart';
import 'package:stream_transform/stream_transform.dart';

import 'device_service.dart';

/// This class manages all Device instances, which represent all
/// paired [Device]s. Methods prefixed with "on" are only meant to be
/// overridden by subclassed and not part of any public api.
abstract class DeviceDriver {
  DeviceDriver(this.key, this.ref) : _lastUpdated = DriverUpdatedEvent.now(key);

  @protected
  final Ref ref;

  /// Get [DeviceDriver] identifier
  final String key;

  /// Set to true after [onInit] has completed
  bool _initializing = false;

  /// Completer tracking completion of [onInit]
  final Completer<void> _readyCompleter = Completer();

  /// It updated after each [onUpdate] has completed
  DriverUpdatedEvent _lastUpdated;

  /// Check when driver last updated devices.
  DriverUpdatedEvent get lastUpdated => _lastUpdated;

  /// Check if this driver is ready ([DeviceDriver.onInit] has been run).
  bool get isReady => _readyCompleter.isCompleted;

  /// Check if this driver is initializing
  /// ([DeviceDriver.onInit] is invoked but not completed yet).
  bool get isInitializing => _initializing;

  /// Returns a Future which is completed when this
  /// [DeviceDriver] is ready ([DeviceDriver.onInit] has been run).
  Future<void> awaitReady() => _readyCompleter.future;

  /// This method is called when the driver is initiated.
  /// Overriding subclasses MUST class this method before
  /// initialization is preformed. When initialization is
  /// complete, subclass MUST call [Completer.complete].
  @protected
  @mustCallSuper
  Future<void> onInit(Completer<void> completer) async {
    assert(!isReady, 'Driver already initialized');
    _initializing = true;
    await completer.future;
    onRegisterFlows(ref.read(
      flowManagerProvider,
    ));
    _initializing = false;
    _readyCompleter.complete();
  }

  /// Called after [onInit]. Override to implement supported flows
  @visibleForOverriding
  void onRegisterFlows(FlowManager manager) {}

  /// This method is called after given devices was paired
  @protected
  Future<void> onPaired(List<Device> devices) async {}

  /// This method is called after given devices was unpaired
  @protected
  Future<void> onUnPaired(List<Device> devices) async {}

  /// This method is called when device states should be updated.
  /// The driver is responsible to determine which devices that
  /// should be updated.
  @protected
  Future<DriverUpdatedEvent> onUpdate() async {
    return _lastUpdated;
  }

  /// This method is called when the driver is destroyed.
  @protected
  Future<void> onUnInit() async {}

  /// Get list of all available [Device]s.
  /// Use [DeviceDefinition.type] or
  /// [Device.id]s for a filtered response
  Future<List<Device>> getAllDevices({
    DeviceType type = DeviceType.any,
    Iterable<String> ids = const [],
  });

  /// Get list of all known [Device] definitions
  Future<List<DeviceDefinition>> getDeviceDefinitions();

  /// Attempt to pair with list of devices.
  /// Only devices that belongs to this service [key] is paired
  Future<List<Device>> pairAll(List<Device> devices) async {
    final supported = devices.where((e) => e.service == key);
    final repo = ref.read(deviceRepositoryProvider);
    final unique = await repo.setAll(supported);
    await onPaired(unique);
    return unique;
  }

  /// Attempt to unpair with list of devices.
  /// Only devices that belongs to this service [key] is unpaired
  Future<List<Device>> unpairAll(List<Device> devices) async {
    final supported = devices.where((e) => e.service == key);
    final repo = ref.read(deviceRepositoryProvider);
    final unique = await repo.removeAll(supported);
    await onUnPaired(unique);
    return unique;
  }

  /// Get list of all paired [Device]s
  Future<List<Device>> getPairedDevices(
      [DeviceType type = DeviceType.any]) async {
    final devices = await ref.read(deviceServiceProvider).getAll();
    return devices
        .where((e) => type.isAny || e.type == type || e.service == key)
        .toList();
  }

  /// Get list of all new [Device]s (available but not paired)
  Future<List<Device>> getNewDevices([DeviceType type = DeviceType.any]) async {
    final available = await getAllDevices(type: type);
    final devices = await ref.read(deviceRepositoryProvider).getAll();
    final paired = devices.map((e) => e.name);
    if (paired.isEmpty) return available;
    return available.where((device) => !paired.contains(device.name)).toList();
  }
}

class DriverEvent {
  final String key;
  final DateTime last;
  final DateTime when;
  DriverEvent(this.key, this.last, this.when);
}

/// This class stores facts about each
/// [DeviceDriver.onUpdate] outcome. You can use
/// [DriverUpdatedEvent.last] (updated) and
/// [DriverUpdatedEvent.when] (this event was emitted)
/// to reason about the device state freshness. The duration
/// since last update and when this event was emitted is calculated
/// by the convenience getter [DriverUpdatedEvent.duration]
class DriverUpdatedEvent extends DriverEvent {
  DriverUpdatedEvent(
    super.key,
    super.when,
    super.last,
    this.devices,
  );

  final List<Device> devices;

  Duration get duration => when.difference(last);

  /// Convenience getter for first device in [devices]
  Optional<Device> get first =>
      devices.isEmpty ? const Optional.empty() : Optional.of(devices.first);

  factory DriverUpdatedEvent.now(String key,
      [List<Device> devices = const []]) {
    final when = DateTime.now();
    return DriverUpdatedEvent(key, when, when, devices);
  }

  factory DriverUpdatedEvent.from(DriverUpdatedEvent event) {
    return DriverUpdatedEvent(
        event.key, event.when, DateTime.now(), event.devices);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DriverUpdatedEvent &&
          runtimeType == other.runtimeType &&
          when == other.when &&
          devices == other.devices;

  @override
  int get hashCode => when.hashCode ^ devices.hashCode;
}

/// This class adds throttled updates to [DeviceDriver].
/// Use [ThrottledDeviceDriver.throttle] to define the
/// minimum duration between calls to
/// [ThrottledDeviceDriver.onThrottledUpdate], and
/// [ThrottledDeviceDriver.trailing] to control when
/// each update is executed at the end of each throttled
/// period. See [RateLimit.throttle] for more information
/// about throttle configuration.
abstract class ThrottledDeviceDriver extends DeviceDriver {
  ThrottledDeviceDriver(
    super.key,
    super.ref, {
    required this.throttle,
    required this.trailing,
  });

  @protected
  final bool trailing;
  final Duration throttle;

  late StreamController<DateTime> _updateController;
  late StreamSubscription<DateTime> _updateSubscription;
  Completer<DriverUpdatedEvent> _updateCompleter = Completer();

  /// This method is called when the driver is initiated.
  /// Overriding subclasses MUST class this method before
  /// initialization is preformed. When initialization is
  /// complete, subclass MUST call [Completer.complete].
  @override
  @protected
  @mustCallSuper
  Future<void> onInit(Completer<void> completer) async {
    super.onInit(completer);
    _updateController = StreamController.broadcast();
    _updateSubscription = _updateController.stream
        .throttle(throttle, trailing: trailing)
        .listen(_tryThrottledUpdate);
    completer.complete();
  }

  void _tryThrottledUpdate(DateTime event) async {
    onThrottledUpdate(event).then((devices) {
      if (!_updateCompleter.isCompleted) {
        _lastUpdated = ThrottledDriverUpdatedEvent.now(
          _lastUpdated,
          devices,
        );
        _updateCompleter.complete(_lastUpdated);
      }
    });
  }

  /// This method is called when device states should be updated.
  /// The driver is responsible to determine which devices that
  /// should be updated. Overriding subclasses MUST call this method.
  @override
  @mustCallSuper
  Future<DriverUpdatedEvent> onUpdate() async {
    _updateController.add(DateTime.now());
    if (_shouldThrottle()) {
      return _lastUpdated = ThrottledDriverUpdatedEvent.throttled(
        _lastUpdated,
      );
    }
    _updateCompleter = Completer();
    return _updateCompleter.future;
  }

  bool _shouldThrottle() =>
      _lastUpdated is ThrottledDriverUpdatedEvent &&
          (_lastUpdated as ThrottledDriverUpdatedEvent).wasThrottled ||
      !_updateCompleter.isCompleted;

  /// This method is called in accordance with [throttle] and [trailing].
  @protected
  Future<List<Device>> onThrottledUpdate(DateTime event) async => [];

  /// This method is called when the driver is destroyed.
  /// Overriding subclasses MUST class this method.
  @override
  @protected
  @mustCallSuper
  Future<void> onUnInit() async {
    _updateController.close();
    return _updateSubscription.cancel();
  }
}

/// This class stores facts about each
/// [ThrottledDeviceDriver.onThrottledUpdate] outcome.
/// If [ThrottledDriverUpdatedEvent.wasThrottled]
/// is true, last known state of each device is given in
/// [ThrottledDriverUpdatedEvent.devices]. You can use
/// [ThrottledDriverUpdatedEvent.last] (updated) and
/// [ThrottledDriverUpdatedEvent.when] (this event was emitted)
/// to reason about the device state freshness. The duration
/// since last update and when this event was emitted is calculated
/// by the convenience getter [DriverUpdatedEvent.duration]
class ThrottledDriverUpdatedEvent extends DriverUpdatedEvent {
  ThrottledDriverUpdatedEvent(
    super.key,
    super.last,
    super.when,
    super.devices,
    this.wasThrottled,
  );
  final bool wasThrottled;

  factory ThrottledDriverUpdatedEvent.now(DriverUpdatedEvent last,
      [List<Device> devices = const []]) {
    return ThrottledDriverUpdatedEvent(
      last.key,
      last.last,
      DateTime.now(),
      devices,
      false,
    );
  }

  factory ThrottledDriverUpdatedEvent.throttled(DriverUpdatedEvent event) {
    // Keep time of first throttled event
    final last = event is ThrottledDriverUpdatedEvent && event.wasThrottled
        ? event.last
        : event.when;
    return ThrottledDriverUpdatedEvent(
      event.key,
      last,
      DateTime.now(),
      event.devices,
      true,
    );
  }

  @override
  String toString() {
    return 'ThrottledDriverUpdatedEvent{wasThrottled: $wasThrottled}';
  }
}
