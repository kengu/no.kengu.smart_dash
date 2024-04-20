import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:optional/optional_internal.dart';
import 'package:smart_dash/feature/notification/application/notification_service.dart';
import 'package:smart_dash/feature/notification/domain/notification.dart';
import 'package:smart_dash/core/presentation/widget/load/async_load_screen.dart';
import 'package:smart_dash/util/time/date_time.dart';
import 'package:smart_dash/core/presentation/widget.dart';

import 'notification_screen_controller.dart';

class NotificationScreen extends ConsumerWidget {
  const NotificationScreen({
    super.key,
    required this.location,
  });

  final String location;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = getLegendTextStyle(context);
    return AsyncLoadScreen<NotificationQuery, List<NotificationModel>,
        NotificationScreenController>(
      title: 'Notifications',
      onClose: () => context.go(location),
      actions: [
        IconButton(
          tooltip: 'Acknowledge all',
          icon: const Icon(Icons.done_all),
          onPressed: () {
            context.go(location);
            ref.read(notificationServiceProvider).ackAll();
          },
        )
      ],
      query: NotificationQuery(),
      provider: notificationScreenControllerProvider.call,
      builder: (context, ref, result, child) {
        final active = _sort(result);
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
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          active[index].when.format(prefixAgo: ''),
                          style: style,
                          textScaler: const TextScaler.linear(0.9),
                        ),
                        IconButton(
                          icon: const Icon(Icons.done),
                          tooltip: 'Acknowledge',
                          onPressed: () => ref
                              .read(notificationServiceProvider)
                              .ack(active[index].id),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  List<NotificationModel> _sort(Optional<List<NotificationModel>> result) {
    final items = result.orElseNull?.toList() ?? [];
    items.sort((a, b) => b.when.compareTo(a.when));
    return items;
  }
}
