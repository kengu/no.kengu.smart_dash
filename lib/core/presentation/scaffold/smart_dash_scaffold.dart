import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_dash/core/presentation/pages.dart';
import 'package:smart_dash/core/presentation/routes.dart';
import 'package:smart_dash/core/presentation/scaffold/fullscreen_state.dart';
import 'package:smart_dash/core/presentation/scaffold/smart_dash_menu.dart';
import 'package:smart_dash/core/presentation/scaffold/smart_dash_navigation_bar.dart';
import 'package:smart_dash/core/presentation/scaffold/smart_dash_navigation_rail.dart';
import 'package:smart_dash/core/presentation/screens.dart';
import 'package:smart_dash/core/presentation/widget/responsive_widget.dart';
import 'package:smart_dash/core/presentation/widget/smart_dash_toolbar.dart';
import 'package:smart_dash/util/widget.dart';

class SmartDashScaffold extends ConsumerStatefulWidget {
  const SmartDashScaffold({
    super.key,
    required this.child,
    required this.location,
  });

  final Widget child;
  final String location;

  @override
  ConsumerState<SmartDashScaffold> createState() => _SmartDashScaffoldState();
}

class _SmartDashScaffoldState extends ConsumerState<SmartDashScaffold> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onLongPress: () {
        FullscreenState.notifier(ref).toggle();
      },
      child: ResponsiveWidget(
        // Scaffold with bottom navigation bar
        mobile: _MobileScaffold(
          location: widget.location,
          child: widget.child,
        ),
        // Scaffold with navigation rail
        desktop: _DesktopScaffold(
          location: widget.location,
          child: widget.child,
        ),
      ),
    );
  }
}

class _DesktopScaffold extends ConsumerWidget {
  const _DesktopScaffold({
    required this.child,
    required this.location,
  });

  final Widget child;
  final String location;

  bool get isPage => Routes.contains(location);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFullscreen = FullscreenState.watch(ref);
    return Stack(
      children: [
        Scaffold(
          body: Row(
            children: [
              if (isPage && !isFullscreen)
                SmartDashNavigationRail(
                  selected: location,
                  locations: Pages.locations,
                  children: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.home_outlined),
                      selectedIcon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(
                        CupertinoIcons.rectangle_3_offgrid,
                      ),
                      selectedIcon:
                          Icon(CupertinoIcons.rectangle_3_offgrid_fill),
                      label: Text('Rooms'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(
                        Icons.video_camera_back_outlined,
                      ),
                      selectedIcon: Icon(Icons.video_camera_back),
                      label: Text('Cameras'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(
                        Icons.history_outlined,
                      ),
                      selectedIcon: Icon(Icons.history),
                      label: Text('History'),
                    ),
                    NavigationRailDestination(
                      icon: Badge(
                        child: Icon(
                          Icons.notifications_none_outlined,
                        ),
                      ),
                      selectedIcon: Icon(Icons.notifications),
                      label: Text('Notifications'),
                    ),
                  ],
                ),
              Expanded(
                child: Padding(
                  padding:
                      isPage ? EdgeInsets.zero : const EdgeInsets.all(24.0),
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MobileScaffold extends ConsumerWidget {
  const _MobileScaffold({
    required this.child,
    required this.location,
  });

  final Widget child;
  final String location;

  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  bool get isPage => !Screens.contains(location);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = getLegendTextStyle(context);
    final isFullscreen = FullscreenState.watch(ref);
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: isPage,
      drawerEnableOpenDragGesture: isPage,
      drawer: isPage && !isFullscreen
          ? NavigationDrawer(
              elevation: 8.0,
              selectedIndex: -1,
              onDestinationSelected: (index) {
                context.pop();
                switch (index) {
                  case 0: // View history
                    context.push(Pages.history);
                    break;
                  case 1: // View notifications
                    context.push(Pages.notifications);
                    break;
                  case 2: // Add Home
                    break;
                  case 3: // Pair with device
                    context.push(Screens.pairing);
                    break;
                  case 4: // Manage account
                    context.push(Screens.account);
                    break;
                  case 5: // Manage settings
                    context.push(Screens.settings);
                    break;
                }
              },
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: SmartDashMenuHeader(
                    closeOnAll: true,
                    leading: const Icon(Icons.close),
                    onPressed: () => context.pop(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                  child: Text('View', style: style),
                ),
                const NavigationDrawerDestination(
                  label: Text('History'),
                  icon: Icon(
                    Icons.history_outlined,
                  ),
                  selectedIcon: Icon(Icons.history),
                ),
                const NavigationDrawerDestination(
                  label: Text('Notifications'),
                  icon: Badge(
                    child: Icon(
                      Icons.notifications_none_outlined,
                    ),
                  ),
                  selectedIcon: Icon(Icons.notifications),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                  child: Text('Create New', style: style),
                ),
                const NavigationDrawerDestination(
                  icon: Icon(Icons.add_home),
                  label: Text('Home'),
                ),
                const NavigationDrawerDestination(
                  icon: Icon(Icons.devices),
                  label: Text('Device'),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                  child: Text('You', style: style),
                ),
                const NavigationDrawerDestination(
                  icon: Icon(Icons.person),
                  label: Text('Account'),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                  child: Text('Application', style: style),
                ),
                const NavigationDrawerDestination(
                  icon: Icon(Icons.settings),
                  label: Text('Settings'),
                ),
              ],
            )
          : null,
      body: isPage && !isFullscreen
          ? Stack(
              fit: StackFit.loose,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 0.0,
                    ),
                    child: Padding(
                      padding: isPage
                          ? EdgeInsets.zero
                          : const EdgeInsets.all(
                              16.0,
                            ),
                      child: child,
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 24,
                  child: SmartDashToolbar(
                    leading: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                    ),
                  ),
                ),
              ],
            )
          : Padding(
              padding: isPage
                  ? EdgeInsets.zero
                  : const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ).copyWith(top: 24.0),
              child: child,
            ),
      bottomNavigationBar: isPage && !isFullscreen
          ? SmartDashNavigationBar(
              selected: location,
              locations: const [Pages.home, Pages.rooms, Pages.cameras],
              children: const [
                NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: 'Home',
                  tooltip: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(
                    CupertinoIcons.rectangle_3_offgrid,
                  ),
                  selectedIcon: Icon(CupertinoIcons.rectangle_3_offgrid_fill),
                  label: 'Rooms',
                  tooltip: 'Rooms',
                ),
                NavigationDestination(
                  icon: Icon(
                    Icons.video_camera_back_outlined,
                  ),
                  selectedIcon: Icon(Icons.video_camera_back),
                  label: 'Cameras',
                  tooltip: 'Cameras',
                ),
              ],
            )
          : null,
    );
  }
}
