import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gravatar/flutter_gravatar.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_dash/core/presentation/scaffold/smart_dash_bottom_sheet.dart';
import 'package:smart_dash/core/presentation/screens.dart';
import 'package:smart_dash/util/widget.dart';

class AccountAvatar extends StatefulWidget {
  const AccountAvatar({
    super.key,
    this.iconSize = 32,
  });

  final double? iconSize;

  @override
  State<AccountAvatar> createState() => _AccountAvatarState();
}

class _AccountAvatarState extends State<AccountAvatar> {
  String? _email;
  Gravatar? _gravatar;

  @override
  void initState() {
    _email = "kengu@discoos.org";
    _gravatar = Gravatar(_email!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: widget.iconSize,
      icon: CircleAvatar(
        foregroundImage: Image.network(
          _gravatar!.imageUrl(),
          cacheWidth: 48,
          cacheHeight: 48,
          loadingBuilder: (_, __, ___) =>
              const Icon(CupertinoIcons.person_fill),
        ).image,
      ),
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
            return SmartDashBottomSheet(
              title: 'You',
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
            );
          },
        );
      },
    );
  }
}
