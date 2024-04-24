import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/core/presentation/widget/load/async_load_screen.dart';
import 'package:smart_dash/feature/system/application/connectivity_service.dart';
import 'package:smart_dash/feature/system/domain/connectivity.dart';
import 'package:smart_dash/feature/system/presentation/connectivity/connectivity_controller.dart';
import 'package:smart_dash/util/time/date_time.dart';

class ConnectivityScreen extends ConsumerStatefulWidget {
  const ConnectivityScreen({
    super.key,
    required this.location,
  });

  final String location;

  @override
  ConsumerState<ConnectivityScreen> createState() => _ConnectivityScreenState();
}

class _ConnectivityScreenState extends ConsumerState<ConnectivityScreen> {
  @override
  Widget build(BuildContext context) {
    return AsyncLoadScreen<ConnectivityQuery, List<Connectivity>,
        ConnectivityScreenController>(
      title: 'System Health',
      onClose: () => context.go(widget.location),
      scrollable: true,
      query: ConnectivityQuery(),
      provider: connectivityScreenControllerProvider.call,
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
                        (context, Optional<ConnectivityState> state) {
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
      Optional<ConnectivityState> state,
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
