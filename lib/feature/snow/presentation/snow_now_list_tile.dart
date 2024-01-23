import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/core/presentation/widget/tile/smart_dash_tile.dart';
import 'package:smart_dash/feature/snow/application/snow_service.dart';
import 'package:smart_dash/feature/snow/domain/snow_state.dart';
import 'package:smart_dash/util/time/date_time.dart';

class SnowNowListTile extends ConsumerStatefulWidget {
  const SnowNowListTile({super.key});

  @override
  ConsumerState<SnowNowListTile> createState() => _SnowDepthNowState();
}

class _SnowDepthNowState extends ConsumerState<SnowNowListTile> {
  late final SnowService service;

  final constraints = const BoxConstraints(
    minWidth: 270,
    maxWidth: 800,
    minHeight: 180,
  );

  Timer? _timer;

  @override
  void initState() {
    service = ref.read(snowServiceProvider);
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final trailingTextStyle = Theme.of(context).textTheme.labelLarge;
    return FutureBuilder<Optional<List<SnowState>>>(
      future: _getStates(),
      initialData: service.getStatesCached(),
      builder: (context, snapshot) {
        final states =
            snapshot.data!.isPresent ? snapshot.data!.value : <SnowState>[];
        return SmartDashTile(
          title: 'Snow Depths Now',
          subTitle: 'Last updated '
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
                        trailing:
                            Text('${e.depth} cm', style: trailingTextStyle),
                      ))
                  .toList(),
            ),
          ),
        );
      },
    );
  }

  Future<Optional<List<SnowState>>> _getStates() async {
    final states = await service.getStates();
    if (states.isPresent) {
      // Start timer that fires after earliest next state update time
      final nextUpdate = SnowState.toEarliestNextUpdate(states.value);
      final refresh =
          nextUpdate.add(const Duration(seconds: 1)).difference(DateTime.now());
      _timer?.cancel();
      _timer = Timer(refresh, () async {
        setState(() {});
      });
    }

    return states;
  }
}
