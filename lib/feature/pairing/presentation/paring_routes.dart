import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_dash/constant/screens.dart';
import 'package:smart_dash/feature/device/domain/device_definition.dart';
import 'package:smart_dash/feature/pairing/presentation/select/device_types_screen.dart';
import 'package:smart_dash/feature/pairing/presentation/pair/new_devices_screen.dart';
import 'package:smart_dash/feature/pairing/presentation/pairing_screen.dart';
import 'package:smart_dash/scaffold/smart_dash_router.dart';
import 'package:smart_dash/feature/device/domain/driver_definition.dart';

class PairingScreens {
  static const home = '/pairing';
  static const listNewDevices = 'list/device/new';
  static const listDeviceTypes = 'list/device/type';

  static String toListNewDevicesPath(
    String serviceKey,
    DeviceDefinition definition,
  ) =>
      Uri(
        path: Screens.pairingListNewDevices,
        queryParameters: {
          'key': serviceKey,
          'type': definition.type,
        },
      ).toString();

  static String toListDeviceTypesPath(DriverDefinition definition) => Uri(
        path: Screens.pairingListDeviceTypes,
        queryParameters: {
          'key': definition.key,
        },
      ).toString();
}

GoRoute buildParingRoutes() {
  return SmartDashRoutes.buildGoRoute(
    path: PairingScreens.home,
    child: PairingScreen(
      location: SmartDashRoutes.lastLocation,
    ),
    routes: [
      // Route to device type selection screen
      SmartDashRoutes.buildGoRoute(
        path: PairingScreens.listDeviceTypes,
        builder: (context, state) {
          return Consumer(
            builder: (context, ref, child) {
              return DeviceTypesScreen(
                serviceKey: state.uri.queryParameters['key']!,
                location: SmartDashRoutes.lastLocation,
              );
            },
          );
        },
      ),
      // Route to device pairing screen
      SmartDashRoutes.buildGoRoute(
        path: PairingScreens.listNewDevices,
        builder: (context, state) {
          return Consumer(
            builder: (context, ref, child) {
              return NewDevicesScreen(
                serviceKey: state.uri.queryParameters['key']!,
                deviceType: state.uri.queryParameters['type']!,
                location: SmartDashRoutes.lastLocation,
              );
            },
          );
        },
      ),
    ],
  );
}
