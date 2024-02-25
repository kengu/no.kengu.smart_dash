import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_dash/core/presentation/routes.dart';
import 'package:smart_dash/core/presentation/screens.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/feature/device/domain/device_definition.dart';
import 'package:smart_dash/feature/pairing/presentation/pair/new_devices_screen.dart';
import 'package:smart_dash/feature/pairing/presentation/pairing_screen.dart';
import 'package:smart_dash/feature/pairing/presentation/select/device_types_screen.dart';
import 'package:smart_dash/integration/domain/integration.dart';

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
          'type': definition.type.name,
        },
      ).toString();

  static String toListDeviceTypesPath(Integration definition) => Uri(
        path: Screens.pairingListDeviceTypes,
        queryParameters: {
          'key': definition.key,
        },
      ).toString();
}

GoRoute buildParingRoutes() {
  return Routes.buildGoRoute(
    fullscreenDialog: true,
    path: PairingScreens.home,
    restorationId: Routes.setLastLocation,
    child: PairingScreen(
      location: Routes.lastLocation,
    ),
    routes: [
      // Route to device type selection screen
      Routes.buildGoRoute(
        fullscreenDialog: true,
        path: PairingScreens.listDeviceTypes,
        builder: (context, state) {
          return Consumer(
            builder: (context, ref, child) {
              return DeviceTypesScreen(
                serviceKey: state.uri.queryParameters['key']!,
                location: Routes.lastLocation,
              );
            },
          );
        },
      ),
      // Route to device pairing screen
      Routes.buildGoRoute(
        fullscreenDialog: true,
        path: PairingScreens.listNewDevices,
        builder: (context, state) {
          return Consumer(
            builder: (context, ref, child) {
              return NewDevicesScreen(
                serviceKey: state.uri.queryParameters['key']!,
                location: Routes.lastLocation,
                type: DeviceType.from(state.uri.queryParameters['type']!),
              );
            },
          );
        },
      ),
    ],
  );
}
