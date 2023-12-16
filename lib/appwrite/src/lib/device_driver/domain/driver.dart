import 'package:smart_dash_backend/util/json.dart';

import 'device.dart';

/// The Driver class manages all [Device] instances
abstract class Driver {
  /// Get a Device instance by its device [data] object.
  Device getDevice(JsonObject data);

  /// Get a list with all [Device] instances
  List<Device> getDevices();

  /// This method is called when the driver is initiated.
  Future<void> onInit();

  /// Returns a [Future] which is resolved when this [Driver] is
  /// ready ([Driver.onInit] has been run).
  Future<void> onReady();

  /// This method is called when this [Driver] is destroyed.
  Future<void> onUnInit();
}
