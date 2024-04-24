import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_dash/core/presentation/widget/badge_stream_widget.dart';
import 'package:smart_dash_notification/smart_dash_notification.dart';

class NotificationBadge extends ConsumerWidget {
  const NotificationBadge({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final service = ref.read(notificationServiceProvider);
    return BadgeStreamWidget(
      stream: service.active,
      initialData: service.activeCount,
      child: child,
    );
  }
}
