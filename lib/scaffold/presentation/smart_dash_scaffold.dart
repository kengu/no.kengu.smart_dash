import 'package:flutter/material.dart';
import 'package:smart_dash/constant/pages.dart';
import 'package:smart_dash/scaffold/presentation/smart_dash_menu.dart';
import 'package:smart_dash/scaffold/presentation/smart_dash_navigation_bar.dart';
import 'package:smart_dash/scaffold/presentation/smart_dash_navigation_rail.dart';
import 'package:smart_dash/widget/responsive_widget.dart';
import 'package:smart_dash/widget/smart_dash_toolbar.dart';

class SmartDashScaffold extends StatelessWidget {
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

  bool get isPage => Pages.indexOf(location) > -1;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      // Scaffold with bottom navigation bar
      mobile: Scaffold(
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
            ? StackedMenu(
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
        bottomNavigationBar: SmartDashNavigationBar(
          location: location,
        ),
      ),
      // Scaffold with navigation rail
      desktop: Scaffold(
        body: Row(
          children: [
            SmartDashNavigationRail(
              location: location,
            ),
            Expanded(
              child: Padding(
                padding: isPage
                    ? EdgeInsets.zero
                    : const EdgeInsets.all(
                        24.0,
                      ),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StackedMenu extends StatelessWidget {
  const StackedMenu({
    super.key,
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
