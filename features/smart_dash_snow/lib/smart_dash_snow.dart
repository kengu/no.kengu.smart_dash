/// Support for doing something awesome.
///
/// More dartdocs go here.
library;

import 'package:smart_dash_device/smart_dash_device.dart';

export 'src/application/snow_device_driver.dart';
export 'src/application/snow_driver.dart';
export 'src/application/snow_manager.dart';
export 'src/application/snow_service.dart';
export 'src/data/snow_client.dart';
export 'src/domain/snow_device.dart';
export 'src/domain/snow_state.dart';
export 'src/integration/nysny/nysny.dart';

class Snow {
  static const supportedTypes = [
    DeviceType.sensor,
  ];

  static const readableModelName = {
    DeviceType.sensor: 'Snow Sensor',
  };
}
