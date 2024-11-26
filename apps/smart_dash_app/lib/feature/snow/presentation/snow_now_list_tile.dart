import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_dash_analytics/smart_dash_analytics.dart';
import 'package:smart_dash_app/core/presentation/widget/tile/smart_dash_tile.dart';
import 'package:smart_dash_snow/smart_dash_snow.dart';

class SnowNowListTile extends ConsumerWidget {
  const SnowNowListTile({super.key});

  final constraints = const BoxConstraints(
    minWidth: 270,
    maxWidth: 800,
    minHeight: 180,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final service = ref.watch(snowServiceProvider);
    return StreamBuilder<List<SnowState>>(
      stream: service.getStatesAsStream(refresh: true),
      initialData: service.getStatesCached().orElseNull,
      builder: (context, snapshot) {
        final states = snapshot.hasData ? snapshot.data! : <SnowState>[];
        return _buildTile(context, states);
      },
    );
  }

  SmartDashTile _buildTile(BuildContext context, List<SnowState> states) {
    final trailingTextStyle = Theme.of(context).textTheme.labelLarge;
    return SmartDashTile(
      title: 'Snow Depths Now',
      subtitle: 'Last updated '
          '${SnowState.toLatestUpdate(states).format(prefixAgo: '')} ago',
      constraints: constraints.normalize(),
      leading: const Icon(
        CupertinoIcons.snow,
        color: Colors.lightGreen,
      ),
      trailing: Text(
        '${states.length} places',
        style: const TextStyle(
          color: Colors.lightGreen,
          fontWeight: FontWeight.bold,
        ),
        textScaler: const TextScaler.linear(1.2),
      ),
      body: ConstrainedBox(
        constraints: constraints.normalize(),
        child: ListView(
          children: states
              .map((e) => ListTile(
                    leading: const Icon(Icons.line_axis),
                    title: Text(
                      e.location,
                      textScaler: const TextScaler.linear(0.8),
                    ),
                    subtitle: Text(
                      '${e.equivalent} kg/m² @ ${e.elevation} m',
                      textScaler: const TextScaler.linear(0.7),
                    ),
                    trailing: Text('${e.depth} cm', style: trailingTextStyle),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
