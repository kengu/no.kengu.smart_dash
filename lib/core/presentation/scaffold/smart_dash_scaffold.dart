import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_dash/core/presentation/pages.dart';
import 'package:smart_dash/core/presentation/scaffold/fullscreen_state.dart';
import 'package:smart_dash/core/presentation/scaffold/smart_dash_menu.dart';
import 'package:smart_dash/core/presentation/scaffold/smart_dash_navigation_bar.dart';
import 'package:smart_dash/core/presentation/scaffold/smart_dash_navigation_rail.dart';
import 'package:smart_dash/core/presentation/widget/responsive_widget.dart';
import 'package:smart_dash/core/presentation/widget/smart_dash_toolbar.dart';

class SmartDashScaffold extends ConsumerStatefulWidget {
  const SmartDashScaffold({
    super.key,
    required this.child,
    required this.location,
    required this.withMenu,
  });
  final Widget child;
  final String location;
  final bool withMenu;

  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  ConsumerState<SmartDashScaffold> createState() => _SmartDashScaffoldState();
}

class _SmartDashScaffoldState extends ConsumerState<SmartDashScaffold> {
  bool get isPage => Pages.indexOf(widget.location) > -1;

  bool get isFullscreen => FullscreenState.watch(ref);

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
          isPage: isPage,
          location: widget.location,
          withBottomBar: !isFullscreen,
          withMenu: !isFullscreen && widget.withMenu,
          scaffoldKey: SmartDashScaffold._scaffoldKey,
          child: widget.child,
        ),
        // Scaffold with navigation rail
        desktop: _DesktopScaffold(
          widget: widget,
          isPage: isPage,
          withMenu: !isFullscreen,
        ),
      ),
    );
  }
}

class _DesktopScaffold extends StatelessWidget {
  const _DesktopScaffold({
    required this.widget,
    required this.isPage,
    required this.withMenu,
  });

  final SmartDashScaffold widget;
  final bool isPage;
  final bool withMenu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          if (withMenu)
            SmartDashNavigationRail(
              location: widget.location,
            ),
          Expanded(
            child: Padding(
              padding: isPage
                  ? EdgeInsets.zero
                  : const EdgeInsets.all(
                      24.0,
                    ),
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileScaffold extends StatelessWidget {
  const _MobileScaffold({
    required GlobalKey<ScaffoldState> scaffoldKey,
    required this.isPage,
    required this.child,
    required this.location,
    required this.withMenu,
    required this.withBottomBar,
  }) : _scaffoldKey = scaffoldKey;

  final GlobalKey<ScaffoldState> _scaffoldKey;

  final bool isPage;
  final Widget child;
  final bool withMenu;
  final bool withBottomBar;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      drawerEnableOpenDragGesture: true,
      drawer: NavigationDrawer(
        elevation: 8.0,
        selectedIndex: -1,
        onDestinationSelected: (index) {
          Navigator.pop(context);
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
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
      body: withMenu
          ? _StackedMenu(
              scaffoldKey: _scaffoldKey,
              child: Padding(
                padding: isPage
                    ? EdgeInsets.zero
                    : const EdgeInsets.all(
                        16.0,
                      ),
                child: child,
              ),
            )
          : Padding(
              padding: isPage
                  ? EdgeInsets.zero
                  : const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ).copyWith(top: 24.0),
              child: child,
            ),
      bottomNavigationBar: withBottomBar
          ? SmartDashNavigationBar(
              location: location,
            )
          : null,
    );
  }
}

class _StackedMenu extends StatelessWidget {
  const _StackedMenu({
    required this.child,
    required GlobalKey<ScaffoldState> scaffoldKey,
  }) : _scaffoldKey = scaffoldKey;

  final Widget child;
  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: child,
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
    );
  }
}
