import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_dash/constant/pages.dart';

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
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: 'Home',
          tooltip: 'Home',
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
