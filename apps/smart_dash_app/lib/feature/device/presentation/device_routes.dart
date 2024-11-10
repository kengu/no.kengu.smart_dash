import 'package:go_router/go_router.dart';
import 'package:smart_dash_app/core/presentation/routes.dart';
import 'package:smart_dash_app/feature/device/domain/device.dart';
import 'package:smart_dash_app/feature/device/presentation/details/paired_device_details_screen.dart';
import 'package:smart_dash_app/feature/device/presentation/list/paired_devices_screen.dart';

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

List<GoRoute> buildDeviceRoutes() => [
      Routes.buildGoRoute(
          fullscreenDialog: true,
          path: DeviceScreens.home,
          restorationId: Routes.setLastLocation,
          builder: (context, state) {
            return const PairedDevicesScreen();
          }),
      Routes.buildGoRoute(
        fullscreenDialog: true,
        path: DeviceScreens.details,
        builder: (context, state) {
          return PairedDeviceDetailsScreen(
            identity: Identity.fromJson(
              state.uri.queryParameters,
            ),
          );
        },
      ),
    ];
