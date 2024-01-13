import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_dash/const/pages.dart';

import 'smart_dash_menu.dart';

class SmartDashNavigationRail extends StatefulWidget {
  const SmartDashNavigationRail({
    super.key,
    required this.location,
  });

  final String location;

  @override
  State<SmartDashNavigationRail> createState() =>
      _SmartDashNavigationRailState();
}

class _SmartDashNavigationRailState extends State<SmartDashNavigationRail>
    with RestorationMixin {
  int _selectedIndex = 0;
  final _extended = RestorableBool(false);

  @override
  String? get restorationId => 'SmartDashScaffold';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_extended, 'extended');
  }

  int nextIndex() {
    final nextIndex = Pages.indexOf(widget.location);
    return nextIndex > -1 ? nextIndex : _selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      elevation: 8.0,
      groupAlignment: -0.9,
      extended: _extended.value,
      selectedIndex: _selectedIndex = nextIndex(),
      leading: SmartDashMenu(
        onPressed: () {
          setState(() {
            _extended.value = !_extended.value;
          });
        },
      ),
      onDestinationSelected: (int index) {
        context.go(Pages.locations[index]);
      },
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: Text('Home'),
        ),
        NavigationRailDestination(
          icon: Icon(
            Icons.history_outlined,
          ),
          selectedIcon: Icon(Icons.history),
          label: Text('History'),
        ),
        NavigationRailDestination(
          icon: Icon(
            Icons.video_camera_back_outlined,
          ),
          selectedIcon: Icon(Icons.video_camera_back),
          label: Text('Cameras'),
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
    );
  }
}
