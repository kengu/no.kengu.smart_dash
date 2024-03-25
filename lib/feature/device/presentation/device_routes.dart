import 'package:go_router/go_router.dart';
import 'package:smart_dash/core/presentation/routes.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/feature/device/presentation/details/paired_device_details_screen.dart';
import 'package:smart_dash/feature/device/presentation/list/paired_devices_screen.dart';

class DeviceScreens {
  static const home = '/devices';
  static const details = '$home/$_details';
  static const _details = 'details';

  static String toDeviceDetailsPath(
    Device device,
  ) =>
      Uri(
        path: details,
        queryParameters: Identity.of(device).toJson(),
      ).toString();
}

GoRoute buildDeviceRoutes() {
  return Routes.buildGoRoute(
    fullscreenDialog: true,
    path: DeviceScreens.home,
    restorationId: Routes.setLastLocation,
    builder: (context, state) {
      return PairedDevicesScreen(
        location: Routes.lastLocationOnStack,
      );
    },
    routes: [
      // Route to device type selection screen
      Routes.buildGoRoute(
        fullscreenDialog: true,
        path: DeviceScreens._details,
        builder: (context, state) {
          return PairedDeviceDetailsScreen(
            identity: Identity.fromJson(
              state.uri.queryParameters,
            ),
            location: Routes.lastLocationOnStack,
          );
        },
      ),
    ],
  );
}
