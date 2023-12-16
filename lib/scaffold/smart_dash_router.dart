import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_dash/constant/pages.dart';
import 'package:smart_dash/constant/screens.dart';
import 'package:smart_dash/feature/account/presentation/account_form_screen.dart';
import 'package:smart_dash/feature/dashboard/presentation/home.dart';
import 'package:smart_dash/feature/device/presentation/device_routes.dart';
import 'package:smart_dash/feature/pairing/presentation/paring_routes.dart';
import 'package:smart_dash/feature/setting/presentation/settings_form_screen.dart';
import 'package:smart_dash/widget/page_view.dart';
import 'package:smart_dash/scaffold/presentation/smart_dash_scaffold.dart';

sealed class SmartDashRoutes {
  /// Get last location routed to
  static String get lastLocation => _lastLocation;

  static String _lastLocation = Pages.home;

  static String _setLastLocation(GoRouterState state) {
    return _lastLocation = state.uri.toString();
  }

  static final GoRouter router = GoRouter(
    restorationScopeId: 'router',
    initialLocation: _lastLocation,
    navigatorKey: _rootNavigatorKey,
    redirect: (BuildContext context, GoRouterState state) async {
      return contains(state.uri.toString()) ? state.uri.toString() : '/home';
    },
    routes: [
      // This shellRoute displays a UI shell on the root
      // navigator around children routes that defined in
      // 'routes' below (in this case rail/bottom navigation destinations)
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state, child) {
          return MaterialPage(
            restorationId: state.uri.toString(),
            child: SmartDashScaffold(
              location: state.uri.toString(),
              withMenu: Pages.contains(state.uri.toString()),
              child: child,
            ),
          );
        },
        routes: [
          // These screens are displayed on ShellRoute's
          // Navigator. Each is shown as a screen (think dialogs)
          // "on top" on current selected navigation page
          // (the selected rail/menu/bottom destination)
          buildGoRoute(
            path: Screens.account,
            child: AccountFormScreen(location: _lastLocation),
          ),
          buildGoRoute(
            path: Screens.settings,
            child: SettingFormScreen(location: _lastLocation),
          ),
          buildDeviceRoutes(),
          buildParingRoutes(),
          // These are displayed on the ShellRoute's Navigator
          // (path to each rail/menu/bottom destinations)
          buildGoRoute(
            path: Pages.home,
            restorationId: _setLastLocation,
            child: const HomePage(),
          ),
          buildGoRoute(
            path: Pages.history,
            restorationId: _setLastLocation,
            child: const DetailsView(
              title: 'History',
              route: Pages.home,
            ),
          ),
          buildGoRoute(
            path: Pages.notifications,
            restorationId: _setLastLocation,
            child: const DetailsView(
              title: 'Notifications',
              route: Pages.home,
            ),
          ),
        ],
      ),
    ],
  );

  static GoRoute buildGoRoute({
    required String path,
    Widget? child,
    bool fullscreenDialog = true,
    GoRouterWidgetBuilder? builder,
    List<RouteBase> routes = const <RouteBase>[],
    String? Function(GoRouterState state)? restorationId,
  }) {
    assert(
      child != null || builder != null,
      'child or builder must be provided',
    );
    return GoRoute(
      path: path,
      routes: routes,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          restorationId: restorationId == null
              ? state.uri.toString()
              : restorationId(
                  state,
                ),
          fullscreenDialog: fullscreenDialog,
          child: child ?? builder!(context, state),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(opacity: animation, child: child),
        );
      },
    );
  }

  static bool contains(String location) {
    final uri = Uri.tryParse(location);
    if (uri == null) {
      return false;
    }
    return Pages.indexOf(uri.path) > -1 || Screens.indexOf(uri.path) > -1;
  }

  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>();

  static void dispose() {
    router.dispose();
  }
}
