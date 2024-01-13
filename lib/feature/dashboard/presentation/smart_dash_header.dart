import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_dash/core/presentation/screens.dart';
import 'package:smart_dash/core/presentation/widget/responsive_widget.dart';

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
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const Spacer(flex: 1),
          if (ResponsiveWidget.isMobile(context))
            PopupMenuButton<String>(
              onSelected: (value) {
                context.go(value);
              },
              itemBuilder: (context) {
                return <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: Screens.pairing,
                    child: ListTile(
                      title: Text('ADD SERVICE'),
                      leading: Icon(Icons.device_unknown),
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: Screens.device,
                    child: ListTile(
                      title: Text('ADD DEVICE'),
                      leading: Icon(Icons.cloud),
                    ),
                  ),
                ];
              },
            )
          else ...[
            ElevatedButton(
              onPressed: () {
                context.go(Screens.pairing);
              },
              child: const Text('ADD SERVICE'),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                context.go(Screens.device);
              },
              child: const Text('ADD DEVICE'),
            ),
          ]
        ],
      ),
    );
  }
}
