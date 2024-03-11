import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_dash/feature/notification/application/notification_service.dart';
import 'package:smart_dash/feature/notification/domain/notification.dart';
import 'package:smart_dash/core/presentation/widget/load/async_load_screen.dart';

import 'notification_screen_controller.dart';

class NotificationScreen extends ConsumerWidget {
  const NotificationScreen({
    super.key,
    required this.location,
  });

  final String location;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncLoadScreen<NotificationQuery, List<ActiveNotificationDetails>,
        NotificationScreenController>(
      title: 'Notifications',
      onClose: () => context.go(location),
      actions: [
        IconButton(
          tooltip: 'Acknowledge all',
          icon: const Icon(Icons.done_all),
          onPressed: () {
            context.go(location);
            ref.read(notificationServiceProvider).cancelAll();
          },
        )
      ],
      query: NotificationQuery(),
      provider: notificationScreenControllerProvider.call,
      builder: (context, ref, result, child) {
        final active = result.orElseNull ?? [];
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  active.isEmpty
                      ? 'No active notifications'
                      : 'There are ${active.length} active notifications',
                ),
              ),
            ),
            const Divider(),
            if (active.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: active.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: const Icon(Icons.notifications),
                    title: Text(active[index].title),
                    subtitle: Text(active[index].body),
                    trailing: IconButton(
                      icon: const Icon(Icons.check),
                      tooltip: 'Acknowledge',
                      onPressed: () => ref
                          .read(notificationServiceProvider)
                          .cancel(active[index].id),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
