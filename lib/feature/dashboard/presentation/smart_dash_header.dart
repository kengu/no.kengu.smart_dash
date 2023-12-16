import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_dash/constant/screens.dart';
import 'package:smart_dash/widget/responsive_widget.dart';

class SmartDashHeader extends StatelessWidget {
  const SmartDashHeader({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: ResponsiveWidget.isAnyMobile(context) ? 48.0 : 0.0,
        bottom: 24,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const Spacer(flex: 1),
          ElevatedButton(
            onPressed: () {
              context.go(Screens.pairing);
            },
            child: const Text('ADD SERVICE'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go(Screens.device);
            },
            child: const Text('ADD DEVICE'),
          ),
        ],
      ),
    );
  }
}
