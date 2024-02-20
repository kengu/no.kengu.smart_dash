import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_dash/core/presentation/scaffold/smart_dash_bottom_sheet.dart';
import 'package:smart_dash/core/presentation/screens.dart';
import 'package:smart_dash/feature/account/presentation/account_avatar.dart';
import 'package:smart_dash/util/widget.dart';

import 'smart_dash_menu.dart';

class SmartDashNavigationRail extends StatefulWidget {
  const SmartDashNavigationRail({
    super.key,
    required this.selected,
    required this.children,
    required this.locations,
  });

  final String selected;
  final List<String> locations;
  final List<NavigationRailDestination> children;

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
    final nextIndex = widget.locations.indexOf(widget.selected);
    return nextIndex > -1 ? nextIndex : _selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      elevation: 8.0,
      groupAlignment: -0.9,
      extended: _extended.value,
      selectedIndex: _selectedIndex = nextIndex(),
      leading: SmartDashTopMenu(
        resolve: NavigationRail.extendedAnimation,
        onPressed: () {
          setState(() {
            _extended.value = !_extended.value;
          });
        },
      ),
      trailing: const Expanded(
        child: SmartDashBottomMenu(
          resolve: NavigationRail.extendedAnimation,
          children: [
            CreateNewMenuButton(),
            AccountAvatar(),
          ],
        ),
      ),
      onDestinationSelected: (int index) {
        context.go(widget.locations[index]);
      },
      // TODO: build nav rail destinations from shared source
      destinations: widget.children,
    );
  }
}

class CreateNewMenuButton extends StatelessWidget {
  const CreateNewMenuButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add, size: 32),
      tooltip: 'Create new',
      onPressed: () {
        final screen = MediaQuery.of(context);
        showModalBottomSheet<void>(
          context: context,
          elevation: 0.0,
          useSafeArea: true,
          isDismissible: true,
          backgroundColor: Colors.transparent,
          constraints: BoxConstraints(minWidth: screen.size.width),
          builder: (BuildContext context) {
            final style = getLegendTextStyle(context);
            return SmartDashBottomSheet(title: 'Create', children: [
              ListTile(
                minLeadingWidth: 32.0,
                leading: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.add_home),
                ),
                title: const Text('Home'),
                subtitle: Text(
                  'Add new Home',
                  style: style,
                ),
                onTap: () {
                  context.pop();
                },
              ),
              ListTile(
                minLeadingWidth: 32.0,
                leading: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.devices),
                ),
                title: const Text('Device'),
                subtitle: Text(
                  'Pair with new Device',
                  style: style,
                ),
                onTap: () {
                  context
                    ..pop()
                    ..push(Screens.pairing);
                },
              ),
            ]);
          },
        );
      },
    );
  }
}
