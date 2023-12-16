import 'dart:async';

import 'package:smart_dash_backend/device_driver/domain/device_definition.dart';
import 'package:smart_dash_backend/device_driver/data/device_repository.dart';
import 'package:smart_dash_backend/device_driver/domain/device.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// This class manages all Device instances, which represent all
/// paired [Device]s. Methods prefixed with "on" are only meant to
/// be overridden by subclassed and not part of any public api.
abstract class DeviceDriver {
  DeviceDriver(this.repo);

  final DeviceRepository repo;

  /// Get [DeviceDriver] identifier
  String get key;

  /// This method is called when the driver is initiated.
  @protected
  Future<void> onInit() async {}

  /// This method is called after given devices was paired
  @protected
  Future<void> onPaired(List<Device> devices) async {}

  /// This method is called when device states should be updated.
  /// The driver is responsible to determine which devices that
  /// should be updated.
  @protected
  @mustCallSuper
  Future<List<Device>> onUpdate() async {
    final paired = await getPairedDevices();
    final updated = paired.isNotEmpty
        ? await getAllDevices(ids: paired.map((e) => e.id))
        : <Device>[];
    return updated;
  }

  /// This method is called when the driver is destroyed.
  @protected
  Future<void> onUnInit() async {}

  /// Get list of all available [Device]s.
  /// Use [DeviceDefinition.type] or
  /// [Device.id]s for a filtered response
  Future<List<Device>> getAllDevices({
    String? type,
    Iterable<String> ids = const [],
  });

  /// Get list of all known [Device] definitions
  Future<List<DeviceDefinition>> getDeviceDefinitions();

  /// Attempt to add all given devices to
  /// repository. Returns list of actual added devices.
  Future<List<Device>> pairAllDevices(List<Device> devices) async {
    final unique = await repo.addAll(key, devices);
    await onPaired(unique);
    return unique;
  }

  /// Get list of all paired [Device]s
  Future<List<Device>> getPairedDevices([String? type]) async {
    return await repo.select(key: key, type: type);
  }

  /// Get list of all new [Device]s (available but not paired)
  Future<List<Device>> getNewDevices([String? type]) async {
    final paired = await getPairedDevices(type);
    final ids = paired.map((e) => e.id);
    final all = await getAllDevices(type: type);
    return all.where((device) => !ids.contains(device.id)).toList();
  }
}
