import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smart_dash/core/presentation/widget/smart_dash_toolbar.dart';
import 'package:smart_dash/feature/home/presentation/home_selector.dart';

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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SmartDashToolbar(
      leading: IconButton(
        icon: widget.leading,
        onPressed: widget.onPressed,
      ),
      actions: const [
        HomeSelector(),
        SizedBox(width: 8),
      ],
    );
  }
}
