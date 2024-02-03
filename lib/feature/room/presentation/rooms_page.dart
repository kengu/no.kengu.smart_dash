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
        slotHeight: 270,
        pageItemBuilder: (rooms, type, slotsCount, item) {
          switch (item.identifier) {
            case 'measure_temperature:sikom:device:540242':
              return Stack(
                alignment: Alignment.center,
                children: [
                  ThermostatTile(
                    subTitle: 'Tindefjell',
                    thermostat: rooms.get(
                      item.identifier,
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('ON'),
                        Text('OFF'),
                      ],
                    ),
                  )
                ],
              );
            default:
              return Text(item.identifier);
          }
        });
  }
}
