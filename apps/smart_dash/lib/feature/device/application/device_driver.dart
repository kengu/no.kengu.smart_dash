import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/feature/device/data/device_repository.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/feature/device/domain/device_definition.dart';
import 'package:smart_dash_flow/smart_dash_flow.dart';
import 'package:stream_transform/stream_transform.dart';

import 'device_service.dart';

/// This class manages all Device instances, which represent all
/// paired [Device]s. Methods prefixed with "on" are only meant to be
/// overridden by subclassed and not part of any public api.
abstract class DeviceDriver {
  DeviceDriver(
    this.key,
    this.ref,
  ) : _lastEvent = DevicesUpdatedEvent.now(key);

  @protected
  final Ref ref;

  /// Get [DeviceDriver] identifier
  final String key;

  /// Set to true after [onInit] has completed
  bool _initializing = false;

  /// Completer tracking completion of [onInit]
  final Completer<void> _readyCompleter = Completer();

  final StreamController<DriverDevicesEvent> _controller =
      StreamController.broadcast();

  /// It updated after each [onUpdate] has completed
  DriverEvent _lastEvent;

  /// Check when driver last updated devices.
  DriverEvent get lastEvent => _lastEvent;

  /// Check if this driver is initializing
  /// ([DeviceDriver.onInit] is invoked but not completed yet).
  bool get isInitializing => _initializing;

  /// Check if this driver is ready ([DeviceDriver.onInit] has been run).
  bool get isReady => _readyCompleter.isCompleted;

  /// Returns a Future which is completed when this
  /// [DeviceDriver] is ready ([DeviceDriver.onInit] has been run).
  Future<void> awaitReady() => _readyCompleter.future;

  /// This method is called when the driver is initiated.
  /// Overriding subclasses MUST class this method before
  /// initialization is preformed. When initialization is
  /// complete, subclass MUST call [Completer.complete].
  @protected
  @mustCallSuper
  Future<Stream<DriverEvent>> onInit(Completer<void> completer) async {
    assert(!isReady, 'Driver already initialized');
    _initializing = true;
    await completer.future;
    onRegisterFlows(ref.read(
      flowManagerProvider,
    ));
    _initializing = false;
    _readyCompleter.complete();
    return _controller.stream;
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
  Future<DriverEvent> onUpdate() async {
    return _lastEvent;
  }

  /// This method is called when the driver is destroyed.
  @protected
  @mustCallSuper
  Future<void> onUnInit() async {
    await _controller.close();
  }

  /// Get list of all known [Device] definitions
  Future<List<DeviceDefinition>> getDeviceDefinitions();

  /// Get list of all available [Device]s.
  /// Use [DeviceDefinition.type] or
  /// [Device.id]s for a filtered response
  Future<List<Device>> getAllDevices({
    DeviceType type = DeviceType.any,
    Iterable<String> ids = const [],
  });

  /// Attempt to pair with list of devices.
  /// Only devices that belongs to this service [key] is paired
  Future<List<Device>> pairAll(List<Device> devices) async {
    final supported = devices.where((e) => e.service == key);
    final repo = ref.read(deviceRepositoryProvider);
    final unique = await repo.updateAll(supported);
    await onPaired(unique.all);
    _controller.add(DevicesPairedEvent.now(
      key,
      unique.all,
    ));
    return unique.all;
  }

  /// Attempt to unpair with list of devices.
  /// Only devices that belongs to this service [key] is unpaired
  Future<List<Device>> unpairAll(List<Device> devices) async {
    final supported = devices.where((e) => e.service == key);
    final repo = ref.read(deviceRepositoryProvider);
    final unique = await repo.removeAll(supported);
    await onUnPaired(unique.all);
    _controller.add(DevicesUnpairedEvent.now(
      key,
      unique.all,
    ));
    return unique.all;
  }

  /// Get list of all paired [Device]s
  Future<List<Device>> getPairedDevices(
      [DeviceType type = DeviceType.any]) async {
    final devices = await ref
        .read(deviceServiceProvider)
        .where((e) => e.service == key && (type.isAny || e.type == type));
    return devices.toList();
  }

  /// Get list of all new [Device]s (available but not paired)
  Future<List<Device>> getNewDevices([DeviceType type = DeviceType.any]) async {
    // TODO: Cache response
    final available = await getAllDevices(type: type);
    final devices = await ref.read(deviceRepositoryProvider).where(
          (e) => e.service == key && (type.isAny || e.type == type),
        );
    final paired = devices.map((e) => e.id);
    if (paired.isEmpty) return available;
    return available.where((device) => !paired.contains(device.id)).toList();
  }

  /// Set device properties of given device.
  /// Returns true if succeeded
  Future<bool> updateDevice(Device device) => Future.value(false);
}

abstract class DriverEvent {
  DriverEvent(this.key, this.last, this.when);

  final String key;
  final DateTime last;
  final DateTime when;

  Duration get duration => when.difference(last);
}

class DriverIOErrorEvent extends DriverEvent {
  DriverIOErrorEvent(super.key, super.last, super.when, this.error);
  final Exception error;
}

abstract class DriverDevicesEvent extends DriverEvent {
  DriverDevicesEvent(
    super.key,
    super.when,
    super.last,
    this.devices,
  );

  final List<Device> devices;

  /// Convenience getter for first device in [devices]
  Optional<Device> get first =>
      devices.isEmpty ? const Optional.empty() : Optional.of(devices.first);

  bool get isEmpty => devices.isEmpty;
  bool get isNotEmpty => devices.isNotEmpty;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DriverDevicesEvent &&
          runtimeType == other.runtimeType &&
          when == other.when &&
          devices == other.devices;

  @override
  int get hashCode => when.hashCode ^ devices.hashCode;
}

/// This class stores facts about each
/// [DeviceDriver.onPaired] outcome. You can use
/// [DriverEvent.last] (updated) and
/// [DriverEvent.when] (this event was emitted)
/// to reason about the device state freshness. The duration
/// since last update and when this event was emitted is calculated
/// by the convenience getter [DriverDevicesEvent.duration]
class DevicesPairedEvent extends DriverDevicesEvent {
  DevicesPairedEvent(
    super.key,
    super.when,
    super.last,
    super.devices,
  );

  factory DevicesPairedEvent.now(String key,
      [List<Device> devices = const []]) {
    final when = DateTime.now();
    return DevicesPairedEvent(key, when, when, devices);
  }
}

/// This class stores facts about each
/// [DeviceDriver.onUpdate] outcome. You can use
/// [DriverEvent.last] (updated) and
/// [DriverEvent.when] (this event was emitted)
/// to reason about the device state freshness. The duration
/// since last update and when this event was emitted is calculated
/// by the convenience getter [DriverDevicesEvent.duration]
class DevicesUpdatedEvent extends DriverDevicesEvent {
  DevicesUpdatedEvent(
    super.key,
    super.when,
    super.last,
    super.devices,
  );
  factory DevicesUpdatedEvent.now(String key,
      [List<Device> devices = const []]) {
    final when = DateTime.now();
    return DevicesUpdatedEvent(key, when, when, devices);
  }

  factory DevicesUpdatedEvent.from(DevicesUpdatedEvent event) {
    return DevicesUpdatedEvent(
      event.key,
      event.when,
      DateTime.now(),
      event.devices,
    );
  }
}

/// This class stores facts about each
/// [DeviceDriver.onUnPaired] outcome. You can use
/// [DriverEvent.last] (updated) and
/// [DriverEvent.when] (this event was emitted)
/// to reason about the device state freshness. The duration
/// since last update and when this event was emitted is calculated
/// by the convenience getter [DriverDevicesEvent.duration]
class DevicesUnpairedEvent extends DriverDevicesEvent {
  DevicesUnpairedEvent(
    super.key,
    super.when,
    super.last,
    super.devices,
  );

  factory DevicesUnpairedEvent.now(String key,
      [List<Device> devices = const []]) {
    final when = DateTime.now();
    return DevicesUnpairedEvent(key, when, when, devices);
  }
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
  Completer<DriverEvent> _updateCompleter = Completer();

  /// This method is called when the driver is initiated.
  /// Overriding subclasses MUST class this method before
  /// initialization is preformed. When initialization is
  /// complete, subclass MUST call [Completer.complete].
  @override
  @protected
  @mustCallSuper
  Future<Stream<DriverEvent>> onInit(Completer<void> completer) async {
    final stream = super.onInit(completer);
    _updateController = StreamController.broadcast();
    _updateSubscription = _updateController.stream
        .throttle(throttle, trailing: trailing)
        .listen(_tryThrottledUpdate, cancelOnError: false);
    completer.complete();
    return stream;
  }

  void _tryThrottledUpdate(DateTime event) async {
    try {
      final devices = await onThrottledUpdate(event);
      _complete(
        ThrottledDriverUpdatedEvent.now(_lastEvent, devices),
      );
    } on DioException catch (e) {
      _complete(DriverIOErrorEvent(
        key,
        _lastEvent.last,
        DateTime.now(),
        e,
      ));
    }
  }

  void _complete(DriverEvent event) {
    if (!_updateCompleter.isCompleted) {
      _lastEvent = event;
      _updateCompleter.complete(_lastEvent);
    }
  }

  /// This method is called when device states should be updated.
  /// The driver is responsible to determine which devices that
  /// should be updated. Overriding subclasses MUST call this method.
  @override
  @mustCallSuper
  Future<DriverEvent> onUpdate() async {
    _updateController.add(DateTime.now());
    if (_shouldThrottle()) {
      return _lastEvent = ThrottledDriverUpdatedEvent.throttled(
        _lastEvent,
      );
    }
    _updateCompleter = Completer();
    return _updateCompleter.future;
  }

  bool _shouldThrottle() =>
      _lastEvent is ThrottledDriverUpdatedEvent &&
          (_lastEvent as ThrottledDriverUpdatedEvent).wasThrottled ||
      !_updateCompleter.isCompleted;

  /// This method is called in accordance with [throttle] and [trailing].
  @protected
  Future<List<Device>> onThrottledUpdate(DateTime event);

  /// This method is called when the driver is destroyed.
  /// Overriding subclasses MUST class this method.
  @override
  @protected
  @mustCallSuper
  Future<void> onUnInit() async {
    await _updateController.close();
    await _updateSubscription.cancel();
    return super.onUnInit();
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
/// by the convenience getter [DevicesUpdatedEvent.duration]
class ThrottledDriverUpdatedEvent extends DevicesUpdatedEvent {
  ThrottledDriverUpdatedEvent(
    super.key,
    super.last,
    super.when,
    super.devices,
    this.wasThrottled,
  );
  final bool wasThrottled;

  factory ThrottledDriverUpdatedEvent.now(DriverEvent last,
      [List<Device> devices = const []]) {
    return ThrottledDriverUpdatedEvent(
      last.key,
      last.last,
      DateTime.now(),
      devices,
      false,
    );
  }

  factory ThrottledDriverUpdatedEvent.throttled(DriverEvent event) {
    // Keep time of first throttled event
    final last = event is ThrottledDriverUpdatedEvent && event.wasThrottled
        ? event.last
        : event.when;
    return ThrottledDriverUpdatedEvent(
      event.key,
      last,
      DateTime.now(),
      event is DriverDevicesEvent ? event.devices : <Device>[],
      true,
    );
  }

  @override
  String toString() {
    return 'ThrottledDriverUpdatedEvent{wasThrottled: $wasThrottled}';
  }
}
