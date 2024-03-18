import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/core/presentation/pages.dart';
import 'package:smart_dash/core/presentation/scaffold/smart_dash_scaffold.dart';
import 'package:smart_dash/core/presentation/screens.dart';
import 'package:smart_dash/core/presentation/widget/responsive_widget.dart';
import 'package:smart_dash/feature/account/domain/service_config.dart';
import 'package:smart_dash/feature/account/presentation/account_form_screen.dart';
import 'package:smart_dash/feature/analytics/presentation/history_page.dart';
import 'package:smart_dash/feature/camera/presentation/camera_screen.dart';
import 'package:smart_dash/feature/camera/presentation/cameras_page.dart';
import 'package:smart_dash/feature/device/presentation/device_routes.dart';
import 'package:smart_dash/feature/flow/presentation/flow_routes.dart';
import 'package:smart_dash/feature/home/presentation/home_page.dart';
import 'package:smart_dash/feature/notification/presentation/notification_routes.dart';
import 'package:smart_dash/feature/pairing/presentation/paring_routes.dart';
import 'package:smart_dash/feature/room/presentation/rooms_page.dart';
import 'package:smart_dash/feature/setting/presentation/settings_form_screen.dart';

sealed class Routes {
  /// Get last location routed to
  static String get lastLocation => _lastLocation;

  static String _lastLocation = Pages.home;

  static final RouteStack _stack = RouteStack();

  static String get lastLocationOnStack => _stack.lastLocation;

  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static String setLastLocation(GoRouterState state) {
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
      //
      // Rail and bottom bar navigation destinations
      //
      // This shellRoute displays a UI shell on the root
      // navigator around children routes that defined in
      // 'routes' below
      ShellRoute(
        pageBuilder: (context, state, child) {
          return MaterialPage(
            restorationId: state.uri.toString(),
            child: SmartDashScaffold(
              location: state.uri.toString(),
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
            fullscreenDialog: true,
            builder: (context, state) {
              return AccountFormScreen(
                location: lastLocationOnStack,
              );
            },
          ),
          buildGoRoute(
            path: Screens.settings,
            fullscreenDialog: true,
            builder: (context, state) {
              return SettingFormScreen(
                location: state.extra is String
                    ? state.extra as String
                    : lastLocationOnStack,
              );
            },
          ),
          buildGoRoute(
            path: Screens.camera,
            dialogWidth: null,
            fullscreenDialog: true,
            builder: (context, state) => CameraScreen(
              location: lastLocationOnStack,
              config: state.extra is Optional<ServiceConfig>
                  ? state.extra as Optional<ServiceConfig>
                  : const Optional.empty(),
            ),
          ),
          buildFlowRoutes(),
          buildDeviceRoutes(),
          buildParingRoutes(),
          buildNotificationRoutes(),
          // These are displayed on the ShellRoute's Navigator
          // (path to each rail/menu/bottom destinations)
          buildGoRoute(
            path: Pages.home,
            restorationId: setLastLocation,
            child: const HomePage(),
          ),
          buildGoRoute(
            path: Pages.rooms,
            restorationId: setLastLocation,
            child: const RoomsPage(),
          ),
          buildGoRoute(
            path: Pages.cameras,
            restorationId: setLastLocation,
            child: const CamerasPage(),
          ),
          buildGoRoute(
            path: Pages.history,
            restorationId: setLastLocation,
            builder: (context, state) {
              return const HistoryPage();
            },
          ),
        ],
      ),
    ],
  );

  static GoRoute buildGoRoute({
    required String path,
    Widget? child,
    double? dialogWidth = 500,
    bool fullscreenDialog = false,
    GoRouterWidgetBuilder? builder,
    List<RouteBase> routes = const <RouteBase>[],
    String? Function(GoRouterState state)? restorationId,
  }) {
    assert(
      child != null || builder != null,
      'child or builder must be provided',
    );
    assert(
      child != null && builder == null || child == null && builder != null,
      'only child or builder can be provided',
    );
    return GoRoute(
      path: path,
      routes: routes,
      onExit: _stack.onExit,
      pageBuilder: (context, state) {
        final isDialogShown = _stack.isDialogShown;
        final widget = child ?? builder!(context, state);
        final isNotMobile = ResponsiveWidget.isNotMobile(context);
        final isDialog = fullscreenDialog && isNotMobile;

        _stack.add(state, isDialog);

        if (isDialog) {
          final color = Theme.of(context).colorScheme.background;
          return DialogPage(
            // Only show barrier color on first dialog in stack
            barrierColor: isDialogShown ? Colors.transparent : Colors.black54,
            builder: (_) => Dialog(
              backgroundColor: color,
              surfaceTintColor: color,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16.0),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(16.0),
                ),
                child: SizedBox(
                  width: dialogWidth,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: widget,
                  ),
                ),
              ),
            ),
          );
        }
        return CustomTransitionPage(
          key: state.pageKey,
          restorationId: restorationId == null
              ? state.uri.toString()
              : restorationId(state),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(opacity: animation, child: child);
          },
          fullscreenDialog: fullscreenDialog,
          child: widget,
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

  static void dispose() {
    router.dispose();
  }
}

class RouteStack {
  final int max = 100;
  final Set<RouteEntry> _stack = <RouteEntry>{};

  get isDialogShown => _stack.lastOrNull?.isDialog == true;

  String get lastLocation => _stack.lastOrNull?.path ?? Pages.home;

  void add(GoRouterState state, bool isDialog) {
    if (_stack.length > max) {
      _stack.remove(_stack.first);
    }
    _stack.add(RouteEntry(
      state.path ?? state.topRoute?.path,
      isDialog,
    ));
  }

  FutureOr<bool> onExit(BuildContext context) {
    if (_stack.isEmpty) return true;
    return _stack.remove(_stack.last);
  }
}

class RouteEntry {
  RouteEntry(this.path, this.isDialog);

  final String? path;
  final bool isDialog;

  @override
  String toString() {
    return 'RouteEntry{path: $path, isDialog: $isDialog}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RouteEntry &&
          runtimeType == other.runtimeType &&
          path == other.path &&
          isDialog == other.isDialog;

  @override
  int get hashCode => path.hashCode ^ isDialog.hashCode;
}

/// A dialog page with Material entrance and exit animations, modal barrier color,
/// and modal barrier behavior (dialog is dismissible with a tap on the barrier).
class DialogPage<T> extends Page<T> {
  final Offset? anchorPoint;
  final Color? barrierColor;
  final bool barrierDismissible;
  final String? barrierLabel;
  final bool useSafeArea;
  final CapturedThemes? themes;
  final WidgetBuilder builder;

  const DialogPage({
    required this.builder,
    this.anchorPoint,
    this.barrierColor = Colors.black54,
    this.barrierDismissible = true,
    this.barrierLabel,
    this.useSafeArea = true,
    this.themes,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });

  @override
  Route<T> createRoute(BuildContext context) => DialogRoute<T>(
        context: context,
        settings: this,
        builder: builder,
        anchorPoint: anchorPoint,
        barrierColor: barrierColor,
        barrierDismissible: barrierDismissible,
        barrierLabel: barrierLabel,
        useSafeArea: useSafeArea,
        themes: themes,
      );
}
