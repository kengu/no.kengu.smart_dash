import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SmartDashNavigationBar extends StatefulWidget {
  const SmartDashNavigationBar({
    super.key,
    required this.selected,
    required this.children,
    required this.locations,
  });

  final String selected;
  final List<String> locations;
  final List<NavigationDestination> children;

  @override
  State<SmartDashNavigationBar> createState() => _SmartDashNavigationBarState();
}

class _SmartDashNavigationBarState extends State<SmartDashNavigationBar> {
  int _selectedIndex = -1;

  int nextIndex() {
    final nextIndex = widget.locations.indexOf(widget.selected);
    return nextIndex > -1 ? nextIndex : _selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: _selectedIndex = nextIndex(),
      onDestinationSelected: (int index) {
        context.go(widget.locations[index]);
      },
      destinations: widget.children,
    );
  }
}
