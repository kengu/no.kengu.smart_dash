import 'package:go_router/go_router.dart';
import 'package:smart_dash/core/presentation/screens.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/feature/device/presentation/details/paired_device_details_screen.dart';
import 'package:smart_dash/feature/device/presentation/list/paired_device_screen.dart';
import 'package:smart_dash/core/presentation/routes.dart';

class DeviceScreens {
  static const home = '/device';
  static const listPaired = 'list/devices';
  static const details = 'details/device';

  static String toDevicesDetailsPath(
    Device device,
  ) =>
      Uri(path: Screens.deviceDetails, queryParameters: {
        'id': device.id,
      }).toString();
}

GoRoute buildDeviceRoutes() {
  return Routes.buildGoRoute(
    path: DeviceScreens.home,
    child: PairedDeviceScreen(
      location: Routes.lastLocation,
    ),
    routes: [
      // Route to device type selection screen
      Routes.buildGoRoute(
        path: DeviceScreens.details,
        builder: (context, state) {
          return PairedDeviceDetailsScreen(
            deviceId: state.uri.queryParameters['id']!,
            location: Routes.lastLocation,
          );
        },
      ),
      /*
      // Route to device pairing screen
      SmartDashRouter.buildGoRoute(
        path: DeviceScreens.listNewDevices,
        builder: (context, state) {
          return Consumer(
            builder: (context, ref, child) {
              return NewDevicesScreen(
                serviceKey: state.queryParams['key']!,
                deviceType: state.queryParams['type']!,
                location: SmartDashRouter.lastLocation,
              );
            },
          );
        },
      ),

       */
    ],
  );
}
