import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_dash/feature/presence/application/presence_service.dart';

class PresenceTile extends ConsumerWidget {
  const PresenceTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final service = ref.read(presenceServiceProvider);
    return StreamBuilder<PresenceEvent>(
      stream: service.presence,
      initialData: service.state.orElseNull,
      builder: (context, snapshot) {
        final e = snapshot.data;
        return Center(
          child: Text(
            '${e?.token.label} is ${e?.data == true ? 'is HOME' : 'is AWAY'}',
          ),
        );
      },
    );
  }
}
