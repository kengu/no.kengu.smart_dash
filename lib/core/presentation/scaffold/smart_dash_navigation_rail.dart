import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_dash/core/presentation/dialog.dart';
import 'package:smart_dash/core/presentation/scaffold/smart_dash_bottom_sheet.dart';
import 'package:smart_dash/core/presentation/screens.dart';
import 'package:smart_dash/core/presentation/smart_dash_icons_icons.dart';
import 'package:smart_dash/core/presentation/widget/snackbar/snackbar_controller.dart';
import 'package:smart_dash/feature/account/presentation/account_avatar.dart';
import 'package:smart_dash/feature/flow/presentation/flow_routes.dart';
import 'package:smart_dash/feature/home/application/home_service.dart';
import 'package:smart_dash/feature/notification/presentation/notification_badge.dart';
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
    final style = getLegendTextStyle(context);
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
      trailing: Expanded(
        child: SmartDashBottomMenu(
          resolve: NavigationRail.extendedAnimation,
          children: [
            const CreateNewMenuButton(),
            AccountAvatar(
              children: [
                ListTile(
                  minLeadingWidth: 32.0,
                  leading: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(Icons.person),
                  ),
                  title: const Text('Account'),
                  subtitle: Text(
                    'Manage this account',
                    style: style,
                  ),
                  onTap: () {
                    context
                      ..pop()
                      ..push(Screens.account);
                  },
                ),
                ListTile(
                  minLeadingWidth: 32.0,
                  leading: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: NotificationBadge(
                      child: Icon(Icons.notifications),
                    ),
                  ),
                  title: const Text('Notifications'),
                  subtitle: Text(
                    'Manage your notifications',
                    style: style,
                  ),
                  onTap: () {
                    context
                      ..pop()
                      ..push(Screens.notifications);
                  },
                ),
                ListTile(
                  minLeadingWidth: 32.0,
                  leading: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(Icons.devices),
                  ),
                  title: const Text('Paired devices'),
                  subtitle: Text(
                    'Manage your devices',
                    style: style,
                  ),
                  onTap: () {
                    context
                      ..pop()
                      ..push(Screens.devices);
                  },
                ),
                const Divider(),
                ListTile(
                  minLeadingWidth: 32.0,
                  leading: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(Icons.settings),
                  ),
                  title: const Text('Settings'),
                  subtitle: Text(
                    'Customize this application',
                    style: style,
                  ),
                  onTap: () {
                    context
                      ..pop()
                      ..push(Screens.settings);
                  },
                ),
              ],
            ),
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

class CreateNewMenuButton extends ConsumerWidget {
  const CreateNewMenuButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                onTap: () async {
                  context.pop();
                  final name = await showTextInputDialog(
                    context,
                    title: 'Add Home',
                    hint: 'Enter Name',
                  );
                  if (name?.isNotEmpty == true) {
                    final home =
                        await ref.read(homeServiceProvider).newHome(name!);

                    if (home.isPresent) {
                      if (!context.mounted) return;
                      SnackbarController.showSnackBarByRef(
                        context,
                        ref,
                        'Home $name was added',
                      );
                    }
                  }
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
              ListTile(
                minLeadingWidth: 32.0,
                leading: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(SmartDashIcons.process),
                ),
                title: const Text('Flow'),
                subtitle: Text(
                  'Add new Flow',
                  style: style,
                ),
                onTap: () async {
                  context.pop();
                  context.go(FlowRoutes.create);
                },
              ),
            ]);
          },
        );
      },
    );
  }
}
