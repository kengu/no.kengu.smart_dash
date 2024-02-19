import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_dash/core/presentation/pages.dart';
import 'package:smart_dash/core/presentation/scaffold/smart_dash_bottom_sheet.dart';
import 'package:smart_dash/core/presentation/screens.dart';
import 'package:smart_dash/feature/account/presentation/account_avatar.dart';
import 'package:smart_dash/util/widget.dart';

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
      trailing: const Expanded(
        child: SmartDashBottomMenu(),
      ),
      onDestinationSelected: (int index) {
        context.go(Pages.locations[index]);
      },
      // TODO: build nav rail destinations from shared source
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: Text('Home'),
        ),
        NavigationRailDestination(
          icon: Icon(
            CupertinoIcons.rectangle_3_offgrid,
          ),
          selectedIcon: Icon(CupertinoIcons.rectangle_3_offgrid_fill),
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
    );
  }
}

class SmartDashBottomMenu extends StatelessWidget {
  const SmartDashBottomMenu({
    super.key,
    this.minWidth = 176,
  });

  final double minWidth;

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation =
        NavigationRail.extendedAnimation(context);

    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        final right = lerpDouble(0, minWidth, animation.value)! + 76;
        return Container(
          padding: const EdgeInsets.only(left: 12, top: 8, bottom: 8),
          width: right,
          child: SizedBox(
            width: minWidth,
            child: const Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CreateNewMenuButton(),
                  AccountAvatar(),
                ],
              ),
            ),
          ),
        );
      },
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
                    ..go(Screens.pairing);
                },
              ),
            ]);
          },
        );
      },
    );
  }
}
