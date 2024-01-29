import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_dash/core/presentation/pages.dart';

class SmartDashNavigationBar extends StatefulWidget {
  const SmartDashNavigationBar({
    super.key,
    required this.location,
  });

  final String location;

  @override
  State<SmartDashNavigationBar> createState() => _SmartDashNavigationBarState();
}

class _SmartDashNavigationBarState extends State<SmartDashNavigationBar> {
  int _selectedIndex = 0;

  int nextIndex() {
    final nextIndex = Pages.indexOf(widget.location);
    return nextIndex > -1 ? nextIndex : _selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: _selectedIndex = nextIndex(),
      onDestinationSelected: (int index) {
        context.go(Pages.locations[index]);
      },
      // TODO: build nav bar destinations from shared source
      destinations: const [
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
        NavigationDestination(
          icon: Icon(
            Icons.history_outlined,
          ),
          selectedIcon: Icon(Icons.history),
          label: 'History',
          tooltip: 'History',
        ),
        NavigationDestination(
          icon: Badge(
            child: Icon(
              Icons.notifications_none_outlined,
            ),
          ),
          selectedIcon: Icon(Icons.notifications),
          label: 'Notifications',
          tooltip: 'Notifications',
        ),
      ],
    );
  }
}
