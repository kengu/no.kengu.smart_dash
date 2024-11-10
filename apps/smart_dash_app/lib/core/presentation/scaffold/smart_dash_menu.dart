import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smart_dash_app/core/presentation/widget/smart_dash_toolbar.dart';
import 'package:smart_dash_app/feature/account/presentation/home_selector.dart';

class SmartDashTopMenu extends StatelessWidget {
  const SmartDashTopMenu({
    super.key,
    this.resolve,
    this.minWidth = 200,
    required this.onPressed,
  });

  final double minWidth;
  final VoidCallback onPressed;
  final Animation<double> Function(BuildContext context)? resolve;

  @override
  Widget build(BuildContext context) {
    if (resolve != null) {
      final animation = resolve!(context);
      return AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          return _build(animation.value);
        },
      );
    }
    return _build(1.0);
  }

  Container _build(double value) {
    final right = lerpDouble(0, minWidth - 20, value)! + 56;
    final left = lerpDouble(8, 10, value)!;
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
  }
}

class SmartDashBottomMenu extends StatelessWidget {
  const SmartDashBottomMenu({
    super.key,
    this.resolve,
    this.minWidth = 176,
    required this.children,
  });

  final double minWidth;
  final List<Widget> children;
  final Animation<double> Function(BuildContext context)? resolve;

  @override
  Widget build(BuildContext context) {
    if (resolve != null) {
      final animation = resolve!(context);
      return AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          return _build(animation.value);
        },
      );
    }
    return _build(1.0);
  }

  Container _build(double value) {
    final right = lerpDouble(0, minWidth, value)! + 76;
    return Container(
      padding: const EdgeInsets.only(left: 12, top: 8, bottom: 8),
      width: right,
      child: SizedBox(
        width: minWidth,
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          ),
        ),
      ),
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
