import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gravatar/flutter_gravatar.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_dash/const/screens.dart';
import 'package:smart_dash/widget/smart_dash_toolbar.dart';

class SmartDashMenu extends StatelessWidget {
  const SmartDashMenu({
    super.key,
    this.minWidth = 200,
    required this.onPressed,
  });

  final double minWidth;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation =
        NavigationRail.extendedAnimation(context);

    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        final right = lerpDouble(0, minWidth - 20, animation.value)! + 56;
        final left = lerpDouble(8, 10, animation.value)!;
        return Container(
          padding: EdgeInsets.only(left: left, top: 8, bottom: 8),
          width: right,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: minWidth + 24,
              child: SmartDashMenuHeader(
                leading: const Icon(Icons.menu_outlined),
                onPressed: onPressed,
              ),
            ),
          ),
        );
      },
    );
  }
}

class SmartDashMenuHeader extends StatefulWidget {
  const SmartDashMenuHeader({
    super.key,
    required this.leading,
    required this.onPressed,
    this.closeOnAll = false,
  });

  final Widget leading;
  final bool closeOnAll;
  final VoidCallback onPressed;

  @override
  State<SmartDashMenuHeader> createState() => _SmartDashMenuHeaderState();
}

class _SmartDashMenuHeaderState extends State<SmartDashMenuHeader> {
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
    return SmartDashToolbar(
      leading: IconButton(
        icon: widget.leading,
        onPressed: widget.onPressed,
      ),
      actions: [
        SizedBox.square(
          dimension: 56,
          child: IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              if (widget.closeOnAll) {
                widget.onPressed();
              }
              context.go(Screens.settings);
            },
          ),
        ),
        IconButton(
          iconSize: 40,
          icon: CircleAvatar(
            foregroundImage: Image.network(
              _gravatar!.imageUrl(),
            ).image,
          ),
          onPressed: () {
            if (widget.closeOnAll) {
              widget.onPressed();
            }
            context.go(Screens.account);
          },
        ),
      ],
    );
  }
}
