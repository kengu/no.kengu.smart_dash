import 'package:go_router/go_router.dart';
import 'package:smart_dash_app/core/presentation/routes.dart';
import 'package:smart_dash_app/feature/device/domain/device.dart';
import 'package:smart_dash_app/feature/system/presentation/system_health/system_health_screen.dart';

class SystemScreens {
  static const home = '/system';
  static const health = '$home/$_health';
  static const _health = 'health';

  static String toSystemHealthPath(
    Device device,
  ) =>
      Uri(
        path: health,
        queryParameters: Identity.of(device).toJson(),
      ).toString();
}

List<GoRoute> buildSystemRoutes() => [
      Routes.buildGoRoute(
        fullscreenDialog: true,
        path: SystemScreens.home,
        builder: (context, state) {
          return SystemHealthScreen(
            location: Routes.lastLocationOnStack,
          );
        },
      ),
      Routes.buildGoRoute(
        fullscreenDialog: true,
        path: SystemScreens.health,
        builder: (context, state) {
          return SystemHealthScreen(
            location: Routes.lastLocationOnStack,
          );
        },
      ),
    ];
