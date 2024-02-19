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
                return [
                  const PopupMenuItem<String>(
                    value: Screens.pairing,
                    child: ListTile(
                      title: Row(
                        children: [
                          Icon(Icons.add),
                          Text('PAIR DEVICE'),
                        ],
                      ),
                      leading: Icon(Icons.device_unknown),
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: Screens.devices,
                    child: ListTile(
                      title: Text('PAIRED DEVICES'),
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
              child: const Row(
                children: [
                  Icon(Icons.add),
                  Text('PAIR DEVICE'),
                ],
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                context.go(Screens.devices);
              },
              child: const Row(
                children: [
                  Icon(Icons.list),
                  Text('PAIRED DEVICES'),
                ],
              ),
            ),
          ]
        ],
      ),
    );
  }
}
