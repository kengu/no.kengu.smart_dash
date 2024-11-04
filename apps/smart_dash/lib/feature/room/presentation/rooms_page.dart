import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_dash/core/presentation/widget/smart_dash_error_widget.dart';
import 'package:smart_dash/core/presentation/widget/smart_dash_progress_indicator.dart';
import 'package:smart_dash/feature/account/presentation/home_controller.dart';
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
    return ref.watch(homeControllerProvider(const HomeQuery())).when(
        error: SmartDashErrorWidget.from,
        loading: SmartDashProgressIndicator.new,
        data: (data) {
          return SmartDashboardPage(
              name: 'rooms',
              title: 'Rooms',
              pageItemBuilder: (rooms, type, slotsCount, item) {
                return ThermostatTile(
                  subTitle: data.value.home.name,
                  thermostat: rooms.getToken(
                    item.identifier,
                  ),
                );
              });
        });
  }
}
