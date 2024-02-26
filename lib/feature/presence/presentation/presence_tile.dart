import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_dash/core/presentation/widget/tile/smart_dash_tile.dart';
import 'package:smart_dash/feature/presence/application/presence_service.dart';

class PresenceTile extends ConsumerWidget {
  const PresenceTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final service = ref.read(presenceServiceProvider);
    return StreamBuilder<PresenceEvent>(
      stream: service.events,
      initialData: service.lastEvent.orElseNull,
      builder: (context, snapshot) {
        final e = snapshot.data;
        final members = e?.state.members ?? [];
        return SmartDashTile(
            constraints: const BoxConstraints(
              minWidth: 270,
              minHeight: 270,
            ),
            title: 'Presence Now',
            subTitle: e?.state.token.label ?? '-',
            leading: const Icon(
              Icons.home_work,
              color: Colors.lightGreen,
            ),
            trailing: Text(
              snapshot.hasData
                  ? e?.state.isHome == true
                      ? '${e!.state.members.length} is HOME'
                      : 'AWAY'
                  : '-',
              style: const TextStyle(
                color: Colors.lightGreen,
                fontWeight: FontWeight.bold,
              ),
              textScaler: const TextScaler.linear(1.2),
            ),
            body: ListView(
              children: members
                  .map((e) => ListTile(
                        title: Text(e.label),
                        leading: const Icon(Icons.home),
                      ))
                  .toList(),
            ));
      },
    );
  }
}
