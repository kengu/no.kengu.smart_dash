import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/core/presentation/widget/tile/smart_dash_tile.dart';
import 'package:smart_dash/feature/snow/application/snow_service.dart';
import 'package:smart_dash/feature/snow/domain/snow_state.dart';
import 'package:smart_dash/util/time/date_time.dart';

class SnowNowTile extends ConsumerStatefulWidget {
  const SnowNowTile({
    super.key,
    required this.location,
  });

  final String location;

  @override
  ConsumerState<SnowNowTile> createState() => _SnowDepthNowState();
}

class _SnowDepthNowState extends ConsumerState<SnowNowTile> {
  late final SnowService service;
  final df = DateFormat('d.MM.yyyy HH:mm');
  final hf = DateFormat('HH:mm');

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
    final textStyle = Theme.of(context).textTheme.labelMedium;
    return FutureBuilder<Optional<SnowState>>(
      future: _getState(),
      initialData: service.getStateCached(widget.location),
      builder: (context, snapshot) {
        final state = snapshot.data!;
        final snow = state.orElseNull;
        return SmartDashTile(
          title: 'Snow Depth Now',
          subTitle: '${widget.location} last updated '
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
                      leading: const Icon(CupertinoIcons.gauge),
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

  Future<Optional<SnowState>> _getState() async {
    final state = await service.getState(widget.location);
    if (state.isPresent) {
      // Start timer that fires after earliest next state update time
      final nextUpdate = state.value.nextUpdate;
      final refresh =
          nextUpdate.add(const Duration(seconds: 1)).difference(DateTime.now());
      _timer?.cancel();
      _timer = Timer(refresh, () async {
        setState(() {});
      });
    }
    return state;
  }
}
