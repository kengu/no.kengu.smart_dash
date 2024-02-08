import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_dash/feature/dashboard/presentation/smart_dashboard_page.dart';
import 'package:smart_dash/feature/device/presentation/tile/thermostat_tile.dart';

class RoomsPage extends ConsumerWidget {
  const RoomsPage({
    super.key,
    this.size = 90,
  });

  final int size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SmartDashboardPage(
        name: 'rooms',
        title: 'Rooms',
        slotHeight: 200,
        pageItemBuilder: (rooms, type, slotsCount, item) {
          return ThermostatTile(
            subTitle: 'Tindefjell',
            thermostat: rooms.get(
              item.identifier,
            ),
          );
        });
  }
}
