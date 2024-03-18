import 'package:go_router/go_router.dart';
import 'package:smart_dash/core/presentation/routes.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/feature/device/domain/device_definition.dart';
import 'package:smart_dash/feature/pairing/presentation/pair/new_devices_screen.dart';
import 'package:smart_dash/feature/pairing/presentation/pairing_screen.dart';
import 'package:smart_dash/feature/pairing/presentation/select/device_types_screen.dart';
import 'package:smart_dash/integration/domain/integration.dart';

class PairingScreens {
  static const home = '/pairing';
  static const listNewDevices = '$home/$_listNewDevices';
  static const listDeviceTypes = '$home/$_listDeviceTypes';

  static const _listNewDevices = 'list/device/new';
  static const _listDeviceTypes = 'list/device/type';

  static String toListNewDevicesPath(
    String serviceKey,
    DeviceDefinition definition,
  ) =>
      Uri(
        path: PairingScreens.listNewDevices,
        queryParameters: {
          'key': serviceKey,
          'type': definition.type.name,
        },
      ).toString();

  static String toListDeviceTypesPath(Integration definition) => Uri(
        path: PairingScreens.listDeviceTypes,
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
    builder: (context, state) {
      return PairingScreen(
        location: Routes.lastLocationOnStack,
      );
    },
    routes: [
      // Route to device type selection screen
      Routes.buildGoRoute(
        fullscreenDialog: true,
        path: PairingScreens._listDeviceTypes,
        builder: (context, state) {
          return DeviceTypesScreen(
            serviceKey: state.uri.queryParameters['key']!,
            location: Routes.lastLocationOnStack,
          );
        },
      ),
      // Route to device pairing screen
      Routes.buildGoRoute(
        fullscreenDialog: true,
        path: PairingScreens._listNewDevices,
        builder: (context, state) {
          return NewDevicesScreen(
            serviceKey: state.uri.queryParameters['key']!,
            location: Routes.lastLocationOnStack,
            type: DeviceType.from(state.uri.queryParameters['type']!),
          );
        },
      ),
    ],
  );
}
