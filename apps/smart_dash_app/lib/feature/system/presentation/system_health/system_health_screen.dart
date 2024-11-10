import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash_analytics/smart_dash_analytics.dart';
import 'package:smart_dash_app/core/presentation/widget/load/async_load_screen.dart';
import 'package:smart_dash_app/feature/system/application/system_health_service.dart';
import 'package:smart_dash_app/feature/system/domain/system_health.dart';
import 'package:smart_dash_app/feature/system/presentation/system_health/system_health_controller.dart';

class SystemHealthScreen extends ConsumerStatefulWidget {
  const SystemHealthScreen({
    super.key,
    required this.location,
  });

  final String location;

  @override
  ConsumerState<SystemHealthScreen> createState() => _SystemHealthScreenState();
}

class _SystemHealthScreenState extends ConsumerState<SystemHealthScreen> {
  @override
  Widget build(BuildContext context) {
    return AsyncLoadScreen<SystemHealthQuery, List<SystemHealth>,
        SystemHealthScreenController>(
      title: 'System Health',
      onClose: () => context.go(widget.location),
      scrollable: true,
      query: SystemHealthQuery(),
      provider: systemHealthScreenControllerProvider.call,
      actions: const [],
      builder: (context, ref, states, child) {
        return Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('See status overview for each integration below'),
              ),
            ),
            const Divider(),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (states.isPresent)
                  ...states.value.map(
                    (e) => _buildWithUpdates(e.service.key,
                        (context, Optional<SystemHealthState> state) {
                      final connectivity = state.orElseNull ?? e.state;
                      return ListTile(
                        title: Text(e.service.name),
                        subtitle: Text(
                          (connectivity.isOK
                              ? 'Integration is OK'
                              : 'Integration has failed\n${connectivity.reason}'),
                        ),
                        isThreeLine: connectivity.isFailed,
                        trailing: Text(
                          'Counter is ${connectivity.counter} '
                          '(${connectivity.when.format(prefixAgo: '')})',
                        ),
                      );
                    }),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildWithUpdates(
    String key,
    Widget Function(
      BuildContext context,
      Optional<SystemHealthState> state,
    ) builder,
  ) {
    final service = ref.read(connectivityServiceProvider);
    final events = service.events.where((e) => e.key == key);
    return StreamBuilder(
        stream: events,
        builder: (context, snapshot) {
          return builder(
            context,
            Optional.ofNullable(snapshot.data),
          );
        });
  }
}
