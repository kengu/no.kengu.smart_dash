import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gravatar/flutter_gravatar.dart';
import 'package:smart_dash_app/core/presentation/scaffold/smart_dash_bottom_sheet.dart';
import 'package:smart_dash_app/feature/notification/presentation/notification_badge.dart';

class AccountAvatar extends StatefulWidget {
  const AccountAvatar({
    super.key,
    this.iconSize = 32,
    required this.children,
  });

  final double? iconSize;

  final List<Widget> children;

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
      icon: NotificationBadge(
        child: CircleAvatar(
          foregroundImage: Image.network(
            _gravatar!.imageUrl(),
            cacheWidth: 48,
            cacheHeight: 48,
            loadingBuilder: (_, __, ___) =>
                const Icon(CupertinoIcons.person_fill),
          ).image,
        ),
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
            return SmartDashBottomSheet(
              title: 'You',
              children: widget.children,
            );
          },
        );
      },
    );
  }
}
