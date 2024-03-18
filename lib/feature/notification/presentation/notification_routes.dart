import 'package:go_router/go_router.dart';
import 'package:smart_dash/core/presentation/routes.dart';
import 'package:smart_dash/feature/notification/domain/notification.dart';
import 'package:smart_dash/feature/notification/presentation/notification_screen.dart';

class NotificationScreens {
  static const home = '/notifications';
  static const details = 'details';

  static String toDetailsPath(NotificationModel details) => Uri(
        path: NotificationScreens.details,
        queryParameters: {
          'id': details.id,
        },
      ).toString();
}

GoRoute buildNotificationRoutes() {
  return Routes.buildGoRoute(
    fullscreenDialog: true,
    path: NotificationScreens.home,
    restorationId: Routes.setLastLocation,
    builder: (context, state) {
      return NotificationScreen(
        location: Routes.lastLocationOnStack,
      );
    },
  );
}
