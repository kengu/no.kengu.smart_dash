import 'package:go_router/go_router.dart';
import 'package:smart_dash/const/screens.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/feature/device/presentation/details/paired_device_details_screen.dart';
import 'package:smart_dash/feature/device/presentation/list/paired_device_screen.dart';
import 'package:smart_dash/scaffold/smart_dash_router.dart';

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
  return SmartDashRoutes.buildGoRoute(
    path: DeviceScreens.home,
    child: PairedDeviceScreen(
      location: SmartDashRoutes.lastLocation,
    ),
    routes: [
      // Route to device type selection screen
      SmartDashRoutes.buildGoRoute(
        path: DeviceScreens.details,
        builder: (context, state) {
          return PairedDeviceDetailsScreen(
            deviceId: state.uri.queryParameters['id']!,
            location: SmartDashRoutes.lastLocation,
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
