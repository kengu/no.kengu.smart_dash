import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash_app/core/presentation/widget/tile/smart_dash_tile.dart';
import 'package:smart_dash_app/feature/snow/application/snow_manager.dart';
import 'package:smart_dash_app/feature/snow/domain/snow_state.dart';
import 'package:smart_dash_analytics/smart_dash_analytics.dart';

class SnowNowTile extends ConsumerWidget {
  SnowNowTile({
    super.key,
    required this.location,
  });

  final String location;

  final hf = DateFormat('HH:mm');
  final df = DateFormat('d. MMM. yyyy HH:mm');

  final constraints = const BoxConstraints(
    minWidth: 270,
    maxWidth: 800,
    minHeight: 180,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manager = ref.read(snowManagerProvider);
    final textStyle = Theme.of(context).textTheme.labelMedium;
    return StreamBuilder<SnowState>(
      stream: manager.getStateAsStream(location),
      initialData: manager.getCachedState(location).orElseNull,
      builder: (context, snapshot) {
        final state = Optional.ofNullable(snapshot.data);
        final snow = state.orElseNull;
        return SmartDashTile(
          title: 'Snow Depth Now',
          subtitle: '$location last updated '
              '${state.isPresent ? state.value.lastUpdated.format(prefixAgo: '') : '-'} ago',
          constraints: constraints.normalize(),
          leading: const Icon(
            CupertinoIcons.snow,
            color: Colors.lightGreen,
          ),
          trailing: Text(
            '${snow?.depth ?? '-'} cm',
            style: const TextStyle(
              color: Colors.lightGreen,
              fontWeight: FontWeight.bold,
            ),
            textScaler: const TextScaler.linear(1.2),
          ),
          body: ConstrainedBox(
            constraints: constraints.normalize(),
            child: state.isPresent
                ? ListView(children: [
                    ListTile(
                      leading: const Icon(Icons.scale),
                      title: Text('Weight', style: textStyle),
                      trailing:
                          Text('${snow!.equivalent} kg/m²', style: textStyle),
                    ),
                    ListTile(
                      leading: const Icon(Icons.height),
                      title: Text('Elevation', style: textStyle),
                      trailing: Text('${snow.elevation} m', style: textStyle),
                    ),
                    ListTile(
                      leading: const Icon(Icons.refresh),
                      title: Text('Next update', style: textStyle),
                      trailing: Text(
                          snow.nextUpdate.isToday
                              ? hf.format(snow.nextUpdate)
                              : df.format(snow.nextUpdate),
                          style: textStyle),
                    ),
                  ])
                : Center(
                    child: SizedBox(
                      width: 56,
                      height: 56,
                      child: CircularProgressIndicator(
                        color: Colors.lightGreen.withOpacity(0.6),
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
