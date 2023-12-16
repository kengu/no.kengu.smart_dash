import 'dart:async';

import 'package:smart_dash_backend/device_driver/domain/device.dart';
import 'package:smart_dash_backend/util/logging.dart';

import 'device_driver.dart';

class DeviceDriverManager {
  DeviceDriverManager();

  final logger = Logger('DeviceDriverManager');

  final Map<String, DeviceDriver> _drivers = {};

  /// Check if [DeviceDriver] for given [definition] exists
  bool exists(String key) => _drivers.containsKey(key);

  /// [DeviceDriver] should call this to register
  void register(DeviceDriver driver) {
    _drivers[driver.key] = driver;
    logger.fine(
      'Driver ${driver.runtimeType}[key:${driver.key}] registered',
    );
  }

  /// Initialize manager
  Future<void> init() async {
    assert(
      _drivers.isNotEmpty,
      'Remember to register drivers before starting DeviceDriverManager',
    );

    await Future.wait(_drivers.values.map(
      // ignore: invalid_use_of_protected_member
      (e) => e.onInit(),
    ));
  }

  /// Dispose resources
  void dispose() async {
    assert(
      _drivers.isNotEmpty,
      'Remember to register drivers before starting DeviceDriverManager',
    );

    await Future.wait(_drivers.values.map(
      // ignore: invalid_use_of_protected_member
      (e) => e.onUnInit(),
    ));
  }

  /// Get [DeviceDriver] for given [DeviceDriver.key]
  DeviceDriver getDriver(String key) {
    assert(
      exists(key),
      'DeviceDriver $key not found. '
      'Have you remembered to register $key with the DeviceDriverManager?',
    );
    return _drivers[key] as DeviceDriver;
  }

  Future<List<Device>> update() async {
    final results = await Future.wait(
      _drivers.values.map(_update),
    );
    return results.expand((devices) => devices).toList();
  }

  Future<List<Device>> _update(DeviceDriver driver) async {
    // ignore: invalid_use_of_protected_member
    final devices = await driver.onUpdate();
    logger.info(
      'Driver ${driver.key} updated ${devices.length} devices',
    );
    return devices;
  }
}
